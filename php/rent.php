<?php

require_once("../../common/php/environment.php");

$db = new Database();

$query = "";
              
$result = $db->execute($params, $query);

$db = null;

Util::setResponse($result);