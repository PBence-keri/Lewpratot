<?php
declare(strict_types=1);

require_once("./environment.php");

$query = "SELECT `jarmuid`, 
                 `autonev`, 
                 `fogyasztas`, 
                 `uzemanyag`, 
                 `ajtoszam`, 
                 `loero`, 
                 `kep`, 
                 `valtos`, 
                 `klima`,
                 `dijak`.`ar` AS `ar`
            FROM `jarmuvek`
      INNER JOIN `dijak`
              ON `jarmuvek`.`dijid` = `dijak`.`dijid`;";

$db = new Database();

$result = $db->execute($query);

$db = null;

Util::setResponse($result);
