<?php
/**
 * @brief Conjunto de funciones para chequear contra la BD. Se ruega documentar cualquier modificacion.
 */

/**
 * @brief Funcion encargada de validar si la extension existe en la BD
 * @param $dest string destino de la llamada
 * @param $exten_len string largo de la extension ?
 * @param $corpID string ID de la corporacion
 * @return bool
 */
function IsExten(string $dest, string $exten_len, string $corpID): bool
{
    if (strlen($dest) != $exten_len) {
        echo "Nada que hacer";
        return false;
    } else {
        echo "Query Correspondiente";
        return true;
    }
}

/**
 * @brief Funcion encargada de consultar a la base de la existencia de la Corp.
 * @return array Arreglo con los campos de la corp, Null en caso de que no exista.
 */
function IsCorp(string $Corpid): ?array
{
    $mysqli = new mysqli("127.0.0.1", "centrex", "centrex123", "newcentrex");

    if ($mysqli->connect_errno) {
        printf("No connect database: %s\n" . $mysqli->connect_error);
        return null;
    } else {
        $res = $mysqli->query("SELECT * FROM corps WHERE ID='$Corpid' AND enabled='1'");
        $mysqli->close();
        return $res->fetch_assoc();
    }

}

/**
 * @brief Devuelve informacion de Usuario.
 */
function GetInfoUser(string $caller_exten, array $Corp): ?array
{
    // $res = array('ID' => 1, 'number' => 102, 'description' => "Martin Lujan", 'pass' => "1000aa1000", 'corpID' => 1, 'userID' => 7, 'trunkID' => 1, 'outer' => 919191, 'enabled' => 1,
    //    'action' => "ring", 'onbusy' => "external_ring", 'ip' => null, 'port' => 0, 'useragent' => null, 'vmpass' => 1234, 'callgroup' => 1);

    $mysqli = new mysqli("127.0.0.1", "centrex", "centrex123", "newcentrex");
    if (!$mysqli->connect_errno) {
        $query = "SELECT e.*,t.number AS trunk, t.enabled AS trunk_enabled, t.outgoing AS trunk_outgoing FROM extens e LEFT JOIN trunks t ON t.ID=e.trunkID WHERE e.number='{$caller_exten}' AND e.corpID='{$Corp['ID']}' AND e.enabled='1'";
        $res = $mysqli->query($query);
        $mysqli->close();
        return $res->fetch_assoc();
    } else {
        printf("No connect database: %s\n" . $mysqli->connect_error);
        return null;
    }

}

/**
 * @brief Busca los delimitadores en la BD y devuelve un array con los argumentos.
 * @param string $exten
 * @return string
 */
function GetDelimeters(string $exten): array
{
    return array('delimeter_key' => "#");
}

/**
 * @brief
 * @param string $num
 * @return string
 */
function getCodes(string $num): array
{
    $tmp['country'] = substr($num, 0, 2);
    $tmp['area'] = substr($num, 2, 2);
    return $tmp;
}

function GetSpeedDials(): array
{
    $res = array('ID' => 1, 'number' => 10, 'action' => "MeetMe", 'data' => null, 'type' => 0, 'entityID' => 1);
    return $res;
}

function GetQueues(): array
{
    $res = array('ID' => 1, 'name' => "Fila Comercial", 'corpID' => "1", 'moh' => "default", 'strategy' => "ringall", 'timeout' => 0, 'announce' => "/var/www/sounds/filacomercial");
    return $res;
}

function isSpyEnabled(): array
{
    return array('spyEnabled' => 0);
}

/**
 * Devuelve array de numeros
 */
function GetNumbers(): array
{
    return array('1' => "1000", '2' => "2000", '3' => 3000);
}

function GetExtID(): array
{
    return array('ID' => 1);
}

function GetOutBoundvm(): array
{
    return array('ID' => 1);
}

/**
 * @brief Consulta en la BD el speeddial asociado a la extension que se quiere llamar.
 * @param string $exten
 * @param array $user
 * @return array|null
 */
function GetSpeedDialsExten(string $exten, array $user): ?array
{
    $mysqli = new mysqli("127.0.0.1", "centrex", "centrex123", "newcentrex");
    if (!$mysqli->connect_errno) {
        $query = "SELECT * FROM speeddials s WHERE s.number='{$exten}' and type = '1' and s.entityID = '{$user['ID']}'";
        $res = $mysqli->query($query);
        $mysqli->close();
        return $res->fetch_assoc();
    } else {
        printf("No connect database: %s\n" . $mysqli->connect_error);
        return null;
    }
}

function RestrictionExtCorp(): array
{
    return array('ID' => 1, 'pattern' => null, 'type' => null, 'entityID' => null, 'permit' => null, 'groupID' => null, 'pin' => null);
}

function GetExten(): array
{
    return array('number' => 102, 'action' => "ring");
}

function IVRexist(string $ID): bool
{
    return true;
}

function GetDataQueue(string $qid): array
{
    return array('ID' => 1, 'name' => "testingcola", 'corpID' => 1, 'moh' => "default", 'strategy' => "random", 'timeout' => 10, 'announce' => "/var/www/sounds/", 'fialovertimeout' => 0, 'failoveraction' => null, 'ivr' => null);
}

function isRestricted(CDR2 $CDR, string $corp, string $exten, string $destino): bool
{
    return true;
}

function GetFollows(string $id)
{
    return array('ID' => 1, 'type' => 1, 'entityID' => 2, 'order' => 0, 'number' => 1002, 'timeout' => 10, 'typeCall' => null);
}

?>