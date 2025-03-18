<?php 
declare(strict_types=1);

require_once("../../common/php/environment.php");

$db = new Database();

$args = Util::getArgs();

$params = Util::objectMerge(array(
    "vezeteknev" => null,
    "keresztnev" => null,
    "email" => null,
    "telefonszam" => null,
    "uzenet" => null,
),$args, true);

$query = "INSERT INTO `help`(`vezeteknev`, `keresztnev`, `email`, `telefonszam`, `uzenet`) VALUES ('?','?','?','?','?')";
              
$result = $db->execute($params, $query);

$db = null;

Util::setResponse($result);
