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
    if ($fila = $result->fetch_array()) {
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
    if ($fila = $result->fetch_array()) {
        return true;
    }
    return false;
}

/**
 * TODO
 * @brief Funcion encargada de consultar los datos de la corporacion
 * @param string $corpId
 * @return array|null
 */
function getCorpInfo(string $corpId): ?array
{
    $corpInfo = executeQuery("SELECT * from corps WHERE id = '{$corpId}' ");

    return $corpInfo->fetch_assoc();
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
    $result = executeQuery("SELECT `action`, `data`, `type` FROM speeddials WHERE `number` = '{$dst}' AND `type` = '1' AND `entityID` = '{$extenId}'");

    return $result->fetch_assoc();
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
    $result = executeQuery("SELECT `action`, `data`, `type` FROM speeddials where `number` = '{$dst}' AND `type` = '1' AND `entityId` = '{$corpId}'");
    if ($fila = $result->fetch_assoc()) {
        return $fila;
    }
    return null;
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
    if ($extenId == null) return -1;
    $query = "SELECT r.type,CASE r.pattern WHEN '' THEN dgp.pattern ELSE r.pattern END AS patron,r.permit,r.pin 
                    FROM restrictions r 
                        LEFT JOIN destination_group_patterns dgp ON dgp.group = r.groupID 
                    WHERE '{$dest}' LIKE REPLACE(REPLACE(REPLACE(REPLACE(	
                        CASE r.pattern WHEN '' 
                        THEN dgp.pattern 
                        ELSE r.pattern END, '.', '_'), 'T', '%'), 'CC', '{$countryCode}'), 'AC', '{$areaCode}') 
                    AND (r.type='1' AND r.entityID = '$extenId')  
                    ORDER BY r.type ASC, LENGTH(patron) DESC,
                    LENGTH(REPLACE(REPLACE(REPLACE(REPLACE(patron,'T',''),'CC','{$countryCode}'),'AC','{$areaCode}'),'.','')) DESC limit 1;";

    $result = executeQuery($query);

    if ($fila = $result->fetch_assoc()) {
        return $fila;
    }

    return null;
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
                    ORDER BY r.type ASC, LENGTH(patron) DESC,
                    LENGTH(REPLACE(REPLACE(REPLACE(REPLACE(patron,'T',''),'CC','{$countryCode}'),'AC','{$areaCode}'),'.','')) DESC limit 1;";
    $result = executeQuery($query);


    if ($fila = $result->fetch_assoc()) {
        return $fila;
    }
    return null;
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
 * @return string|null
 */

function getDelimiters(): ?string
{
    $result = executeQuery("SELECT `value` FROM `parameters` WHERE `key` = 'delimiter_key'");
    if ($fila = $result->fetch_assoc()) {
        return $fila['value'];
    }
    return null;
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



