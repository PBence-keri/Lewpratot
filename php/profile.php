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
if (!is_null($result)) {
    $jelsz = $result[0]['jelsz'];
    
    // If passwords match
    if ($args['jelsz'] === $jelsz) {
        unset($args['jelsz']);
        $fields = array_filter($args, function($key) {
            return $key !== "felhaszid";
        }, ARRAY_FILTER_USE_KEY);
        $updateDataQuery = $db->preparateUpdate("user", $fields);
        $updateDataQuery .= " WHERE `felhaszid` = :felhaszid";
        $updateDataResult = $db->execute($updateDataQuery, $args);

        // Close the database connection
        $db = null;

        if ($updateDataResult["affectedRows"]) 
                Util::setResponse("Ok");
        else    Util::setError("Nincs módosítva");
    }

    // Close the database connection
    $db = null;

    // If current password is incorrect
    Util::setError("Helytelen jelszó!");
}


// Close the database connection
$db = null;

// If current password is incorrect
Util::setError("Nincs ilyen felhasználó");