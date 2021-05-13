<?php

include 'DbHelper.php';
/**
 * @brief Conjunto de funciones para chequear contra la BD. Se ruega documentar cualquier modificacion.
 */

/**
 * @brief Funcion encargada de validar si la extension existe en la BD
 * @param string $exten extension a validar
 * @param string $corpId
 * @return bool
 */
function isExten(string $exten, string $corpId): bool
{
    $extenLenCorp = getExtenLenCorp($corpId);
    if ($extenLenCorp == null) return false;
    if ($extenLenCorp != strlen($exten)) return false;

    $result = executeQuery("SELECT id FROM extens WHERE `number` =  '{$exten}' AND corpId = '{$corpId}'");
    if ($result->fetch_array()) {
        return true;
    }
    return false;
}

/**
 * @brief Funcion encargada de consultar la cantidad de digitos de las extensiones de una corporacion
 *
 * @param string $corpId
 * @return string
 */
function getExtenLenCorp(string $corpId): ?string
{
    $exten_len_corp = executeQuery("SELECT extLen as ExtenLen from corps where id = '{$corpId}'");
    if ($fila = $exten_len_corp->fetch_array()) {
        return $fila['ExtenLen'];
    }
    return null;
}


/**
 * @brief Funcion encargada de consultar a la base de la existencia de la Corp.
 * @param string $corpId
 * @return bool
 */
function isCorp(string $corpId): bool
{
    $result = executeQuery("SELECT id FROM corps WHERE id = '{$corpId}'");
    if ($result->fetch_array()) {
        return true;
    }
    return false;
}

/**
 * @brief Funcion encargada de consultar los datos de la corporacion
 * @param string $corpId
 * @return array|null
 */
function getCorpInfo(string $corpId): array
{
    $query = "SELECT * from corps WHERE id = '{$corpId}' ";
    return executeScalar($query);
}

/**
 * @brief Consulta en la BD el speeddial asociado a la extension que se quiere llamar.
 * @param string $dst numero de speeddial marcado(un digito)
 * @param string $corpId corpId de la extension que lo marco
 * @param string $exten
 * @return array|null
 * @example array(3) { ["action"]=> string(4) "Dial" ["data"]=> string(4) "1010" ["type"]=> string(1) "1" }
 */
function getSpeedDialsExten(string $dst, string $exten, string $corpId): ?array
{
    $extenId = getExtenId($exten, $corpId);
    $query = "SELECT `action`, `data`, `type` FROM speeddials WHERE `number` = '{$dst}' AND `type` = '1' AND `entityID` = '{$extenId}'";
    return executeScalar($query);
}

/**
 * @brief Consulta en la BD el speeddial asociado a la extension que se quiere llamar.
 * @param string $dst numero de speeddial marcado(dos digitos)
 * @param string $corpId corpId de la extension que lo marco
 * @return array|null
 * @example array(3) { ["action"]=> string(6) "Pickup" ["data"]=> NULL ["type"]=> string(1) "0" }
 */
function getSpeedDialsCorp(string $dst, string $corpId): ?array
{
    $query = "SELECT `action`, `data`, `type` FROM speeddials where `number` = '{$dst}' AND `type` = '0' AND `entityId` = '{$corpId}'";
    return executeScalar($query);
}


/**
 * @brief Permite obtener las restricciones a nivel extension
 * @param string $corpId
 * @param string $exten
 * @param string $dest Destino con el cual buscar las restricciones
 * @param string $countryCode codigo de pais del destino
 * @param string $areaCode codigo de area del destino
 * @return array|null
 * @example array(4) { ["type"]=> string(1) "1" ["patron"]=> string(12) "543514718259" ["permit"]=> string(1) "0" ["pin"]=> string(0) "" }
 */
function getRestrictionsExten(string $corpId, string $exten, string $dest, string $countryCode, string $areaCode): ?array
{
    $extenId = getExtenId($exten, $corpId);

    if (is_null($extenId)) {
        return null;
    }

    $query = "SELECT r.type,CASE r.pattern WHEN '' THEN dgp.pattern ELSE r.pattern END AS patron,r.permit,r.pin 
                    FROM restrictions r 
                        LEFT JOIN destination_group_patterns dgp ON dgp.group = r.groupID 
                    WHERE '{$dest}' LIKE REPLACE(REPLACE(REPLACE(REPLACE(	
                        CASE r.pattern WHEN '' 
                        THEN dgp.pattern 
                        ELSE r.pattern END, '.', '_'), 'T', '%'), 'CC', '{$countryCode}'), 'AC', '{$areaCode}') 
                    AND (r.type='1' AND r.entityID = '$extenId')  
                    ORDER BY r.type, LENGTH(patron) DESC,
                    LENGTH(REPLACE(REPLACE(REPLACE(REPLACE(patron,'T',''),'CC','{$countryCode}'),'AC','{$areaCode}'),'.','')) DESC limit 1;";

    return executeScalar($query);
}

/**
 * @brief Permite obtener las restricciones a nivel corporacion
 * @param string $corpId
 * @param string $dest Destino con el cual buscar las restricciones
 * @param string $countryCode codigo de pais del destino
 * @param string $areaCode codigo de area del destino
 * @return array|null
 * @example array(4) { ["type"]=> string(1) "0" ["patron"]=> string(6) "54351T" ["permit"]=> string(1) "2" ["pin"]=> string(4) "1234" }
 */
function getRestrictionsCorp(string $corpId, string $dest, string $countryCode, string $areaCode): ?array
{
    $query = "SELECT r.type,CASE r.pattern WHEN '' THEN dgp.pattern ELSE r.pattern END AS patron,r.permit,r.pin 
                    FROM restrictions r 
                        LEFT JOIN destination_group_patterns dgp ON dgp.group = r.groupID 
                    WHERE '{$dest}' LIKE REPLACE(REPLACE(REPLACE(REPLACE(	
                        CASE r.pattern WHEN '' 
                        THEN dgp.pattern 
                        ELSE r.pattern END, '.', '_'), 'T', '%'), 'CC', '{$countryCode}'), 'AC', '{$areaCode}') 
                    AND (r.type='0' AND r.entityID='{$corpId}')  
                    ORDER BY r.type, LENGTH(patron) DESC,
                    LENGTH(REPLACE(REPLACE(REPLACE(REPLACE(patron,'T',''),'CC','{$countryCode}'),'AC','{$areaCode}'),'.','')) DESC limit 1;";
    return executeScalar($query);
}

/**
 * @brief Permite obtener el id de una extension
 * @param string $exten
 * @param string $corpId
 * @return int|null
 */

function getExtenId(string $exten, string $corpId): ?int
{
    $result = executeQuery("SELECT id FROM extens where `number` = {$exten} AND corpId = {$corpId}");
    if ($fila = $result->fetch_assoc()) {
        return $fila['id'];
    }
    return null;
}


/**
 * @brief Permite obtener la key delimitadora de la plataforma
 * @return array
 */

function getDelimiters(): array
{
    $query = "SELECT `value` FROM `parameters` WHERE `key` = 'delimiter_key'";
    return executeScalar($query);
}


/**
 * @brief Permite obtener la informacion del usuario que llama
 * @param string $caller_exten
 * @param string $corpId
 * @return array|null
 */
function getInfouser(string $caller_exten, string $corpId): ?array
{
    $result = executeQuery("SELECT e.*, t.number AS trunk, t.enabled AS trunk_enabled, t.outgoing as trunk_outgoing FROM extens e LEFT JOIN trunks t on t.ID = e.trunkId WHERE e.number = '{$caller_exten}' AND e.corpId = '{$corpId}'");

    return $result->fetch_assoc();
}

/**
 * @brief Permite obtener la accion a ejecutar para dicho ramal.
 * @param array $info arreglo con la corporacion y la extension.
 * @return array|null array asociativo con informacion de la extension
 */
function extenAction(array $info): ?array
{
    $result = executeQuery("SELECT e.*,t.number AS trunk FROM extens e LEFT JOIN trunks t ON t.ID=e.trunkID WHERE e.number='{$info[1]}' AND e.enabled='1' AND e.corpID='{$info[0]}'");

    return $result->fetch_assoc();
}


/**
 * @brief Permite obtener los campos enabled y outgoing de un tronco
 * @param string $trunkNumber
 * @param string $corpId
 * @return array
 */
function getTrunkOutgoingEnabled(string $trunkNumber, string $corpId): array
{
    $query = "SELECT `enabled`, `outgoing` FROM `trunks` WHERE `number` = '{$trunkNumber}' AND `corpId` = '{$corpId}' LIMIT 1";
    return executeScalar($query);
}


/**
 * @brief Permite obtener la informacion de un tronco de una extension
 * @param string $exten
 * @param string $corpId
 * @return array|null
 * @example array(3) { ["number"]=> string(11) "55354701650" ["enabled"]=> string(1) "1" ["outgoing"]=> string(1) "1" }
 */
function getTrunkInfoExten(string $exten, string $corpId): ?array
{
    $query = "SELECT t.number, t.enabled, t.outgoing FROM trunks t INNER JOIN extens e ON t.ID = e.trunkId WHERE e.number = '{$exten}' AND t.corpId = '{$corpId}' LIMIT 1";
    return executeScalar($query);
}

/**
 * @brief Permite obtener la siproute que matchea con el destino(si es que existe)
 * @param string $dest
 * @param string $corpId
 * @return array|null
 * @example array(5) { ["pattern"]=> string(5) "5511T" ["translation"]=> string(3) "00T" ["trunkNumber"]=> string(11) "55354701650" ["enabled"]=> string(1) "1" ["outgoing"]=> string(1) "1" }
 */
function getSipRoute(string $dest, string $corpId): ?array
{
    $query = "SELECT sp.pattern, sp.translation, t.number as trunkNumber, t.enabled, t.outgoing
                FROM sip_routes sp
                LEFT JOIN trunks t ON t.ID = sp.trunkID
                WHERE '{$dest}' LIKE REPLACE(REPLACE(sp.pattern,'.','_'),'T','%')
                    AND sp.corpID='{$corpId}'
                    AND sp.enabled = 1
                ORDER BY LENGTH(sp.pattern) DESC, LENGTH(REPLACE(REPLACE(sp.pattern,'T',''),'.','')) DESC
                LIMIT 1;";
    $result = executeQuery($query);
    if ($fila = $result->fetch_assoc()) {
        return $fila;
    }
    return null;
}

/**
 * @brief Permite crear un reminder(el mismo te llama a la hs marcada y reproduce un audio)
 * @param string $exten
 * @param string $corpId
 * @param string $dest extension de destino
 * @param DateTime $date fecha de cuando sera el reminder
 * @param string $type | type=0 -> "no enviado" type=1 -> "enviado"
 * @param string $status | status=0 ->"no escuchado" status=1 ->"escuchado"
 * @param string $soundFilename | optional
 * @return int | 0 si no hubo una consulta previa
 */
function createReminder(string $exten, string $corpId, string $dest, DateTime $date, string $type, string $status, string $soundFilename = ""): int
{
    $extenId = getExtenId($exten, $corpId);
    $query = "INSERT INTO outboundvm (extenID, num, sound, schedule, type, status) VALUES ('{$extenId}', '{$dest}', '{$soundFilename}', '{$date->format('Y-m-d H:i:s')}' , {$type}, {$status})";
    return executeInsert($query);

}

/**
 * @brief Permite setear el nombre del archivo de audio de un reminder
 * @param string $filename
 * @param int $reminderId
 * @return bool
 */
function setAudiofilenameReminder(string $filename, int $reminderId): bool
{
    $query = "UPDATE outboundvm SET sound= '{$filename}.wav' where ID = '$reminderId'";
    $result = executeQuery($query);
    return $result != null;
}

/**
 * @brief Permite eliminar un reminder de la base de datos.
 * @param int $reminderId
 * @return bool
 */
function deleteReminder(int $reminderId): bool
{
    $query = "DELETE FROM outboundvm WHERE ID = $reminderId";
    $result = executeQuery($query);
    return $result != null;
}

/**
 * @brief Permite setear un numero externo a una extension(ver SPEEDDIAL -> ENCAMINAR LLAMADA) Comparar con DIALCONTACTS AST16
 * @param string $number | numero externo a setear
 * @param string $exten
 * @param string $corpId
 * @return bool
 */
function setOuterNumber(string $number, string $exten, string $corpId): bool
{
    $extenId = getExtenId($exten, $corpId);
    $query = "UPDATE extens e SET e.outer = '{$number}' WHERE e.ID = '{$extenId}'";
    $result = executeQuery($query);
    return $result != null;
}

/**
 * @brief Permite desactivar el toque externo
 * @param string $exten
 * @param string $corpId
 * @return bool
 */
function disableOuterRing(string $exten, string $corpId): bool
{
    $extenId = getExtenId($exten, $corpId);
    $query = "UPDATE extens SET action = 'ring' WHERE ID = '{$extenId}'";
    $result = executeQuery($query);
    return $result != null;
}

/**
 * @brief Permite activar el toque externo y asignar un numero para dicho toque
 * @param string $number
 * @param string $exten
 * @param string $corpId
 * @return bool
 */
function activateOuterRing(string $number, string $exten, string $corpId): bool
{
    $extenId = getExtenId($exten, $corpId);
    $query = "UPDATE extens e SET e.action = 'external_ring', e.outer = '{$number}' WHERE e.ID = '{$extenId}'";
    $result = executeQuery($query);
    return $result != null;
}

/**
 * @brief Funcion que permite consultar en la base si una extension puede ser espiada o no.
 * @param string $dest exten a espiar.
 * @param string $corpID id de la corporacion a la que pertenece la extension.
 * @return bool true en caso de que se pueda espiar, false caso contraio.
 */
function isSpyEnabled(string $dest, string $corpID): bool
{
    $query = "SELECT spy as spyEnabled FROM extens WHERE number = '" . $dest . "' AND corpID = '" . $corpID . "'";
    $res = executeQuery($query);
    $spy = $res->fetch_assoc();
    if ($spy['spyEnabled'] != '0') {
        return true;
    } else {
        return false;
    }
}

/**
 * @brief Permite obtener un grupo de numeros para el SpeedDial "pickup"
 * @param string $exten
 * @param string $corpID
 * @return array|null
 */
function getNumbers(string $exten, string $corpID): ?array
{
    $query = "SELECT e1.number FROM extens e1 WHERE e1.corpID='{$corpID}' AND e1.callgroup = (SELECT e.callgroup FROM extens e WHERE e.number='{$exten}' AND e.corpID='{$corpID}')";
    $res = executeQuery($query);
    return $res->fetch_assoc();

}

/**
 * @brief Funcion encagada de retornar las rutas configuradas para un destino en particular.
 * @param string $dest
 * @param string $corpID
 * @return array|null
 */
function getRoutes(string $dest, string $corpID): ?array
{
    $query = "SELECT sp.pattern, sp.translation, t.number, t.enabled, t.outgoing
						FROM sip_routes sp
						LEFT JOIN trunks t ON t.ID = sp.trunkID
						WHERE '{$dest}' LIKE REPLACE(REPLACE(sp.pattern,'.','_'),'T','%')
						AND sp.corpID='{$corpID}'
						AND sp.enabled = 1
						ORDER BY LENGTH(sp.pattern) DESC, LENGTH(REPLACE(REPLACE(sp.pattern,'T',''),'.','')) DESC
						LIMIT 1;";

    $res = executeQuery($query);
    return $res->fetch_assoc();

}

function getServerfromTrunk(string $trunk){
    $query = "SELECT ip, port FROM servers WHERE id = (SELECT `serId` FROM trunks WHERE `number` = '{$trunk}')";
    $res = executeQuery($query);
    return $res->fetch_assoc();
}

//---------------------------------------------------------------------------------------------------------------------
//                                                      ENTRANTES
//---------------------------------------------------------------------------------------------------------------------

/**
 * @brief Permite obtener la informacion de un tronco y su corporacion
 * @param string $trunkNumber
 * @param string $corpId
 * @return array|null
 * @example array(6) { ["number"]=> string(11) "55354701650" ["corpId"]=> string(2) "10" ["enabled"]=> string(1) "1" ["action"]=> NULL ["monenabled"]=> string(1) "0" ["monpath"]=> string(0) "" }
 */
function getInfoTrunkCorp(string $number, string $corpId): ?array
{
    $query = "SELECT t.number, t.corpId, t.enabled, t.action, c.monenabled, c.monpath from trunks t INNER JOIN corps c ON t.corpid = c.id where t.number = '{$number}' AND c.id = '{$corpId}' LIMIT 1";
    return executeScalar($query);
}

/**
 * @brief Permite obtner la informacion de un IVR
 * @param string $ivrId
 * @return array|null
 * @example
 */
function getIvr(string $ivrId): ?array
{
    $query = "SELECT * FROM ivrs WHERE id = '{$ivrId}'";
    return executeScalar($query);
}

/**
 * @brief Permite obtener una queue
 * @param string $queueId
 * @return array|null
 */
function getQueue(string $queueId): ?array
{
    $query = "SELECT * FROM queues WHERE id = '{$queueId}'";
    return executeScalar($query);
}














