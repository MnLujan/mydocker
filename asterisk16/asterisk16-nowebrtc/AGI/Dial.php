<?php
/**
 * @brief Archivo de ejecucion de llamadas comunes. Se ejecuta solo en caso de que no matche ninguna dialplan.
 * Cualquier cambio se ruega documentar.
 */

require_once 'DBmock.php';
require_once 'Utils.php';
/**
 * @brief Funcion encargada de ejecutar una llamada interna en la misma corpo. En caso de que se para otra corporacion,
 * se realiza un exit inmediatamente.
 * @param CDR2 $cdr
 * @param string $exten Numero a llamar
 * @param array $corp Corporacion desde donde se realiza la llamada.
 */
function Dial(CDR2 $cdr, string $exten, array $corp): void
{

    $cdr->step("Get information for $exten");

    //$delimeter = GetDelimeters($exten);
    $extenAux = explode('_', $exten);
    $exten = $extenAux[1];
    $user = GetInfoUser($exten, $corp);

    $cdr->step("Get restrictions over $exten");
    //$restriction = GetRestriction($exten, $corp['ID'], $user, $cdr);
    $restriction['restricted'] = false;
    if ($restriction['restricted']) {
        $cdr->set_restriction($restriction['pattern']);
        $cdr->close('** CALL RESTRICTED **');
        exit;
    }

    $cdr->step("Calling " . $corp['ID'] . '_' . $exten);
    $cdr->set_destination($corp['ID'] . '_' . $exten);
    $cdr->set_variable('CALLERID(name)', $user['description']);
    $cdr->set_variable('CALLERID(num)', $user['number']);
    dialExten($corp['ID'] . '_' . $exten, $cdr, '');
    exit;

}