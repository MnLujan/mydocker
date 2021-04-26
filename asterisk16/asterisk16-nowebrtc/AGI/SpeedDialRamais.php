<?php
/**
 * @brief Marcado rapido para Extension de una corporacion.
 */
/* Funciones de la BD */
require_once 'DBmock.php';

//Get Information for PBX $Corp
//Get information for 1000 linea 116
//linea 740
//Verifico Restricciones (User Y Corp) linea 770
//Ejecuto Dial linea 790

/**
 * @brief Funcion encargada de Ejecutar el marcado rapido por extension.
 * @param CDR2 $CDR
 * @param string $exten destino
 * @param array $Corp
 */
function SpeedDialRamais(CDR2 $CDR, string $exten, array $Corp)
{
    /* ID de quien llama */
    $corpID = $CDR->get_Corp();

    /* Numero de quien llama */
    $caller = $CDR->get_pbx();
    $extenAux = explode('_', $caller);
    $caller = $extenAux[1]; //Extraigo corpo y dejo solo la extension

    $CDR->step("Get information for PBX $corpID");

    $user = GetInfoUser($caller, $Corp);

    if (!$user) {
        if ($CDR->isTransfered()) {
            $CDR->set_closed(true);
        }
        $CDR->close('** EXTEN DISABLED OR NOT FOUND **');
        exit;
    }

    $CDR->step("Search speeddial $exten");

    $res = GetSpeedDialsExten($exten, $user);

    if ($res != null) {
        $tmp = $res;
        $CDR->step("Get restrictions over {$tmp['data']}");
        if ($tmp['action'] == 'Dial') {
            $CDR->step("Dial {$tmp['data']} through trunk {$user['trunk']}");
            $exten = $tmp['data'];
            $CDR->step("Rewrite destination to $exten");
            $CDR->set_destination($exten);
        }
    }

    /* Restricciones User y Corp */
    $CDR->step("Get restrictions over $exten");
    $restriction = GetRestriction($exten, $corpID, $user, $CDR);

    //El archvio original loggea la query aca.
   /**
    if ($restriction['restricted']) {
        $CDR->set_restriction($restriction['pattern']);
        $CDR->close('** CALL RESTRICTED **');
        exit;
    }
    */

    $CDR->step("Calling " . $Corp['ID'] . '_' . $exten);
    $CDR->set_destination($Corp['ID'] . '_' . $exten);
    $CDR->set_variable('CALLERID(name)', $user['description']);
    $CDR->set_variable('CALLERID(num)', $user['number']);
    dialExten($Corp['ID'] . '_' . $exten, $CDR, '');

}