<?php
/**
 * @brief Funciones necesarias para la ejecucion del SpeedDial. Cualquier cambio se ruega documentar.
 */

require_once 'Db.php';
require_once 'config.php';

/**
 * @brief Funcion encargada de ejecutar el SpeedDial correspondiente.
 * @param $cdr CDR2 de la clase webcdr
 * @param $exten string
 * @param $Corp array arreglo con informacion extraida de la BD.
 */
function EjecSpeedDial(CDR2 $cdr, string $exten, array $Corp) //ver si devuelve algo, como si se pudo ejecutar normal
{
    /* Obtengo info de user */
    $caller_exten = $cdr->get_caller_alone();

    $cdr->step("Get information for {$caller_exten}");

    $user = getInfouser($caller_exten, $Corp['ID']);

    if (!$user) {
        $cdr->step("** EXTEN DISABLED OR NOT FOUND **");
        exit;
    }

    $cdr->step("Search SpeedDial for $exten");

    $res = getSpeedDialsCorp($exten, $Corp['ID']);

    if (is_null($res)) {
        $cdr->step("** SpeedDial not found **");
    }

    $restriction = getRestriction($exten, $Corp['ID'], $caller_exten);

    if (!is_null($restriction)) {
        $cdr->step("** CALL RESTRICTED ** ");
        exit;
    }

    SearchAction($cdr, $res, $restriction, $caller_exten, $Corp);

}

/**
 * @brief Busco la accion del speed dial y la ejecuto.
 * @param $cdr CDR2 objeto de la clase webcdr.
 * @param $action array datos extraidos de la BD.
 * @param array|null $restricted
 * @param $caller_exten string
 * @param $Corp array
 */
function SearchAction(CDR2 $cdr, array $action, ?array $restricted, string $caller_exten, array $Corp): void
{
    $cdr->step("Entre a buscar la accion");

    /* Guardo  */
    $tmp = $restricted['permit'];
    $tmp2 = $action['action'];

    if ($tmp == 2) {
        $cdr->step("Playing 'vm-password'");
        $cdr->exec('Background', 'vm-password');

        /* Le paso el numero maximo de digitos (largo del pin) y contra q comparar */
        $pin = WaitForDigit($cdr, strlen($action['pin']), '0');
        if ($pin == '') {
            $cdr->step("Error in get digits");
        }

    }

    switch ($tmp2) {
        case 'MeetMe':
            MeetMe($cdr, $tmp, $Corp); //probado
            break;
        case 'VoiceMailMain':
            VoiceMail($cdr, $tmp, $caller_exten, $Corp); //probado
            break;
        case 'ChanSpy':
            ChanSpy($cdr, $tmp, $Corp); //probado, testear q se escuche
            break;
        //conectarme a la llamada y q me escuche un solo un ramal
        case 'Whisper':
            Whisper($cdr, $tmp, $Corp); //probado
            break;
        //capturar llamada, debe estar en el mismo grupo
        case 'Pickup':
            PickUp($cdr, $tmp, $caller_exten, $Corp);
            break;
        case 'sendvoicemail':
            SendVoiceMail($cdr, $Corp, $tmp);
            break;
        case 'reminder':
            Reminder($cdr, $tmp, $Corp, $caller_exten);
            break;
        //el campo externo debe estar seteado, y es para redireccionar una llamada q entre por el ramal.
        case 'Forward':
            Forward($cdr, $caller_exten, $Corp);
            break;
        default:
            if (preg_match('/(?P<type>enqueue|login|logout)\_(?P<id>\d+\_\d+)/', $tmp2, $match)) {
                Queue($cdr, $match);
            } else {
                $cdr->close('** SPEEDDIAL NOT FOUND **');
            }
            break;
    }

    exit;
}

/**
 * @brief Funcion encargada de ejecutar la funcion MeetMe
 * @param $cdr CDR2 Objeto de la clase webcdr.
 * @param int|null $permit int valor entero que nos indica si esta restrigido o no
 * @param $Corp array
 */
function MeetMe(CDR2 $cdr, ?int $permit, array $Corp): void
{
    if ($permit == null) {
        $cdr->step("Go to conference hall");
        $cdr->set_destination('MeetMe');
        $cdr->exec('ConfBridge', $Corp['ID']);
    } else {
        $cdr->close('** CALL RESTRICTED **');
    }
    exit;
}

/**
 * @brief Funcion encargada de la ejecuion del SpeedDial "VoiceMail".
 * @param $cdr CDR2 Objeto de la clase webcdr
 * @param int|null $tmp int entero que indica si esta restringido o no.
 * @param $caller_exten string extension a quien se llama.
 * @param $Corp array Informacion de la corporacion extraida de la BD.
 */
function VoiceMail(CDR2 $cdr, ?int $tmp, string $caller_exten, array $Corp): void
{
    if ($tmp == null) {
        $cdr->step("Go to voicemail");
        $cdr->set_destination('VoiceMailMain');
        $cdr->exec('VoiceMailMain', $caller_exten . '@' . $Corp['ID']);
    } else {
        $cdr->close('** CALL RESTRICTED **');
    }
    exit;
}

/**
 * @brief Funcion encargada de la ejecucion del Speeddial ChanSpy
 * @param $cdr CDR2
 * @param $tmp int|null
 * @param $Corp array
 */
function ChanSpy(CDR2 $cdr, ?int $tmp, array $Corp): void
{
    if (is_null($tmp)) {
        $cdr->step("Playing request of number");

        //Solicito la extension a la que quiere llamar
        $cdr->exec('Background', 'extension'); // extension press-1 enter-ext-of-person

        $dest_numb = WaitForDigit($cdr, $Corp['extLen'], '0');

        $cdr->step('Caller marked: ' . $Corp['ID'] . '_' . $dest_numb);

        if (isSpyEnabled($dest_numb, $Corp['ID']) && isExten($dest_numb, $Corp['ID'])) {

            $cdr->exec('ChanSpy', 'PJSIP/' . $Corp['ID'] . '_' . $dest_numb);

        } else {

            $cdr->step('Extension ' . $Corp['ID'] . '_' . $dest_numb . " has spy deactivated o no exist");
        }

    } else {
        $cdr->close('** CALL RESTRICTED ** ');
    }
    exit;
}


/**
 * @brief Funcion encargada de la ejecucion del Speeddial Whisper.
 * @param $cdr CDR2
 * @param $tmp int|null
 * @param $Corp array
 */
function Whisper(CDR2 $cdr, ?int $tmp, array $Corp): void
{
    if (is_null($tmp)) {

        $cdr->step('Playing request of number');
        $cdr->exec('Background', 'extension');

        $dest_numb = WaitForDigit($cdr, $Corp['extLen'], '0');

        $cdr->step('Caller marked: ' . $Corp['ID'] . '_' . $dest_numb);
        if (isSpyEnabled($dest_numb, $Corp['ID'] && isExten($dest_numb, $Corp['ID']))) {

            $params = array('PJSIP/' . $Corp['ID'] . '_' . $dest_numb, 'w');
            $cdr->exec('ChanSpy', $params);
        } else {

            $cdr->step('Extension ' . $Corp['ID'] . '_' . $dest_numb . " has spy deactivated o doesnt exist");
        }
    } else {
        $cdr->close('** CALL RESTRICTED **');
    }

    exit;
}

/**
 * @brief Funcion encargada de ejecutar el speeddial PickUp.
 * @param $cdr CDR2
 * @param int|null $tmp
 * @param $caller_exten string
 * @param $Corp array
 */
function PickUp(CDR2 $cdr, ?int $tmp, string $caller_exten, array $Corp): void
{
    $CorpID = $cdr->get_Corp();

    //necesito la extension q quiero llamar
    if (is_null($tmp)) {

        $arg = getDelimiters();

        if (count($arg) == 2) {

            $exten_pickup = strstr($arg[1], '_') == false ? $CorpID . '_' . $arg[1] : $arg[1];

            $cdr->step("Pickup extension {$arg[1]}");
            $cdr->set_destination('Pickup');
            $cdr->exec('pickupchan', 'PJSIP/' . $exten_pickup);

        } else {
            //@TODO VERIFICAR LOS NUMEROS.
            $cdr->step("Get information for2 $caller_exten");

            $res_pk = getNumbers($caller_exten, $Corp['ID']);

            $nums = array();

            /* Armo el arreglo de numeros a llamar */
            while ($nums_pk = $res_pk->fetch_assoc()) {
                array_push($nums, 'PJSIP/' . $Corp['ID'] . '_' . $nums_pk['number']);
            }

            if (count($nums)) {
                $cdr->step("Pickup Group");
                $cdr->set_destination('Pickup');
                $cdr->exec('pickupchan', implode('&', $nums));
            } else {
                $cdr->step("No match group numbers");
                exit;
            }
        }
    } else {
        $cdr->close('** CALL RESTRICTED **');
    }
    exit;
}

/**
 * @brief Funcion encargada de ejecutar el speeddial send voice mail.
 * @param $cdr CDR2
 * @param $Corp array
 * @param int $tmp
 * @TODO Verificar SpeedDial. No esta terminado.
 */
function SendVoiceMail(CDR2 $cdr, array $Corp, int $tmp): void
{
    if ($tmp != 0) {
        $cdr->step("Go to Outbound Voicemail");

        $dest_numb = '';
        $retry = true;
        $cant_retry = 0;

        while ($retry && $cant_retry < 3) {

            $cdr->step("Playing request of number");
            $cdr->exec('Background', 'vm-enter-num-to-call');

            $dest_numb = WaitForDigit($cdr, 0, '0');

            $cdr->step('Caller marked: ' . $dest_numb);

            if ($dest_numb != '') {
                $cdr->exec('Background', 'number');
                $cdr->exec('Background', 'is');
                //@TODO verificar que funcione
                $cdr->say_number($dest_numb);
                $retry = false;

                if (!IsExten($dest_numb, $Corp['ID'])) {
                    $cdr->exec('Background', 'num-not-in-db');
                    $retry = true;
                    $dest_numb = '';
                } else {
                    $cdr->exec('Background', 'press-1');
                    $cdr->exec('Background', 'to-enter-a-diff-number');
                    $result = $cdr->wait_for_digit(2500);
                    if (chr($result['result']) == '1') {
                        $retry = true;
                        $dest_numb = '';
                    }
                }

            } else {
                $cant_retry++;

                if ($cant_retry == 3) {
                    $cdr->exec('Background', 'you-dialed-wrong-number');
                    $cdr->exec('Background', 'vm-goodbye');
                    exit;
                }
            }

        }
        //@TODO Ver como optimizar
        $cdr->step("Playing request of message");
        $cdr->exec('Background', 'press-0');
        $cdr->exec('Background', 'to-cancel-this-msg');

        $cdr->step("Call recording into " . defined('OUTBOUNDVM_FOLDER') ? OUTBOUNDVM_FOLDER : '/var/www/sounds/outboundvm/');
        $caller = $cdr->get_caller();
        $caller_exten = substr($caller, strripos($caller, '_') + 1);

        $time = new DateTime('now');
        $wav_filename = "outboundvm-" . $time->format('YmdHis') . $caller_exten . $dest_numb;
        $wav_filepath = defined('OUTBOUNDVM_FOLDER') ? OUTBOUNDVM_FOLDER : '/var/www/sounds/outboundvm/';

        $wav_filepath .= $wav_filename;
        $wav_filename .= ".wav";

        //$extenID = GetExtID();
        //@TODO Falta una funcion MySQL

        $outboundvm = GetOutBoundvm();
        $call_file = '';
        $cdr->database_put('call_file', $call_file);
        $cdr->set_outboundvm_id($outboundvm['ID']);

        $asterisk = $cdr->get_agi();

        $result_record = $asterisk->record_file($wav_filepath, 'wav', '0', '180000', NULL, true);

        /*  se compara el result en ASCII, ya que si se convierte a char
       coincice el digito ingresado "0" con el valor devuelto por hangup o timout.*/
        if ($result_record['result'] == '48') {

            $query = "DELETE ALGO"; //@TODO Query a realizar
            unlink($wav_filepath . "wav");

        }

    } else {
        $cdr->close('** CALL RESTRICTED **');
    }
    exit;
}

/**
 * @brief Funcion encargada de ejecutar el SpeedDial "Reminder".
 * @param CDR2 $cdr
 * @param int|null $tmp
 * @param array $corp
 * @param string $caller
 */
function Reminder(CDR2 $cdr, ?int $tmp, array $corp, string $caller)
{
    if ($tmp != null) {
        $cdr->close('** CALL RESTRICTED **');
        exit;
    }

    $cdr->step("Go to Reminder");

    /* Ingreso de exten */

    $cdr->step("Prompt Dest. Number");
    $dest_number = PromptData("vm-enter-num-to-call", $corp['extLen'], $cdr);
    $cdr->step("Dest. Number $dest_number");

    if (!isExten($dest_number, $corp['ID'])) {
        $cdr->exec('Playback', 'you-dialed-wrong-number&vm-goodbye');
        exit;
    }

    $date = InputDate($cdr);

    /* Devuelve el ID de la query, 0 si no se ejecuto con exito */
    $reminderID = createReminder($caller, $corp['ID'], $dest_number, $date, 0, 0);

    if (!$reminderID) {
        $cdr->step("Reminder no pudo guardar reminder en bd");
        $cdr->exec('Playback', 'an-error-has-occured&please-try-again-later');
        exit;
    }

    $filename = "reminders-$reminderID";

    $res = setAudiofilenameReminder($filename, $reminderID);

    if (!$res) {
        $cdr->step('Reminder no pudo actualizar en bd nombre archivo audio');
        $cdr->exec('Playback', 'an-error-has-occured&please-try-again-later');
        exit;
    }

    $user = getInfouser($caller, $corp['ID']);

    $call_file = fopen("/home/asterisk/{$filename}.call", "a+");
    fwrite($call_file, "Channel: PJSIP/{$corp['ID']}_$dest_number\n");
    fwrite($call_file, "CallerID: REMINDER <{$user['number']}> \n");
    fwrite($call_file, "Context: Voicemail\n");
    fwrite($call_file, "Extension: $reminderID\n");
    fwrite($call_file, "MaxRetries: 5\n");
    fwrite($call_file, "RetryTime: 300\n");
    fwrite($call_file, "Archive: Yes\n");
    fclose($call_file);

    if (!touch("/home/asterisk/{$filename}.call", $date->format('U'))) {
        $cdr->step("Reminder no pudo editar el archivo call");
        deleteReminder($reminderID); //Borro el recordatorio de la BD.
        $cdr->log("SQL - Delete Reminder");
        unlink("/home/{$filename}.call");
        exit("Unable to change file datetime");
    }

    system("mv /home/asterisk/{$filename}.call /var/spool/asterisk/outgoing");

    $wav_filepath = WEB_SOUNDS_FOLDER . "reminders/Corp{$corp['ID']}";

    if (!is_dir($wav_filepath)) {
        mkdir($wav_filepath, 0755, true);
    }

    $cancel = true;
    $cdr->step("Call recording into {$wav_filepath}/{$filename}.wav");
    $cdr->exec('Playback', 'vm-rec-temp');
    $asterisk = $cdr->get_agi();
    $result_record = $asterisk->record_file("{$wav_filepath}/{$filename}", "wav", "#", "10000", NULL, true, NULL);

    if ($result_record['result'] != '48') { //recordar q el 48 ascii es 0
        $cdr->exec('Playback', 'to-listen-to-it&press-1');
        $result = $cdr->wait_for_digit(3000);

        if (chr($result['result']) == '1') {
            $cdr->exec('Playback', "{$wav_filepath}/{$filename}");
        }

        $cancel = false;
        if (Wait2Digit($cdr, 'press-1', '1', false)) {
            $cancel = true;
        }
    }

    if ($cancel) {
        $query = "DELETE";
        $cdr->log("SQL - $query");
        //$res = $mysqli->query($query); @TODO Se borra el audio
        unlink("{$wav_filepath}/{$filename}.wav");
    } else if (!chmod($wav_filepath . "/" . $filename . ".wav", 0644)) {
        $cdr->step("Reminder no pudo cambiar permisos del audio");
    }

    exit;
}

/**
 * @brief Funcion encargada de ejecutar el SpeedDial de Forward
 * @param CDR2 $cdr
 * @param string $caller_exten
 * @param array $corp
 */
function Forward(CDR2 $cdr, string $caller_exten, array $corp): void
{
    $user = getInfouser($caller_exten, $corp['ID']);

    $option = "";
    if ($user['action'] == 'external_ring') {
        $cdr->exec('Playback', "call-forward&has-been-set-to");
        $cdr->say_digits($user['outer']);

        $option .= Wait2Digit($cdr, "to-enter-a-diff-number&press-1&to-change&status&press-2", "0", true);

        switch ($option) {
            case "1":
                /* Change Number */
                $number = PromptData("number", 14, $cdr);
                //$query = "UPDATE extens e SET e.outer = '$number' WHERE ID = '{$user['ID']}'";
                //@TODO Query a realizar
                $query = true;
                if ($query) {
                    $cdr->exec('Playback', "beep");
                } else {
                    $cdr->exec('Playback', "beep");
                }
                break;
            case "2":
                /* Disable */
                //$query = "UPDATE extens SET action = 'ring' WHERE ID = '{$user['ID']}'";
                //@TODO Query a realizar
                $query = true;
                if ($query) {
                    $cdr->exec('Playback', "call-forward&privacy-not&activated");
                } else {
                    $cdr->exec('Playback', "error");
                }
                break;
            default:
                break;
        }
    } else {
        $option .= Wait2Digit($cdr, "call-forward&privacy-not&activated&to-change&status&press-1", '0', true);
        if ($option == '1') {
            /* Enable */
            $number = PromptData("number", 14, $cdr);
            //$sql = "UPDATE extens e SET e.action = 'external_ring', e.outer = '$number' WHERE ID = '{$user['ID']}'";
            $sql = true;
            //@TODO Query a realizar
            if ($sql) {
                $cdr->exec('Playback', "call-forward&activated");
            } else {
                $cdr->exec('Playback', "error");
            }
        }
        exit;
    }
}

/**
 * @brief Funcion encargada de ejecutar el SpeedDial Queue
 * @param CDR2 $cdr
 * @param array $match
 */
function Queue(CDR2 $cdr, array $match): void
{
    $qid = substr($match['id'], strpos($match['id'], '_') + 1);
    $data = getQueue($qid);
    switch ($match['type']) {
        case 'login':
            loginQueue($cdr, $match, $data);
            break;
        case 'logout':
            logoutQueue($cdr, $match, $data);
            break;
        case 'enqueue':
            enQueue($cdr, $match, $data);
            break;

    }

}

/**
 * @brief Login a la Queue
 * @param CDR2 $cdr
 * @param array $match
 * @param array $data
 */
function loginQueue(CDR2 $cdr, array $match, array $data): void
{
    $caller = $cdr->get_caller();
    $cdr->step("Log in into Queue {$match['id']}({$data['name']})");
    $cdr->exec('AddQueueMember', array($match['id'], "SIP/$caller"));
    $cdr->step("........" . $cdr->get_variable('AQMSTATUS'));
    switch ($cdr->get_variable('AQMSTATUS')) {
        case "ADDED":
            $cdr->exec('Playback', "agent-loginok");
            break;
        case "MEMBERALREADY":
            $cdr->exec('Playback', "is-currently&in-the-queue");
            break;
        default:
            $cdr->exec('Playback', "error");
            break;
    }
    exit;
}

/**
 * @brief Ejecucion del Logout de las Queue
 * @param CDR2 $cdr
 * @param array $match
 * @param array $data
 */
function logoutQueue(CDR2 $cdr, array $match, array $data): void
{
    $caller = $cdr->get_caller();
    $cdr->step("Log out from Queue {$match['id']}({$data['name']})");
    $cdr->exec('RemoveQueueMember', array($match['id'], "SIP/$caller"));
    $cdr->step("........" . $cdr->get_variable('RQMSTATUS'));
    switch ($cdr->get_variable('RQMSTATUS')) {
        case "REMOVED":
            $cdr->exec('Playback', "agent-loggedoff");
            break;
        case "NOTINQUEUE":
            $cdr->exec('Playback', "is-not-set&in-the-queue");
            break;
        default:
            $cdr->exec('Playback', "error");
            break;
    }
    exit;
}

/**
 * @brief Ejecucion de sonar la Queue
 * @param CDR2 $cdr
 * @param array $match
 * @param array $data
 */
function enQueue(CDR2 $cdr, array $match, array $data)
{
    $cdr->step("Enqueue in ({$match['id']}) {$data['name']}");
    $ring = 'r';
    $file = glob(WEB_SOUNDS_FOLDER . "Queue" . $match['id'] . "/" . "*");
    if (is_array($file) && count($file) > 0) {
        $ring = '';
        $cdr->exec('Progress',"");
    }
    $applyTimeOut = $data['failovertimeout'] > 0 ? $data['failovertimeout'] : '';
    $cdr->exec('Queue', array($match['id'], $ring . 'kKtT', null, null, $applyTimeOut));
    $status = $cdr->get_variable('QUEUESTATUS');
    $cdr->step("Queue result: $status");
    if ($status == 'TIMEOUT' && $data['failoveraction'] != '') {
        ExecAction($cdr, $data['failoveraction']);
    }
    exit;
}

/**
 * @brief Funcion utilizada SOLO por SpeedDial. @TODO agregar descripcion
 * @param string $promp
 * @param int $max_digit
 * @param CDR2 $cdr
 * @return string
 */
function PromptData(string $promp, int $max_digit, CDR2 $cdr): string
{
    $intents = 0;
    $max_intents = 3;

    /* Entra a la primera en el loop */
    do {
        $cdr->step("PrompData");
        $intents++;

        $res = $cdr->exec('Background', $promp); //por favor ingrese dato

        $value = WaitForDigit($cdr, $max_digit, '0');

        $cdr->step("PrompData input: $value");

        if ($value == '') {
            continue;
        }

        /* Reproduzco los digitos ingresados */
        $cdr->exec('Playback', "you-have-dialed");
        $cdr->say_digits($value);

        $cdr->exec('Playback', "if-this-is-not-correct"); //no es correcto?
        $res = $cdr->exec('Background', "press-1"); //presione 1

        $result = $cdr->wait_for_digit(2500);
        if (chr($result['result']) != '1') {
            break;

        } else {
            $value = '';
            continue;
        }


    } while ($intents < $max_intents);

    return $value;
}

/**
 * @brief Funcion encargada de devolver Año, mes, dia, horas y minutos.
 * @param CDR2 $cdr
 * @return DateTime
 */
function InputDate(CDR2 $cdr): DateTime
{
    $year = date("Y");
    $month = date("m");
    $day = date("d");
    $hours = date("H");
    $minutes = date("i");

    $changedate = false;
    $cdr->exec('Playback', 'to-change-exp-date');
    $result = $cdr->exec('Background', 'press-1');

    if (chr($result['result']) == '1') {
        $changedate = true;
    } else {
        $result = $cdr->wait_for_digit(1500);
        if (chr($result['result']) == '1') {
            $changedate = true;
        }
    }

    if ($changedate) {

        /* Ingreso de Año, mes y dia */
        $cdr->step("Prompt Year");
        $year = PromptData("please-enter-the&year", 4, $cdr);
        $year = (strlen($year) == 2 ? '20' : '') . $year;
        $cdr->step("Year $year");

        $cdr->step("Prompt Month");
        $month = PromptData("please-enter-the&month", 2, $cdr);
        $month = (strlen($month) == 1 ? '0' : '') . $month;
        $cdr->step("Month $month");

        $cdr->step("Prompt Day");
        $day = PromptData("please-enter-the&day", 2, $cdr);
        $day = (strlen($day) == 1 ? '0' : '') . $day;
        $cdr->step("Day $day");
    }

    /* Minutos y segundos */
    $cdr->step("Prompt Hour");
    $cdr->exec('Playback', 'enter-a-time');
    $hours = PromptData("hours", 2, $cdr);
    $hours = (strlen($hours) == 1 ? '0' : '') . $hours;
    $cdr->step("Hour $hours");

    $cdr->step("Prompt Minutes");
    $minutes = PromptData("minutes", 2, $cdr);
    $minutes = (strlen($minutes) == 1 ? '0' : '') . $minutes;
    $cdr->step("Minutes $minutes");

    $dateString = "{$year}-{$month}-{$day} {$hours}:{$minutes}";
    $cdr->step("Reminder date: $dateString");
    $dateObj = DateTime::createFromFormat('Y-m-d H:i', $dateString);
    $errors = DateTime::getLastErrors();

    if (!empty($errors['warning_count'])) {
        $cdr->exec('Playback', 'invalid-date&vm-goodbye');
        exit;
    }

    return $dateObj;

}

/**
 * @brief Espera un digito especifico recibido como parametro.
 * @param CDR2 $cdr
 * @param string $msg
 * @param string $digit
 * @param bool $data
 * @return bool|string
 */
function Wait2Digit(CDR2 $cdr, string $msg, string $digit, bool $data): ?bool
{
    $cdr->exec('Background', $msg);
    $res = $cdr->wait_for_digit(5500);
    if (!$data) {
        if (chr($res['result']) == $digit) {
            return true;
        } else {
            return false;
        }
    } else {
        return $res .= chr($res['result']);
    }
}

?>