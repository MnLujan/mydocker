<?php
/**
 * @brief Clase IVR que ejecuta solo 2 funciones.
 */
require_once 'Db.php';
require_once 'Utils.php';

/**
 * @brief Ejecuta los audios de IVR.
 * @param CDR2 $cdr
 * @param array $datos
 * @return void
 */
function play_ivr(CDR2 $cdr, array $datos): void
{
    $max_attempts = 3;
    $cdr->step("Executing IVR: {$datos['name']}");

    $n_attempts_error = 0;
    while ($n_attempts_error < $max_attempts) {
        $n_attempts_error++;
        $opt = "";
        $cdr->step("Playing {$datos['sound']}");
        $result = $cdr->exec('Background', WEB_SOUNDS_FOLDER . $datos['sound']);

        if ($result['result'] != '0') {
            $cdr->step("No creo entrar aca, pero por las dudas vio");
            $opt .= chr($result['result']);
        }

        //posibilidad de marcar mas digitos hasta el valor extLen de la corpo
        $opt .= WaitForDigit($cdr, $datos['extLen'], '0');

        $NAME = substr($cdr->database_get('poll_exten'), 4);
        $exten = explode("-", $NAME);
        $q = $cdr->database_get('poll_queue') != null ? $cdr->database_get('poll_queue') : -1;
        $t = $cdr->database_get('poll_trunk');
        $cdr->step('Caller press: ' . $opt);

        if ($opt == '') {
            $opt = 0;
            $cdr->step('Executing Default Option 0');
        }

        // No uso ninguna opcion del ivr sino que marco directamente la extension
        if (isExten($opt, $datos['corpID'])) {
            $cdr->step("Executing Exten: {$opt}");
            dialExten("{$datos['corpID']}_{$opt}", $cdr, '');
        }

        // como ya viene con un dato, ya sea marcado o el silencio que por defecto es 0
        // solo los digitos que tengan opcion en ivr, se guardarán en ivr_answers
        if ($datos['option' . $opt] != '') {
            insert_IVR($cdr, $datos, $t, $q, $opt, $exten);
            ExecAction($cdr, $datos['option' . $opt]);

        }

        // si pasa las condiciones anteriores es porque lo marcado no tiene opcion en ivr
        if ($datos['soundIncorrect'] != '') {
            $cdr->exec('Background', WEB_SOUNDS_FOLDER . $datos['soundIncorrect']);
        }
        $cdr->step('** OPTION UNAVAILABLE **');
    }
}

function play_poll(CDR2 $cdr, array $datos)
{

    $max_attempts = 3;
    $cdr->step("Playing {$datos['sound']}");
    $cdr->exec('Playback', WEB_SOUNDS_FOLDER . $datos['sound']);

    //busqueda de preguntas de la pesquisa
    $questions = getPesquisa($datos);

    if (is_null($questions)) {
        $cdr->step("** IVR NOT FOUND");
        exit;
    }


    // para cada pregunta de la pesquisa
    foreach ($questions as &$question) {

        $cdr->step("Execute Question {$question[1]}");
        $opt = '';
        $n_attempts = 0;

        // tres intentos de ingreso de dato
        while ($n_attempts < $max_attempts) {
            $result = $cdr->exec('Background', WEB_SOUNDS_FOLDER . $question['sound']);
            if ($result['result'] != '0') {
                $cdr->step("resultado {$result['result']}");
                $opt = chr($result['result']);
                $n_attempts = $max_attempts;
                continue;
            }

            $result = $cdr->wait_for_digit(3000);

            if ($result['result'] != '0') {
                $cdr->step("resultado {$result['result']}");
                $opt = chr($result['result']);
                $n_attempts = $max_attempts;
                continue;
            }
            $n_attempts++;
        }

        $cdr->step('Caller press: ' . $opt);

        $NAME = substr($cdr->database_get('poll_exten'), 4);
        $exten = explode("-", $NAME);
        $q = $cdr->database_get('poll_queue') != null ? $cdr->database_get('poll_queue') : -1;
        $t = $cdr->database_get('poll_trunk');

        // solo si la respuesta es distinta de vacia se guarda el registro en la base de datos
        if ($opt != '') {
            insert_IVR($cdr, $datos, $t, $q, $opt, $exten);
        }

    }

}