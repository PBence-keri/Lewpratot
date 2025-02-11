<?php

// Set environment
require_once('./environment.php');


// Get arguments
$args = Util::getArgs();

// Connect to database
$db = new Database();

// Merge arguments with default
$args = Util::objMerge(array(
  "vezeteknev" => null,
  "keresztnev" => null,
  "kozepsonev" => null,
  "szulev" => null,
  "email" => null,
  "jelsz" => null,
  "nem" => null,
  "cim" => null,
  "iranyitoszam" => null,
  "varos" => null,
  "megye" => null
), $args, true);  

// Set SQL command
$query = $db->preparateInsert ("user", $args);

// Execute SQL command
$result = $db->execute($query, array_values($args));

// Close connection
$db = null;

// Check not success
if (!$result['affectedRows']) {
  // Set error
  Util::setError('A regisztráció sikertelen!');
}

// Set response
Util::setResponse($result);