<?php

// Include environment
require_once("../../common/php/environment.php");

// Get arguments
$args = Util::getArgs();

// Set SQL command
$query = "SELECT `felhaszid`,
				 `vezeteknev`,
				 `keresztnev`,
				 `masodiknev`,
				 `jelsz`,
                 `telszam`,
                 `varos`,
                 `iranyitoszam`,
                 `cim`
          FROM   `user` 
          WHERE  `email` = ?
          AND    `jelsz` = ?
          LIMIT  1";

// Connect to MySQL server
$db = new Database();

// Execute SQL command
$result = $db->execute($query, [$args['email'], $args['jelsz']]);

// Close connection
$db = null;

// Check result
if (is_null($result)) 
    Util::setError("A felhasználó nem létezik ezen az e-mail címen!");

// Simplifying the result
$result = $result[0];

// Check password
if ($result['jelsz'] !== $args['jelsz']) {
    Util::setError("Helytelen jelszó!");
}

// Remove password property
unset($result['jelsz']);

// Set response
Util::setResponse($result);