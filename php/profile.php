<?php

// Set environment
require_once("../../common/php/environment.php");

// Get arguments
$args = Util::getArgs();

// Set SQL query to check the current password
$query = "SELECT `jelsz` FROM `user` WHERE `felhaszid` = ? LIMIT 1";

// Connect to MySQL server
$db = new Database();

// Execute the query to check if the current password matches
$result = $db->execute($query, [$args['felhaszid']]);

// Check if the current password is correct
if ($result) {
    
    // If passwords match, update the password
    if ($args['jelszuj']) {

        // Set new password directly
        $args['jelsz'] = $args['jelszuj'];
    }

    // Prepare SQL query to update the user data
    $updateQuery = $db->preparateUpdate("user", $args, "felhaszid");
    $updateQuery .= " WHERE `felhaszid` = :felhaszid";
    $result = $db->execute($updateQuery, $args);
    
}
// If current password is incorrect
Util::setError("Helytelen jelszó!");
exit;

// Check if the update was successful
if (!$result['affectedRows']) {
    // If no rows were affected, set an error
    Util::setError('Nincsennek változások!');
}

// Close the database connection
$db = null;

// Return the response to the client
Util::setResponse($result);