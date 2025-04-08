<?php 
declare(strict_types=1);

require_once("../../common/php/environment.php");

$db = new Database();

$args = Util::getArgs();

$params = Util::objectMerge(array(
    "nev" => null,
    "email" => null,
    "ertekels" => null,

),$args, true);

$query = "INSERT INTO `review`(`nev`, `email`, `ertekeles`) VALUES ('?','?','?')";
              
$result = $db->execute($params, $query);

$db = null;

Util::setResponse($result);
