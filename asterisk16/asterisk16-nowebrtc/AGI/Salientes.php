#!/usr/bin/php -q
<?php
/**
 * @brief Script de logica de negocios. Cualquier cambio realizado se ruega documentar.
 * @version 1.0
 */

/* Archivo de Config para extraer variables */
require_once 'config.php';

/* Utils */
require_once 'Utils.php';
require_once 'webcdr.php';
require_once 'phpagi.php';
require_once 'Db.php';

/* Dialplans */
require_once 'SpeedDials.php';
//require_once 'EntViaTransfer.php';
require_once 'SpeedDialRamais.php';
require_once 'Dial.php';
require_once 'Trunks.php';

/* Asterisk */
$agi = new AGI();

/* CDR */
$cdr = new CDR2($agi);

if ($cdr->is_closing()) {
    $cdr->close();
}

if($cdr-> is_closed()){
    exit;
}

/* Origen de la llamada */
$callerID = $cdr->get_pbx();

/* Pido la Corporacion */
$corpID = $cdr->get_Corp();

/* Destino de la llamada */
$exten = $cdr->get_destination();
$regex = "^(\+|{$corpID}_)";
$exten = preg_replace('/^[0-9]+_/', '', $exten);
$exten = preg_replace('/' . $regex . '/', '', $exten);

/* Obtengo un array para determinar el plan a ejecutar. */
$caller_info = explode('_', $callerID);

$cdr->step("Get information for PBX $corpID");

/* Verifico la existencia de la Corpo */

if (!isCorp($corpID)) {
    $cdr->step("** CORP DISABLED OR NOT FOUND **");
    exit;
}

/* Como existe, pido informacion de la Corpo */
$Corp = getCorpInfo($corpID);

/* Audios */
Sounds($cdr, $Corp);

$cdr->step("** Se Busca el plan a ejecutar **");

/* Pido info del tipo de llamada. */
$Call_Type = WhatIs($caller_info, $exten, $Corp);

/* Dependiendo del valor recibido, ejecuto la accion correspondiente */
switch ($Call_Type) {
    case "EntViaTransfer":
        //TransferCall($cdr);
        break;
    case "SpeedDial":
        EjecSpeedDial($cdr, $exten, $Corp);
        break;
    case "SpeedDial2":
        SpeedDialRamais($cdr, $exten, $Corp);
        break;
    case "trunk":
        DialTrunk($cdr, $exten, $corpID);
        break;
    case "SalExten":
        Dial($cdr, $exten, $Corp);
        break;
    default:
        $cdr->step("** EXTEN DISABLED OR NOT FOUND **");
        $cdr->close();
        exit;
}
exit;
?>