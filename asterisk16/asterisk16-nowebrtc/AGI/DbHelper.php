<?php

function executeQuery($query)
{
    $mysqli = new mysqli("127.0.0.1", "centrex", "centrex123", "newcentrex");

    if ($mysqli->connect_errno) {
        return null;
    }
    return $mysqli->query($query);
}