#!/usr/bin/php -q
<?php
/**
 * @brief Script necesario para la recepcion de llamadas a la central.
 */

require_once 'config.php';
require_once 'phpagi.php';
require_once 'Db.php';
require_once 'Utils.php';
require_once 'webcdr.php';

/* Asterisk */
$agi = new AGI();

/* Interfaz */
$cdr = new CDR2($agi);

if ($cdr->is_closing()) {
    $cdr->close();
}

if ($cdr->is_closed()) {
    exit;
}

$DID = $cdr->get_destination();
$regex = "^(\+)";
$DID = preg_replace('/' . $regex . '/', '', $DID);
$cdr->database_put("poll_trunk", $DID);
$cdr->step("Get Action for $DID");

if (mediaServer($cdr, $DID, AGI_LOCAL_MEDIA_SERVER)) {
    exit;
}

$datos = infoTrunk($DID);

if (!is_null($datos)) {

    Sounds($cdr, $datos, true);

    if ($datos['action'] != '') {
        ExecAction($cdr, $datos['action']);
    } else {
        $cdr->close("** EMPTY ACTION **");
    }

} else if (KHOMP_ROUTING && intval(substr($DID, 0, 2)) < 17) {

    $cdr->step("Calling Khomp");
    $cdr->exec('Dial', array('Khomp/' . substr($DID, 0, 2) . '/' . substr($DID, 2), 90));
    exit;

} else if (COLLECT_CALLS && preg_match('/^90/', $DID)) {
    /* VSC */
    $cdr->exec('Goto', array('Entrantes_A_Cobrar', $DID, '1'));
    exit;
} else {
    $cdr->close("** DID NOT FOUND **");
}

?>