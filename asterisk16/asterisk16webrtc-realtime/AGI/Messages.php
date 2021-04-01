#!/usr/bin/php -q
<?php
/**
 * @brief Script utilziado para el envio de mensajes de texto entre extensiones internas. Cualquier adicion o cambio
 * se ruega documentar.
 */

set_time_limit(10);
error_reporting(0);
require_once 'phpagi.php';

$agi = new AGI();

/* Origen */
$caller = $agi->request['agi_arg_1'];

/* Destino */
$exten = $agi->request['agi_extension'];

/* Envio el msj a destino */
$agi->exec('MessageSend',array("pjsip:$exten,$caller"));

/* Cierro el canal */
$agi->exec('Hangup',NULL);
exit;

?>