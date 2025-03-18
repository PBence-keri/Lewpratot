<?php

require_once('../../common/php/environment.php');

$bido = Util::getArgs();

$db = new Database();

$query = "SELECT  `email`, 
                  `vezeteknev`, 
                  `keresztnev`, 
                  `masodiknev`, 
                  `telszam`, 
                  `szulev`, 
                  `nem`, 
                  `cim`, 
                  `iranyitoszam`, 
                  `varos` 
             FROM `user` 
            WHERE `felhaszid` = :felhaszid
            LIMIT 1;";

$result = $db->execute($query, $bido);

$db = null;

if (is_null($result))
  Util::setError('dlédslé,dsvlésd');

$result = $result[0];

Util::setResponse($result);