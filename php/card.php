<?php

declare(strict_types=1);

$host = 'localhost';
$username = 'root';
$password = '';
$database = 'lewpratot';

$conn = new mysqli($host, $username, $password, $database);


require_once("./environment.php");


$args = Util::getArgs();

$query = "SELECT * FROM `jarmuvek`;";


$db = new Database();


$result = $db->execute($query, array($args['email']));


$db = null;

if ($conn->connect_error) {
    die("Kapcsolódási hiba: " . $conn->connect_error);
}


if (is_null($result))
	Util::setError("A felhasználó nem létezik ezen az e-mail címen!");


$result = $result[0];


if ($result['password'] !== $args['password'])
	Util::setError("Helytelen jelszó!");


unset($result['password']);


Util::setResponse($result);
