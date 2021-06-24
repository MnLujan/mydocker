<?php

/* Chequeos contra la BD */
require_once 'Db.php';
require_once 'config.php';

/**
 * @brief Funcion encargada de determinar el tipo de llamada que se quiere realizar. Hace validaciones contra
 * la BD.
 * @param $exten_info array
 * @param $destino string
 * @param $Corp array con informacion de la corporacion.
 * @return string que infora el tipo de llamada que se queire realizar.
 */
function WhatIs(array $exten_info, string $destino, array $Corp): string
{
    /* Primero verifico que este habilitada la extension desde donde estoy llamando */
    if (!isExten($exten_info[1], $Corp['ID'])) {
        return '';
    }

    /* Entrante Via Trasnfer */
    if (count($exten_info) == 1 && strlen($destino) == 2) {
        return "EntViaTransfer";

        /* SpeedDials */
    } else if (strlen($destino) == 2) {
        return "SpeedDial";

        /* SpeedDials2 */
    } else if (strlen($destino) == 1) {
        return "SpeedDial2";

        /* Saliente a una extension */
    } else if (isExten($destino, $Corp['ID'])) {
        return "SalExten";

    } else if (strlen($destino) > 4) {
        return "trunk";
    } else {
        return '';
    }

}

/**
 * @brief Configura los directorios de sonido y grabacion de existir.
 * @param CDR2 $cdr
 * @param array $Corp
 * @param bool $ent
 */
function Sounds(CDR2 $cdr, array $Corp, bool $ent): void
{
    if (!$ent) {
        $Corpid = $cdr->get_Corp();
    } else {
        $Corpid = $Corp['corp'];
    }

    $moh_file = glob(WEB_SOUNDS_FOLDER . "Corp" . $Corpid . "/moh/" . "*");
    if (is_array($moh_file) && count($moh_file) > 0) {
        $cdr->set_variable('CHANNEL(musicclass)', 'Corp' . $Corpid);
    }

    if ($Corp['monEnabled'] == '1' && $Corp['monPath'] != '') {
        $cdr->step("Enable Call Recording into {$Corp['monPath']}");
        $callFilePath = $Corp['monPath'] . "/";
        $cdr->database_put('call_file_path', $callFilePath);
        $cdr->exec("mixmonitor", $Corp['monPath'] . "/" . $cdr->get_record_file() . ".wav,ab");
    }
}

/**
 * @brief Pide la password al user.
 * @param CDR2 $cdr
 * @param array $rest
 * @return string
 */
function getPass(CDR2 $cdr, array $rest): string
{

    $cdr->step("Playing 'vm-password'");
    $result = $cdr->exec('Background', 'vm-password');
    $i = 0;
    $pin = "";
    while ($i < strlen($rest['pin'])) {
        $i++;
        $result .= $cdr->wait_for_digit(3000);
        if ($result['result'] != '') {
            $pin .= chr($result['result']);
        } else {
            $cdr->step('Error in get digits');
            $i = strlen($rest['pin']);
        }
    }
    $cdr->step('Caller entered the pin: ' . $pin);
    return $pin;


}

/**
 * @brief Funcion encargada de ejecutar las acciones configuradas para el ramal.
 *        Acciones disponibles:
 *          - Followme.
 *          - Voicemail Directo.
 *          - Dual Ring.
 *          - Ring.
 *          - Ring directo a externo.
 * @param string $exten
 * @param CDR2 $cdr
 * @param string $onbusy
 */
function dialExten(string $exten, CDR2 $cdr, string $onbusy): void
{

    $cdr->step("Calling Exten: $exten");
    $tmp = explode('_', $exten);

    /* Se realiza un cambio de contexto */
    $cdr->set_context($tmp[0]);
    $data = extenAction($tmp); //se pide la accion para el numero de extension

    if ($onbusy != '') {
        $action = $onbusy;
        $cdr->step("Executing On Busy: $action");
    } else {
        $action = $data['action'];
    }

    $cdr->step("accion: $action");
    switch ($action) {
        case 'voicemail':
            $cdr->step("Redirect to VoiceMail");
            $cdr->exec('VoiceMail', $exten . '@' . $tmp[0]); //esto esta bien ?
            break;
        case 'ring':
            Ring($cdr, $exten, $data);
            break;
        case 'dual_ring':
            Dual_ring($cdr, $data, $exten);
            break;
        case 'external_ring':
            External_Ring($cdr, $data, $onbusy);
            break;
        case 'Followme':
            FollowMe($cdr, $data, $exten);
            break;
    }
    $cdr->close();
}

/**
 * @brief Ejecucion de la acciones segun la informacion pasada por parametro. <br>
 *      ACTIONS: <br>
 *      IVR -> ivr## -> ivr.php?id=## <br>
 *      Queue -> que## -> queue.php?id=##<br>
 *      Exten -> ext## -> extension.php?id=##<br>
 *      ExtenVM -> dvm## -> extensionVoiceMail.php?id=##<br>
 *      Group -> gr## -> group.php?id=##<br>
 *      Time -> tim## -> horarios.php?idCorp=##<br>
 *      Colgar -> hng<br>
 *
 * @param CDR2 $cdr
 * @param string $data
 */
function ExecAction(CDR2 $cdr, string $data): void
{
    $cdr->step("Execute $data");
    $tmp = substr($data, 0, 3);
    switch ($tmp) {
        case 'hng':
            $cdr->exec('Hangup', '');
            break;
        case 'ivr':
            ExecIVR($cdr, $data);
            break;
        case 'que':
            ExecQueue($cdr, $data);
            break;
        case 'ext':
            $ext = substr($data, 3);
            $cdr->step("Executing Exten: $ext");
            dialExten($ext, $cdr, '');
            break;
        case 'dvm':
            $exten = substr($data, 3);
            $tmp2 = explode('_', $exten);
            $cdr->step("Leave a VoiceMail");
            $cdr->exec('VoiceMail', $exten . '@' . $tmp2[0]);
            break;
        case 'tim':
            TimeOptions($cdr, $data);
            break;
        case 'int':
            Integracion($cdr, $data);
            break;
        default:
            $cdr->close("** ACTION NOT FOUND **");
            break;
    }
    exit;

}

function Ring(CDR2 $cdr, string $exten, array $datos)
{
    $caller = $cdr->get_pbx();
    $cdr->step("Calling Exten");
    $cdr->exec('Dial', array("PJSIP/$caller/$exten", AGI_DIAL_TIMEOUT, 'KktM(vsc-callid)'));
    $status = $cdr->get_variable('DIALSTATUS');
    if (!wasAnswered($status) && $datos['onbusy'] != '') {
        dialExten($exten, $cdr, $datos['onbusy']);
    }
}

/**
 * @brief Funcion encargada de ejecutra los IVR's correspondiente, respecto a su ID.
 * @param CDR2 $cdr
 * @param string $ivr
 */
function ExecIVR(CDR2 $cdr, string $ivr): void
{
    $id = substr($ivr, 3);
    $cdr->step("Executing IVR: $id");
    $cdr->exec('Ringing', '');
    $data = getIVR_action($id);
    if (!is_null($data)) {
        require_once 'IVR.php';
        if ($data['isPoll'] == '1') {
            play_poll($cdr, $data);
        } else {
            play_ivr($cdr, $data);
        }
    } else {
        $cdr->close('** IVR NOT FOUND **');
    }
}

/**
 * @brief Funcion encargada de ejecutar la accion de colas.
 * @param CDR2 $cdr
 * @param string $queue
 */
function ExecQueue(CDR2 $cdr, string $queue): void
{
    $id = substr($queue, 3);
    $qid = substr($queue, strpos($queue, '_') + 1);
    $dataqueue = getQueue($qid);

    $cdr->database_put('poll_queue', $qid);
    $cdr->step("Executing Queue: ($id) {$dataqueue['name']}");
    $file = glob(WEB_SOUNDS_FOLDER . "Queue" . $id . "/" . "*");
    $ring = 'r';
    if (is_array($file) && count($file) > 0) {
        $ring = '';
        $cdr->set_variable('CHANNEL(musicclass)', $id);
        $cdr->exec('Progress', array());
    }

    $applyTimeOut = $dataqueue['failovertimeout'] > 0 ? $dataqueue['failovertimeout'] : '';
    $cdr->exec('Queue', array($id, 'ckKt' . $ring, null, null, $applyTimeOut));
    $status = $cdr->get_variable('QUEUESTATUS');
    $cdr->step("Queue result: $status");

    if ($status == 'TIMEOUT' && $dataqueue['failoveraction'] != '') {
        ExecAction($cdr, $dataqueue['failoveraction']);
    } elseif ($dataqueue['ivr'] != '' && $status == 'CONTINUE') {
        $cdr->database_put('poll_exten', $cdr->get_variable('BRIDGEPEER'));
        ExecAction($cdr, $dataqueue['ivr']);
    } elseif ($status == '') {
        $cdr->step("**CLOSE EN EXECUTEACTION QUEUE**");
        $cdr->close('**CLOSE EN EXECUTEACTION QUEUE**');
    }

}

/**
 * @brief Funcion encargada de ejecutar la funcion "dual ring"
 * @param CDR2 $cdr
 * @param array $data
 * @param string $exten
 * @TODO ESTA FUNCION DEBERA CAMBIARSE POR UNA FUNCION DE PJSIP.
 * @TODO TAMBIEN VERIFICAR LA FUNCION "isRestricted"
 */
function Dual_ring(CDR2 $cdr, array $data, string $exten): void
{
    $cdr->step("Calling with Outer");
    if (isRestricted($cdr, $data['corpID'], $data['ID'], $data['outer'])) {

        $cdr->step("Outer is restricted, calling Exten");
        $cdr->exec('Dial', array('PJSIP/' . $exten, AGI_DIAL_TIMEOUT, 'KktM(vsc-callid)'));
        $status = $cdr->get_variable('DIALSTATUS');

        if (!wasAnswered($status) && $data['onbusy'] != '') {
            dialExten($exten, $cdr, $data['onbusy']);
        }
    } else {
        if (isExten($data['outer'], $data['corpID'])) {

            $cdr->exec('Dial', array("PJSIP/$exten&PJSIP/{$data['corpID']}_{$data['outer']}", AGI_DIAL_TIMEOUT, 'KktM(vsc-callid)'));

        } else {

            $cdr->set_trunk($data['trunk']);
            $cdr->exec('Dial', array("PJSIP/$exten&PJSIP/{$data['trunk']}/{$data['outer']}", AGI_DIAL_TIMEOUT, 'KktM(vsc-callid)'));
        }
    }
}

/**
 * @brief Ejecucion de la funcion External Ring.
 * @param CDR2 $cdr
 * @param array $data
 * @param string $onbusy
 * @TODO Corregir
 */
function External_Ring(CDR2 $cdr, array $data, string $onbusy)
{
    $cdr->step("Calling Outer");
    if (isRestricted($cdr, $data['corpID'], $data['ID'], $data['outer'])) {

        $cdr->close('** CALL RESTRICTED **');

    } else {
        if ($onbusy != '' && strlen($data['outer']) == 2) {

            $cdr->exec('Goto', array($data['corpID'], $data['outer'], 1));

        } elseif (isExten($data['outer'], $data['corpID'])) {

            $cdr->exec('Dial', array("PJSIP/{$data['corpID']}_{$data['outer']}", AGI_DIAL_TIMEOUT, 'KktM(vsc-callid)'));

        } else {

            $cdr->set_trunk($data['trunk']);
            $cdr->set_callerid($data['trunk']);
            $cdr->exec('Dial', array("PJSIP/{$data['trunk']}/{$data['outer']}", AGI_DIAL_TIMEOUT, 'KkM(vsc-callid)'));
        }
    }
}

/**
 * @param CDR2 $cdr
 * @param array $data
 * @param string $exten
 */
function FollowMe(CDR2 $cdr, array $data, string $exten)
{
    $cdr->step("Calling with Followme");
    $follow = GetFollows($data['ID']);
    //@TODO ver como solucionar

}

/**
 * @brief Consulta si es alguno de todos los estados posibles del canal y retorna el valor booleano.
 * @param string $status estado del canal
 * @return bool
 */
function wasAnswered(string $status): bool
{
    return $status != 'CONGESTION' && $status != 'CHANUNAVAIL' && $status != 'BUSY' && $status != 'NOANSWER' && $status != 'UNKNOWN';
}


/**
 * @brief Procesa las restricciones y devuelve la restriccion que mas matchea
 * @param string $dest
 * @param string $corpId
 * @param string $exten Origen de la llamada.
 * @return array|null
 */
function getRestriction(string $dest, string $corpId, string $exten): ?array
{
    $countryCode = substr($dest, 0, 2);
    $areaCode = substr($dest, 2, 2);
    $corpRestriction = getRestrictionsCorp($corpId, $dest, $countryCode, $areaCode);
    // Restriccion de corpo
    if ($corpRestriction['permit'] == 0) {
        return $corpRestriction;
    }
    $extenRestriction = getRestrictionsExten($corpId, $exten, $dest, $countryCode, $areaCode);
    // Restriccion de exten
    if ($extenRestriction['permit'] == 0) {
        return $extenRestriction;
    }
    // Corpo usa pin
    if ($corpRestriction['permit'] == 2) {
        return $corpRestriction;
    }
    // Exten usa pin
    if ($extenRestriction['permit'] == 2) {
        return $extenRestriction;
    }
    // No tiene restricciones
    return null;

}

/**
 * @brief Ejecuta la accion "tim"
 * @param CDR2 $cdr
 * @param string $data
 */
function TimeOptions(CDR2 $cdr, string $data)
{
    $timeID = substr($data, 3);
    $cdr->step("Executing Time: $timeID");
    $curTime = date("Hi");
    $curDay = date("D");

    //Buscar accion por defecto
    $default = timeActionDefault($timeID);

    //buscar acciones para el horario actual
    $timeCurrent = getCurrentAction($timeID, $curTime, $curDay);

    if (!is_null($timeCurrent)) {

        ExecAction($cdr, $timeCurrent['action']);

    } else if (!is_null($default) && $default['default'] != '') {

        ExecAction($cdr, $default['default']);

    } else {
        $cdr->close("** TIME ACTION NOT FOUND **");
    }

}

/**
 * @brief Ejecuta la integracion indicada desde la BD.
 * @param CDR2 $cdr
 * @param string $data
 */
function Integracion(CDR2 $cdr, string $data): void
{
    $cdr->step("implementalo paper");
}


/**
 * @brief Funcion encargada de esperar que se marque el numero e informar sobre el mismo.
 * @param $cdr CDR2 objeto de la clase webcdr.
 * @param int $max_digit
 * @param string $digit
 * @return string Extension que se desea marcar.
 */
function WaitForDigit(CDR2 $cdr, int $max_digit, string $digit): string
{
    /* Si se setea el numero maximo de caracteres */

    if ($max_digit != 0) {
        $max_loop = $max_digit;
    } else {
        $max_loop = 4;
    }
    $no_loop = 0;
    $dest_number = '';
    while ($no_loop < $max_loop) {
        $no_loop++;
        $result = $cdr->wait_for_digit(5000);
        if ($result['result'] != $digit) {
            $dest_number .= chr($result['result']);
            $cdr->step("$no_loop digito ingresado: $dest_number");
        } else {
            $cdr->step("$no_loop digito ingresado: Timeout");
            $no_loop = $max_loop;
        }
    }
    return $dest_number;
}

/**
 * @brief Funcion encargada de buscar los audios de la corpo y reproducirlos.
 * @param CDR2 $cdr
 * @param string $num
 * @param bool $check
 * @return bool
 * @TODO Poner querys
 */
function mediaServer(CDR2 $cdr, string $num, bool $check): bool
{
    $datos = executeQuery("Hola");
    if (!$datos) {
        return false;
    }
    $play = true;
    /*
     * aca iria lo chequear el callerid
     */

    if ($play) {
        $cdr->step("Executing Media Server feature ($num)");
        $cdr->exec('Progress', null);
        $cdr->exec('Wait', '1');
        $cdr->step("Playing {$datos['sound']}");
        $cdr->exec('Playback', array('/var/www/sounds/' . $datos['sound'], 'noanswer'));
    }

    if (intval($num) < 200) {
        $num = sip2isup($num);
    }

    $cdr->exec('Hangup', $num);
    return true;
}

/**
 * @brief Dependiendo de el error rebido, buscara el BD la causa correspondiente a dicho codigo.
 * @param string $num
 * @return int|mixed
 */
function sip2isup(string $num)
{
    $res = executeQuery("hola");
    if ($res->fetch_assoc() == 1) {

        return $res->fetch_assoc()['PSTNCauseCode'];

    } else {
        return intval($num);
    }
}


?>