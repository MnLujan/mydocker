<?php
/**
 * @brief Funciones necesarias para la implementacion de Entrantes Via transferencia. Cualquier cambio se ruega
 * documentar.
 */

require_once 'Db.php';
require_once 'Utils.php';

/**
 * @brief Funcion encargada de ejecutar los comandos necesarios para Transferir una llamada entrante.
 * ¡Aqui se ejecuta Queues!
 * @param CDR2 $cdr
 * @param string $exten
 * @param array $corp
 */
function TransferCall(CDR2 $cdr, string $exten, array $corp): void
{
    $res = getSpeedDialsCorp($exten, $corp['ID']);

    if (count($res) == 0) {
        $cdr->close('** SPEEDDIAL NOT FOUND **');
    }

    $temp = $res;

    if ($temp['action'] == 'MeetMe') {

        echo "Exec(meetme, Corp ID";

    } elseif (preg_match('/(?P<type>enqueue)\_(?P<id>\d+\_\d+)/', $temp['action'], $match)) {
        $id = substr($match['id'], strpos($match['id'], '_') + 1);

        $queue = getQueue($id);

        if (count($queue) > 0) {

            $data = $res;
            $file = glob(WEB_SOUNDS_FOLDER . "Queue" . $match['id'] . "/" . "*");

            if (is_array($file) && count($file) > 0) {
                $ring = '';
                $cdr->exec('Progress', '');
            }
            $ring = 'r';
            $applyTimeOut = $data['failovertimeout'] > 0 ? $data['failovertimeout'] : '';

            $cdr->exec('Queue', array($match['id'], $ring . 'kKtT', null, null, $applyTimeOut));
            $status = $cdr->get_variable('QUEUESTATUS');
            $cdr->step("Queue result: $status");

            if ($status == 'TIMEOUT' && $data['failoveraction'] != '') {
                ExecAction($cdr, $data['failoveraction']);
            }

        } else {
            $cdr->close("** QUEU NOT FOUND **");
            exit;
        }
    } else {
        $cdr->close("** NO ACTION FOUND **");
        exit;
    }

}

?>