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

$dest = $agi->request['agi_dnid'];

$agi->exec('Dial',array("PJSIP/104"));

