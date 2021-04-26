<?php
/**
 * @brief Funciones necesarias para la ejecucion del SpeedDial. Cualquier cambio se ruega documentar.
 */

require_once '../DB/DBmock.php';
require_once '../Utils/config.php';

/**
 * @brief Funcion encargada de ejecutar el SpeedDial. @TODO agregar descripcion
 * @param $cdr CDR de la clase webcdr
 * @param $caller_exten string extension a llamar.
 * @param $exten
 * @param $Corp array arreglo con informacion extraida de la BD.
 */
function EjecSpeedDial(CDR $cdr, string $caller_exten, $exten, array $Corp) //ver si devuelve algo, como si se pudo ejecutar normal
{
    //@TODO VERIFICA RESTRICCIONES DE USER Y CORP
    /* Obtengo info de user */
    echo "Get information for {$caller_exten}";
    $res = GetInfoUser();
    $user = $res;
    if (!$user) {
        echo "** EXTEN DISABLED OR NOT FOUND **";
        exit;
    }

    echo "Searh Speeddial {$caller_exten}";
    $res = GetSpeedDials();


    if (count($res) == 0) {
        echo "** SPEEDDIAL NOT FOUND **";
    }

    $corpRest = null;
    $extenRest = null;
    $tmp = $res;
    //@TODO Ver para q hace esto y si se puede mejorar
    while ($tmp) {

        if ($tmp['rtype'] == 0 and is_null($corpRest)) {
            $corpRest = $tmp;
        } else if ($tmp['rtype'] == 1 and is_null($extenRest)) {
            $extenRest = $tmp;
        }

    }

    if (!is_null($corpRest)) {

        switch ($corpRest['permit']) {
            case 0:

                /* Corp Restringida */
                $tmp = $corpRest;
                break;
            case 1:
                if (!is_null($extenRest)) {
                    /* Corp permitida / aplican restricciones de la extension */
                    $tmp = $extenRest;
                } else {
                    /* Corp permitida y extension sin restricciones */
                    $tmp = $corpRest;
                }
                break;
            case 2:
                if (!is_null($extenRest) && $extenRest['permit'] == 0) {
                    /* Corp con pin y extension restringida */
                    $tmp = $extenRest;
                } else {
                    /* Corp sin restriccion / aplican restricciones de la extension */
                    $tmp = $corpRest;
                }
                break;
        }

    } elseif (!is_null($extenRest)) {
        /* Corp sin restriccion / aplican las restricciones de la extension */
        $tmp = $extenRest;
    }

    SearchAction($cdr, $tmp, $caller_exten, $Corp, $exten);

}

/**
 * @brief Busco la accion del speed dial y la ejecuto.
 * @param $cdr CDR objeto de la clase webcdr.
 * @param $action array datos extraidos de la BD.
 * @param $caller_exten string
 * @param $Corp array
 * @param $exten string
 */
function SearchAction(CDR $cdr, array $action, string $caller_exten, array $Corp, string $exten): void
{
    /* Guardo  */
    $tmp = $action['permit'];
    $tmp2 = $action['action'];

    if ($tmp == 2) {
        $cdr->step("Playing 'vm-password'");
        $result = $cdr->exec('Background', 'vm-password');
        /* Le paso el numero maximo de digitos (largo del pin) y contra q comparar */
        $pin = WaitForDigit($cdr, strlen($action['pin']), '');
        if ($pin == '') {
            $cdr->step("Error in get digits");
        }

    }

    switch ($tmp2) {
        case 'MeetMe':
            MeetMe($cdr, $tmp, $Corp);
            break;
        case 'VoiceMailMain':
            VoiceMail($cdr, $tmp, $caller_exten, $Corp);
            break;
        case 'ChanSpy':
            ChanSpy($cdr, $tmp, $Corp);
            break;
        case 'Whisper':
            Whisper($cdr, $tmp, $Corp);
            break;
        case 'Pickup':
            PickUp($cdr, $tmp, $caller_exten, $Corp, $exten);
            break;
        case 'sendvoicemail':
            SendVoiceMail($cdr, $Corp, $tmp);
            break;
        case 'reminder':
            Reminder($cdr, $tmp, $Corp, $caller_exten);
            break;
        case 'Forward':
            Forward($cdr, $caller_exten, $Corp);
            break;
        default:
            $cdr->close('** SPEEDDIAL NOT FOUND **');
            break;
    }

    exit;
}

/**
 * @brief Funcion encargada de ejecutar la funcion MeetMe
 * @param $cdr CDR Objeto de la clase webcdr.
 * @param $permit int valor entero que nos indica si esta restrigido o no
 * @param $Corp array
 */
function MeetMe(CDR $cdr, int $permit, array $Corp): void
{
    if ($permit != 0) {
        $cdr->step("Go to conference hall");
        $cdr->set_destination('MeetMe');
        $cdr->exec('MeetMe', $Corp['ID']);
        exit;
    } else {
        $cdr->close('** CALL RESTRICTED **');
        exit;
    }
}

/**
 * @brief Funcion encargada de la ejecuion del SpeedDial "VoiceMail".
 * @param $cdr CDR Objeto de la clase webcdr
 * @param $tmp int entero que indica si esta restringido o no.
 * @param $caller_exten string extension a quien se llama.
 * @param $Corp array Informacion de la corporacion extraida de la BD.
 */
function VoiceMail(CDR $cdr, int $tmp, string $caller_exten, array $Corp): void
{
    if ($tmp != 0) {
        $cdr->step("Go to voicemail");
        $cdr->set_destination('VoiceMailMain');
        $cdr->exec('VoiceMailMain', $caller_exten . '@' . $Corp['ID']);
        exit;
    } else {
        $cdr->close('** CALL RESTRICTED **');
        exit;
    }
}

/**
 * @brief Funcion encargada de la ejecucion del Speeddial ChanSpy
 * @param $cdr CDR
 * @param $tmp int
 * @param $Corp array
 */
function ChanSpy(CDR $cdr, int $tmp, array $Corp): void
{
    if ($tmp != 0) {
        $cdr->step("Playing request of number");

        //Solicito la extension a la que quiere llamar
        //@TODO Verificar si se usa o como se usa. Falta if de la linea 230 de Salientes
        $result = $cdr->exec('Background', 'extension'); // extension press-1 enter-ext-of-person

        $dest_numb = WaitForDigit($cdr, 0, '0');

        $cdr->step('Caller marked: ' . $Corp['ID'] . '_' . $dest_numb);

        $spy = SpyEnabled($dest_numb, $Corp);

        if ($spy) {

            $cdr->exec('ChanSpy', 'SIP/' . $Corp['ID'] . '_' . $dest_numb);

        } else {

            $cdr->step('Extension ' . $Corp['ID'] . '_' . $dest_numb . " has spy deactivated o no exist");
        }
        exit;

    } else {
        $cdr->close('** CALL RESTRICTED ** ');
        exit;
    }
}


/**
 * @brief Funcion encargada de la ejecucion del Speeddial Whisper.
 * @param $cdr CDR
 * @param $tmp int
 * @param $Corp array
 */
function Whisper(CDR $cdr, int $tmp, array $Corp): void
{
    if ($tmp['permit'] != 0) {

        $cdr->step('Playing request of number');
        $result = $cdr->exec('Background', 'extension');
        $cdr->step('4');

        $dest_numb = WaitForDigit($cdr, 0, '0');

        $cdr->step('Caller marked: ' . $Corp['ID'] . '_' . $dest_numb);
        if ($spy = SpyEnabled($dest_numb, $Corp)) {

            $params = array('SIP/' . $Corp['ID'] . '_' . $dest_numb, 'w');
            $cdr->exec('ChanSpy', $params);
        } else {
            $cdr->step('');
            $cdr->step('Extension ' . $Corp['ID'] . '_' . $dest_numb . " has spy deactivated o doesnt exist");
        }
    } else {
        $cdr->close('** CALL RESTRICTED **');
    }

    exit;
}

/**
 * @brief Funcion encargada de ejecutar el speeddial PickUp.
 * @param $cdr CDR
 * @param int $tmp
 * @param $caller_exten string
 * @param $Corp array
 * @param $exten string
 */
function PickUp(CDR $cdr, int $tmp, string $caller_exten, array $Corp, string $exten): void
{
    $CorpID = $cdr->get_pbx();
    //necesito la extension q quiero llamar
    if ($tmp != 0) {

        $arg = GetDelimeters($exten);

        if (count($arg) == 2) {

            $exten_pickup = strstr($arg[1], '_') == false ? $CorpID . '_' . $arg[1] : $arg[1];

            $cdr->step("Pickup extension {$arg[1]}");
            $cdr->set_destination('Pickup');
            $cdr->exec('pickupchan', 'SIP/' . $exten_pickup); //@TODO No va a funcionar por SIP(PJSIP).
            exit;

        } else {

            $cdr->step("Get information for2 {$caller_exten[1]}");
            $query_pk = "Select algo";
            $res_pk = GetNumbers();

            $nums = array();
            /* Armo el arreglo de numeros a llamar */
            $i = 0;
            while ($nums_pk = $res_pk['i']) {
                $i++;
                array_push($nums, 'PJSIP/' . $Corp['ID'] . '_' . $nums_pk['number']);
            }

            if (count($nums)) {
                $cdr->step("Pickup Group");
                $cdr->set_destination('Pickup');
                $cdr->exec('pickupchan', implode('&', $nums));
            } else {
                exit;
            }
            exit;
        }
    } else {
        $cdr->close('** CALL RESTRICTED **');
        exit;
    }
}

/**
 * @brief Funcion encargada de ejecutar el speeddial send voice mail.
 * @param $cdr CDR
 * @param $Corp array
 * @param int $tmp
 */
function SendVoiceMail(CDR $cdr, array $Corp, int $tmp): void
{
    if ($tmp != 0) {
        $cdr->step("Go to Outbound Voicemail");

        $dest_numb = '';
        $retry = true;
        $cant_retry = 0;

        while ($retry && $cant_retry < 3) {

            $cdr->step("Playing request of number");
            $result = $cdr->exec('Background', 'vm-enter-num-to-call');

            $dest_numb = WaitForDigit($cdr, 0, '0');

            $cdr->step('Caller marked: ' . $dest_numb);

            if ($dest_numb != '') {
                $cdr->exec('Background', 'number');
                $cdr->exec('Background', 'is');
                //@TODO verificar que funcione
                $cdr->say_number($dest_numb);
                $retry = false;

                if (!IsExten($dest_numb, $Corp['exteLen'], $Corp['ID'])) {
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

        $extenID = GetExtID();
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
        exit;

    } else {
        $cdr->close('** CALL RESTRICTED **');
        exit;
    }
}

/**
 * @brief Funcion encargada de ejecutar el SpeedDial "Reminder".
 * @param CDR $cdr
 * @param int $tmp
 * @param array $corp
 */
function Reminder(CDR $cdr, int $tmp, array $corp)
{
    if ($tmp == 0) {
        $cdr->close('** CALL RESTRICTED **');
        exit;
    }

    $cdr->step("Go to Reminder");

    /* Ingreso de exten */

    $cdr->step("Prompt Dest. Number");
    $dest_number = PromptData("vm-enter-num-to-call", $corp['extLen'], $cdr);
    $cdr->step("Dest. Number $dest_number");

    if (!IsExten($dest_number, $corp['extLen'], $corp['ID'])) {
        $cdr->exec('Playback', 'you-dialed-wrong-number&vm-goodbye');
        exit;
    }

    $date = InputDate($cdr);

    $query = "INSERT INTO";
    $cdr->log("SQL - $query");
    $res = true; //@TODO resultado de la query, es un INSERT.
    if (!$res) {
        $cdr->step('Reminder no pudo guardar reminder en bd');
        $cdr->exec('Playback', 'an-error-has-occured&please-try-again-later');
        exit;
    }

    $reminderID = 1;

    $filename = "reminders-$reminderID";

    $query = "Update blabla";
    $res = true; //@TODO resultado de la query, es un UPDATE.
    if (!$res) {
        $cdr->step('Reminder no pudo actualizar en bd nombre archivo audio');
        $cdr->exec('Playback', 'an-error-has-occured&please-try-again-later');
        exit;
    }
    //@TODO cambiar la ruta (verificar si esta bien en /tmp/)

    $user = GetInfoUser();

    $call_file = fopen("/home/{$filename}.call", "a+") or exit ("Unable to open file");
    fwrite($call_file, "Channel: SIP/{$corp['ID']}_$dest_number\n");
    fwrite($call_file, "CallerID: REMINDER <{$user['number']}> \n");
    fwrite($call_file, "Context: Voicemail\n");
    fwrite($call_file, "Extension: $reminderID\n");
    fwrite($call_file, "MaxRetries: 5\n");
    fwrite($call_file, "RetryTime: 300\n");
    fwrite($call_file, "Archive: Yes\n");
    fclose($call_file);

    if (!touch("/home/{$filename}.call", $date->format('U'))) {
        $cdr->step('Reminder no pudo editar el archivo call');
        //$res = $mysqli->query("DELETE FROM outboundvm WHERE ID = $reminderID"); @TODO Se borra el Reminder
        $cdr->log("SQL - query en Reminder");
        unlink("/home/{$filename}.call");
        exit("Unable to chango file datetime");
    }

    system("sudo mv /tmp/{$filename}.call /var/spool/asterisk/outgoing");

    $wav_filepath = WEB_SOUNDS_FOLDER . "reminders/Corp{$corp['ID']}}";

    if (!is_dir($wav_filepath)) {
        mkdir($wav_filepath, 0755);
    }

    $cancel = true;
    $cdr->step("Call recording into {$wav_filepath}/{$filename}.wav");
    $cdr->exec('Playback', 'vm-rec-temp');
    $asterisk = $cdr->get_agi();
    $result_record = $asterisk->record_file("{$wav_filepath}/{$filename}", 'wav', '#', '180000', NULL, true, NULL);

    if ($result_record['result'] != '48') { //recordar q el 48 ascii es 0
        $cdr->exec('Playback', 'to-listen-to-it&press-1');
        $result = $cdr->wait_for_digit(1500);

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
    } else if (!chmod($wav_filepath . $filename . ".wav", 0644)) {
        $cdr->step("Reminder no pudo cambiar permisos del audio");
    }

    exit;
}

/**
 * @brief Funcion encargada de ejecutar el SpeedDial de Forward
 * @param CDR $cdr
 * @param string $caller_exten
 * @param array $corp
 */
function Forward(CDR $cdr, string $caller_exten, array $corp): void
{
    $user = GetInfoUser();
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
 * @brief Funcion encargada de esperar que se marque el numero e informar sobre el mismo.
 * @param $cdr CDR objeto de la clase webcdr.
 * @param int $max_digit
 * @param string $digit
 * @return string Extension a la que se quiere llamar.
 */
function WaitForDigit(CDR $cdr, int $max_digit, string $digit): string
{
    if ($max_digit != 0) {
        $max_loop = $max_digit;
    } else {
        $max_loop = 255;
    }

    $no_loop = 0;
    $dest_number = '';

    while ($no_loop < $max_loop) {
        $cdr->step($no_loop);
        $no_loop++;
        $result = $cdr->wait_for_digit(2500);
        if ($result['result'] != $digit) {
            $dest_number .= chr($result['result']);

        } else {
            $no_loop = $max_loop;
        }
    }
    return $dest_number;
}

/**
 * @brief Funcion encargada de consultar si la opcion de espiar esta habilitada para esa extension.
 * @param $dest string
 * @param $Corp array
 * @return bool
 */
function SpyEnabled(string $dest, array $Corp): bool
{
    $res = isSpyEnabled();

    if ($spy = $res) {
        if ($spy['spyEnabled'] != '0') {
            return true;
        } else {
            return false;
        }
    } else {
        return false;
    }
}


/**
 * @brief Funcion utilizada SOLO por SpeedDial. @TODO agregar descripcion
 * @param string $promp
 * @param int $max_digit
 * @param CDR $cdr
 * @return string
 */
function PromptData(string $promp, int $max_digit, CDR $cdr): string
{
    $intents = 0;
    $max_intents = 3;

    /* Entra a la primera en el loop */
    do {
        $cdr->step("PrompData");
        $intents++;

        $res = $cdr->exec('Background', $prompt); //por favor ingrese dato
        if ($res['result'] != '0') {
            $value = chr($res['result']);
        }

        $value = WaitForDigit($cdr, $max_digit, '0');

        $cdr->step("PrompData input: $value");

        if ($value == '') {
            continue;
        }

        $cdr->exec('Playback', "you-have-dialed");
        $cdr->say_digits($value);

        $cdr->exec('Playback', "if-this-is-not-correct"); //no es correcto?
        $result = $cdr->exec('Background', "press-1"); //presione 1

        if (chr($result['result']) == '1') {
            $value = '';
            continue;
        }

        $result = $cdr->wait_for_digit(1500);
        if (chr($result['result']) == '1') {
            $value = '';
            continue;
        }

        break;

    } while ($intents < $max_intents);

    return $value;
}

/**
 * @brief Funcion encargada de devolver Año, mes, dia, horas y minutos.
 * @param CDR $cdr
 * @return DateTime
 */
function InputDate(CDR $cdr): DateTime
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
 * @param CDR $cdr
 * @param string $msg
 * @param string $digit
 * @param bool $data
 * @return array
 */
function Wait2Digit(CDR $cdr, string $msg, string $digit, bool $data): array
{
    if (!$data) {
        $cdr->exec('Background', $msg);
        $res = $cdr->wait_for_digit(1800);
        if (chr($res['result']) == $digit) {
            return array('result' => true);
        } else {
            return array('result' => false);
        }
    } else {
        $res = $cdr->exec('Background', $msg);
        if ($res['result'] == $digit) {
            $res = $cdr->wait_for_digit(1800);
            if ($res['result'] != $digit) {
                return $res .= chr($res['result']);
            }
        } else {
            return $res .= chr($res['result']);
        }
    }
}

?>