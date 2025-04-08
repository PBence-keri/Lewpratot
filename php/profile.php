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

// Check if a result was found
if ($result && isset($result[0]['jelsz'])) {
    $jelsz = $result[0]['jelsz'];
    
    // If passwords match
    if ($args['jelsz'] === $jelsz) {

        // Only update if a new password is provided
        if (!empty($args['jelszuj'])) {
            $args['jelsz'] = $args['jelszuj'];

            // Prepare SQL query to update the user data
            $updateQuery = "UPDATE `user` SET `jelsz` = :jelsz WHERE `felhaszid` = :felhaszid";
            $updateResult = $db->execute($updateQuery, ['jelsz' => $args['jelsz'], 'felhaszid' => $args['felhaszid']]);
            //if no new password preparate

            // Check if the update was successful
            if (isset($updateResult['affectedRows']) && $updateResult['affectedRows'] > 0) {
                Util::setResponse($updateResult); // If successful, return the result
            }
            Util::setError('Nincsenek változások!');
        }
        $updateDataQuery = $db->preparateUpdate("user", $args);
        unset($args['jelsz']);
        $updateDataResult = $db->execute($updateDataQuery, $args);
    }
    // If current password is incorrect
    Util::setError("Helytelen jelszó!");
}

// Close the database connection
$db = null;