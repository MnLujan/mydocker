#!/usr/bin/php -q
<?php
require_once 'phpagi.php';
//require_once 'SpeedDials.php';

GLOBAL	$stdin, $stdout, $stdlog, $result, $parm_debug_on, $parm_test_mode;
ob_implicit_flush(false); 
set_time_limit(30);
error_reporting(0);

$stdin = fopen('php://stdin', 'r');
$stdout = fopen('php://stdout', 'w');


$agi = new AGI();
$Corpid = "1";
$regex = "^(\+|{$Corpid}_)";

/* Origen */
$callerID = $agi->request['agi_callerid'];

/* Destino */
$exten = $agi->request['agi_dnid'];



//Entrante de exten a exten
$agi->exec('Dial',array("PJSIP/$callerID/$exten"));

usleep(500000);
$status = $agi->get_variable('HANGUPCAUSE');
$agi->verbose($status);
exit;

// Entrante por un tronco
//$agi->exec('Dial',array("PJSIP/101&PJSIP/$exten/$caller"));

?>




