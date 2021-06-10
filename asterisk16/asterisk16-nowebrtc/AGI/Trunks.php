<?php
/**
 * @brief File destinado a las funciones para que una extension ejecute una llamada con salida
 * al exterior de la corporacion, mediante un tronco. Cualqueir cambio se ruega documentar.
 */

require_once 'Db.php';

/**
 * @brief Ejecuta las funciones necesarias para llamar por un tronco.
 * @param CDR2 $cdr
 * @param array $user
 * @param string $dest
 * @param string $corpID
 */
function DialTrunk(CDR2 $cdr, string $dest, string $corpID): void
{
    /* Quien llama sin corp */
    $caller = $cdr->get_caller_alone();
    $user = getInfouser($caller, $corpID);

    if (defined("OUTGOING_ROUTING") && OUTGOING_ROUTING == true) {

        $sip_route = getRoutes($dest, $corpID);

        if (!is_null($sip_route)) {
            $route = array(
                'trunk' => $sip_route['trunk'],
                'enabled' => $sip_route['trunk_enabled'],
                'outgoing' => $sip_route['trunk_outgoing'],
            );


            if ($sip_route['translation'] != '') {
                $patern = str_replace(['T', '.'], ['(\d+)', '(\d)'], '/^' . $sip_route['pattern'] . '$/');
                $array = str_split($sip_route['translation']);
                $index = 1;
                $new_dest = '';

                preg_match_all($patern, $dest, $matches);
                foreach ($array as $char) {
                    if ($char == '.' || $char == 'T') {
                        $new_dest .= $matches[$index][0];
                        $index++;
                    } else {
                        $new_dest .= $char;
                    }
                }
                $dest = $new_dest;
                $cdr->step("Rewrite destination to $dest");
                $cdr->set_destination($dest);
            }

        }

    } else {
        $route = array(
            'trunk' => $user['trunk'],
            'enabled' => $user['trunk_enabled'],
            'outgoing' => $user['trunk_outgoing'],
        );
    }

    $cdr->step("Using Trunk: {$route['trunk']}");
    $cdr->set_trunk($route['trunk']);

    if ($route['trunk'] == null || $route['enabled'] == '0' || $route['outgoing'] == '0') {
        $cdr->close('** TRUNK DISABLED **');

    } else {
        $cdr->exec('Ringing', '');
        $cdr->set_callerid($route['trunk']);
        $dest = preg_replace('/^\+/', '', $dest);
        $cdr->exec('Dial', array('PJSIP/' . $route['trunk'] . '/' . $dest, AGI_DIAL_TIMEOUT, 'eKTM(vsc-callid)'));
    }
    exit;
}