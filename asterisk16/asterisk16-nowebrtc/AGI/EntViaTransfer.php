<?php
/**
 * @brief Funciones necesarias para la implementacion de Entrantes Via transferencia. Cualquier cambio se ruega
 * documentar.
 */

require_once 'Db.php';
require_once 'Utils.php';

/**
 * @brief Funcion encargada de ejecutar los comandos necesarios para Transferir una llamada entrante.
 * @param CDR $cdr
 * @param
 */
function TransferCall(CDR $cdr)
{

    $res = GetSpeedDials();

    if (count($res) == 0) {
        $cdr->close('** SPEEDDIAL NOT FOUND **');
    }

    $temp = $res;
    /**
     * @TODO Ver si dejarlo asi o llamar una funcion
     */
    if ($temp['action'] == 'MeetMe') {

        echo "Exec(meetme, Corp ID";

    } elseif (preg_match('/(?P<type>enqueue)\_(?P<id>\d+\_\d+)/', $temp['action'], $match)) {
        $id = substr($match['id'], strpos($match['id'], '_') + 1);

        $res = GetQueues();

        if (count($res) > 0) {

            $data = $res;
            $file = glob(WEB_SOUNDS_FOLDER . "Queue" . $match['id'] . "/" . "*");

            if (is_array($file) && count($file) > 0) {
                $ring = '';
                $cdr->exec('Progress', '');
            }
            $ring = 'r';
            $applyTimeOut = $data['failovertimeout'] > 0 ? $data['failovertimeout'] : '';

            echo $cdr->exec('Queue', array($match['id'], $ring . 'kKtT', null, null, $applyTimeOut));
            $status = $cdr->get_variable('QUEUESTATUS');
            //$cdr->step("Queue result: $status");

            if ($status == 'TIMEOUT' && $data['failoveraction'] != '') {
                ExecAction($cdr, $data['failoveraction']);
            }

        } else {
            echo "Queu not found";
            exit;
        }
    } else {
        echo "No action detected";
        exit;
    }

}

?>