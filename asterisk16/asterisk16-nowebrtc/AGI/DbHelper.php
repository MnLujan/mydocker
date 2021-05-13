<?php

function executeQuery($query)
{
    $mysqli = new mysqli("127.0.0.1", "centrex", "centrex123", "newcentrex");

    if ($mysqli->connect_errno) {
        return null;
    }

    return $mysqli->query($query);
}

function executeInsert($query): int
{
    $mysqli = new mysqli("127.0.0.1", "centrex", "centrex123", "newcentrex");

    if ($mysqli->connect_errno) {
        return 0;
    }

    $res = $mysqli->query($query);
    if ($res == null) {
        return 0;
    }

    return $mysqli->insert_id;
}

function executeScalar(string $query): ?array
{
    $mysqli = new mysqli("127.0.0.1", "centrex", "centrex123", "newcentrex");

    if ($mysqli->connect_errno) {
        return null;
    }

    $res = $mysqli->query($query);
    if (!is_null($res)) {
        return $res->fetch_assoc();
    }
    return null;
}


function openConnection(): ?mysqli
{
    $mysqli = new mysqli("127.0.0.1", "centrex", "centrex123", "newcentrex");

    if ($mysqli->connect_errno) {
        return null;
    }
    return $mysqli;
}