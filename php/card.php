<?php
declare(strict_types=1);

require_once("../../common/php/environment.php");

$db = new Database();

$query = "SELECT `jarmuid`, 
                 `autonev`, 
                 `marka`,
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
              

$result['cars'] = $db->execute($query);

$query = "SELECT `id`, 
                 `nev`
            FROM `markak`
        ORDER BY `id`;";

$result['markak'] = $db->execute($query);

array_push($result['markak'], [
     'id'  => 0,
     'nev' => 'Összes'
]);

$db = null;

Util::setResponse($result);
