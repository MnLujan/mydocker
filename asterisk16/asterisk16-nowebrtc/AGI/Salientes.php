#!/usr/bin/php -q
<?php
/**
 * @brief Script de logica de negocios. Cualquier cambio realizado se ruega documentar.
 */

/* Archivo de Config para extraer variables */
require_once 'config.php';

/* Utils */
//require_once '../Utils/Utils.php';
require_once 'webcdr.php';
require_once 'phpagi.php';
require_once 'DBmock.php';

/* Dialplans */
//require_once 'SpeedDials.php';
//require_once 'EntViaTransfer.php';
require_once 'SpeedDialRamais.php';
require_once 'Dial.php';

/* Asterisk */
$agi = new AGI();

/* CDR */
$cdr = new CDR2($agi);

/* Origen de la llamada */
$callerID = $cdr->get_pbx();

/* Pido la Corporacion */
$corpID = $cdr->get_Corp();

/* Destino de la llamada */
$exten = $cdr->get_destination();

/* Separo la corpo del numero de extension que se quiere llamar */
$exten_info = explode('_', $exten);

$cdr->step("Get information for PBX $corpID");

/* Verifico la existencia de la Corpo */
$Corp = IsCorp($corpID);

if (!$Corp) {
    //En caso de ser falso no hago nada
    $cdr->step("** CORP DISABLED OR NOT FOUND **");
    exit;
}

/* Audios */
Sounds($cdr, $Corp);

//$arg = GetDelimeters($exten); //aca los pido para identificar que ejecutar.
//$exten = $arg;

$cdr->step("** Se Busca el plan a ejecutar **");

/* Pido info del tipo de llamada. */
$Call_Type = WhatIs($exten_info, $exten, $Corp);

/* Dependiendo del valor recibido, ejecuto la accion correspondiente */
switch ($Call_Type) {
    case "EntViaTransfer":
        //TransferCall($cdr);
        break;
    case "SpeedDial":
        //$caller_exten = $caller_info[1];
        //EjecSpeedDial($cdr, $caller_info, $exten, $Corp);
        break;
    case "SpeedDial2":
        SpeedDialRamais($cdr, $exten, $Corp);
        break;
    default:
        Dial($cdr, $exten, $Corp);
        break;
}
exit;
?>