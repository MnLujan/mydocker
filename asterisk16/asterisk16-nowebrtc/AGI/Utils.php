<?php

/* Chequeos contra la BD */
require_once 'DBmock.php';
require_once 'config.php';

/**
 * @brief Funcion encargada de determinar el tipo de llamada que se quiere realizar. Hace validaciones contra
 * la BD.
 * @param $exten_info array
 * @param $destino string
 * @param $Corp array con informacion de la corporacion.
 * @return string que infora el tipo de llamada que se queire realizar.
 * @TODO si no se agregan mas funciones, sacarla de y agregar a Salientes.
 */
function WhatIs(array $exten_info, string $destino, array $Corp): string
{
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
    } else if (count($exten_info) == 1 && IsExten($destino, $Corp['extLen'], $Corp['ID'])) {
        //@TODO Se busco reproducir el escenario y no hubo resultado, sacar de ser neceasrio.
        return "SalExten";

    } else {
        return ''; //En el caso de que no sea ninguno, es una llamada comun
    }

}

/**
 * @brief Configura los directorios de sonido y grabacion de existir.
 * @param CDR2 $cdr
 * @param array $Corp
 */
function Sounds(CDR2 $cdr, array $Corp): void
{
    $Corpid = $cdr->get_Corp();
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
 * @brief Consulta en la BD y busca las restricciones del Usuario.
 * @param string $dest
 * @param string $corpID
 * @param array $user
 * @param CDR2 $cdr
 * @return array
 */
function GetRestriction(string $dest, string $corpID, array $user, CDR2 $cdr): array
{
    $tmp = array();
    $rest = RestrictionExtCorp();

    if (isset($rest['restricted']) && !$rest['restricted']) {
        $cdr->step("No restrictions applied");
        return $tmp;
    }

    switch ($rest['permit']) {
        case 0:
            $tmp['pattern'] = $rest['patron'];
            $tmp['restricted'] = true;
            break;
        case 1:
            $tmp['pattern'] = $rest['patron'];
            $tmp['restricted'] = false;
            break;
        case 2:
            $pin = getPass($cdr, $rest);
            if (strcmp($pin, $rest['pin']) == 0) {
                $tmp['pattern'] = $rest['patron'];
                $tmp['restricted'] = false;
            } else {
                $cdr->exec('Playback', 'incorrect-password');
                $tmp['pattern'] = $rest['patron'];
                $tmp['restricted'] = true;
            }
            break;
    }
    return $tmp;
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
    //$query = "SELECT e.*,t.number AS trunk FROM extens e LEFT JOIN trunks t ON t.ID=e.trunkID WHERE e.number='{$tmp[1]}' AND e.enabled='1' AND e.corpID='{$tmp[0]}'";
    //@TODO Query a realizar
    $res = GetExten();

    if ($res = null) {
        $cdr->close('** EXTEN DISABLED OR NOT FOUND **');
    }

    /* Se realiza un cambio de contexto */
    $cdr->set_context($tmp[0]);
    $data = GetExten(); //se pide la accion para el numero de extension

    if ($onbusy != '') {
        $action = $onbusy;
    } else {
        $action = $data['action'];
    }

    $cdr->step("accion: $action");
    //@TODO Completar, ver las tablas
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
 * @brief Ejecucion de la acciones segun la informacion pasada por parametro.
 *   ACTIONS:
 *      IVR -> ivr## -> ivr.php?id=##
 *      Queue -> que## -> queue.php?id=##
 *      Exten -> ext## -> extension.php?id=##
 *      ExtenVM -> dvm## -> extensionVoiceMail.php?id=##
 *      Group -> gr## -> group.php?id=##
 *      Time -> tim## -> horarios.php?idCorp=##
 *      Colgar -> hng
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
        case 'poll':
            ExecPoll($cdr, $data);
            break;
        case 'que':
            ExecQueue($cdr, $data);
    }
    //@TODO terminar
}

function Ring(CDR2 $cdr, string $exten, array $datos)
{
    //@TODO Ver la variable AGI_DIAL_TIMEOUT
    $caller = $cdr->get_pbx();
    $cdr->step("Calling Exten");
    $cdr->exec('Dial', array("PJSIP/$caller/$exten",AGI_DIAL_TIMEOUT));
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

    if (IVRexist($id)) {
        //require_once 'IVR.php';
        //@TODO ver si se pide aca o antes. Escribir el archivo IVR.
    } else {
        $cdr->close('** IVR NOT FOUND **');
    }
}

function ExecPoll(CDR2 $cdr, string $poll): void
{
    $id = substr($poll, 3);
    $cdr->step("Executing IVR: $id");
    $cdr->exec('Ringing', '');

    if (IVRexist($id)) {
        //require_once 'Encuestas.php';
        //@TODO Ver si se pide aca o antes. Escribir dicho archivo
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
    $dataqueue = GetDataQueue($qid);

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
        if (isExten($data['outer'], strlen($data['number']), $data['corpID'])) {

            $cdr->exec('Dial', array("SIP/$exten&SIP/{$data['corpID']}_{$data['outer']}", AGI_DIAL_TIMEOUT, 'KktM(vsc-callid)'));

        } else {

            $cdr->set_trunk($data['trunk']);
            $cdr->exec('Dial', array("PJSIP/$exten&SIP/{$data['trunk']}/{$data['outer']}", AGI_DIAL_TIMEOUT, 'KktM(vsc-callid)'));
        }
    }
}

/**
 * @brief Ejecucion de la funcion External Ring.
 * @param CDR2 $cdr
 * @param array $data
 * @param string $onbusy
 */
function External_Ring(CDR2 $cdr, array $data, string $onbusy)
{
    $cdr->step("Calling Outer");
    if (isRestricted($cdr, $data['corpID'], $data['ID'], $data['outer'])) {

        $cdr->close('** CALL RESTRICTED **');

    } else {
        if ($onbusy != '' && strlen($data['outer']) == 2) {

            $cdr->exec('Goto', array($data['corpID'], $data['outer'], 1));

        } elseif (isExten($data['outer'], strlen($data['outer']), $data['corpID'])) {

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
 * @param array $status estado del canal
 * @return bool
 */
function wasAnswered(string $status): bool
{
    return $status != 'CONGESTION' && $status != 'CHANUNAVAIL' && $status != 'BUSY' && $status != 'NOANSWER' && $status != 'UNKNOWN';
}

?>