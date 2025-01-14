<?php
declare(strict_types=1);

$host = 'localhost';
$username = 'root';
$password = '';
$database = 'lewpratot';

$conn = new mysqli($host, $username, $password, $database);

if ($conn->connect_error) {
    die("Kapcsolódási hiba: " . $conn->connect_error);
}

function cards(){
    $query= "SELECT * FROM `jarmuvek`;";
    $result = $db->execute($query);
    foreach ($result as $row) {
        echo "ID: " . $row["dijid"] . " - Név: " . $row["autonev"] . " - fogyasztas: " . $row["uzemanyag"] . "<br>";
    }
}

require_once("./environment.php");


$db = new Database();


$db = null;


Util::setResponse($result);