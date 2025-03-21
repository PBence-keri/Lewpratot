<?php

// Set environment
require_once("../../common/php/environment.php");

// Get arguments
$args = Util::getArgs();

// Connect to database
$db = new Database();

// Set SQL command
$query = $db->preparateInsert ("connection", $args);

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