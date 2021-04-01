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

//Set(CALLERID(name)=${lookupcid})
$agi->exec('Set', array('CALLERID(name)=551144443334'));
$agi->exec('Set', array('CALLERID(num)=551144443334'));
//CALLERID(ani)
$agi->exec('Set', array('CALLERID(ani)=551144443334'));
$agi->exec('Set', array('CALLERID(ani2)=55114444333410'));

//Entrante de exten a exten
$agi->exec('Dial',array("PJSIP/$exten@551144443334/sip:192.168.0.202"));

