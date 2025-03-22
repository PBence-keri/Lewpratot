<?php

// Set environment
require_once("../../common/php/environment.php");

// Get arguments
$args = Util::getArgs();

$userId = $args["felhaszid"];
unset($args["felhaszid"]);

// Connect to database
$db = new Database();

// Set SQL command
$query = $db->preparateUpdate ("user", $args);

$query .= " WHERE `felhaszid` = {$userId}";

// Execute SQL command
$result = $db->execute($query, array_values($args));

// Close connection
$db = null;

// Set response
Util::setResponse($result);

// Add the password verification logic
if (isset($args["password"])) {
  $password = $args["password"];
  unset($args["password"]);
  
  // Fetch stored password hash
  $stmt = $db->prepare("SELECT jelsz FROM user WHERE felhaszid = ?");
  $stmt->execute([$userId]);
  $hash = $stmt->fetchColumn();
  
  if (!password_verify($password, $hash)) {
      Util::setResponse(["success" => false, "message" => "Hibás jelszó!"]);
      exit();
  }
}
