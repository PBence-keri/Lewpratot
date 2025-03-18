<?php

// Set environment
require_once("../../common/php/environment.php");

// Get arguments
$args = Util::getArgs();

// Connect to database
$db = new Database();

// Merge arguments with default
$args = Util::objMerge(array(
  "kolcsonzesid" => null,
  "felhaszid" => null,
  "vegosszeg" => null,
  "felvetel" => null,
  "leadas" => null,
  "kolcskezdet" => null,
  "kolcsvege" => null
), $args, true);  

// Set SQL command
$query = $db->preparateInsert ("kolcsonzes", $args);

// Execute SQL command
$result = $db->execute($query, array_values($args));

// Close connection
$db = null;

// Set response
Util::setResponse($result);