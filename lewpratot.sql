-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Feb 18. 09:44
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `lewpratot`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `dijak`
--

CREATE TABLE `dijak` (
  `dijid` int(10) NOT NULL,
  `arnapi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `dijak`
--

INSERT INTO `dijak` (`dijid`, `arnapi`) VALUES
(10, 11000),
(20, 11400),
(30, 12000),
(40, 11900),
(50, 12100),
(60, 13000),
(70, 11500),
(80, 11400),
(90, 12500),
(100, 13000);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `fizetes`
--

CREATE TABLE `fizetes` (
  `fizid` int(11) NOT NULL,
  `megnev` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `fizetes`
--

INSERT INTO `fizetes` (`fizid`, `megnev`) VALUES
(1, 'készpénz'),
(2, 'bankkártya'),
(3, 'banki átutalás');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `foglalas`
--

CREATE TABLE `foglalas` (
  `foglalasid` int(11) NOT NULL,
  `jarmuid` int(10) NOT NULL,
  `datum` date NOT NULL,
  `felhaszid` int(11) NOT NULL,
  `megjegyzes` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jarmuvek`
--

CREATE TABLE `jarmuvek` (
  `jarmuid` int(10) NOT NULL,
  `dijid` int(10) NOT NULL,
  `autonev` text NOT NULL,
  `fogyasztas` decimal(5,0) NOT NULL,
  `uzemanyag` varchar(10) NOT NULL,
  `ajtoszam` int(11) NOT NULL,
  `loero` int(11) NOT NULL,
  `kep` varchar(50) NOT NULL,
  `valtos` varchar(15) NOT NULL,
  `klima` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `jarmuvek`
--

INSERT INTO `jarmuvek` (`jarmuid`, `dijid`, `autonev`, `fogyasztas`, `uzemanyag`, `ajtoszam`, `loero`, `kep`, `valtos`, `klima`) VALUES
(1, 10, 'Ford Fusion', 8, 'benzin', 4, 141, 'fordfusion.jpg', 'manual', 1),
(2, 20, 'BMW E30', 7, 'benzin', 4, 192, 'bmwe30.jpg', 'manual', 1),
(3, 30, 'Honda Civic', 9, 'benzin', 4, 158, 'hondacivic.jpg', 'manual', 0),
(4, 40, 'Toyota Corolla', 8, 'benzin', 4, 169, 'toyotacorolla.jpg', 'automatic', 1),
(5, 50, 'MERCEDES-AMG', 7, 'benzin', 4, 250, 'mercedesamg.jpg', 'automatic', 1),
(6, 60, 'Ford Focus', 8, 'benzin', 4, 160, 'fordfocus.jpg', 'manual', 0),
(7, 70, 'Audi A6 4G', 6, 'diesel', 4, 177, 'audiag.jpg', 'manual', 1),
(8, 80, 'Ford Bronco', 9, 'benzin', 4, 330, 'bronco.jpg', 'automatic', 1),
(9, 90, 'Ford Bronco Sport', 11, 'benzin', 4, 238, 'broncosport.jpg', 'automatic', 1),
(10, 100, 'Audi SQ7 SUV', 9, 'benzin', 4, 500, 'audisqsuv.jpg', 'automatic', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kolcsonzes`
--

CREATE TABLE `kolcsonzes` (
  `kolcsonzesid` int(25) NOT NULL,
  `felhaszid` int(11) NOT NULL,
  `vegosszeg` int(11) NOT NULL,
  `kolcskezdet` date NOT NULL,
  `kolcsonzestartama` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kolcsonzeselemek`
--

CREATE TABLE `kolcsonzeselemek` (
  `kolcsonzesid` int(25) NOT NULL,
  `jarmuid` int(10) NOT NULL,
  `darab` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user`
--

CREATE TABLE `user` (
  `felhaszid` int(11) NOT NULL,
  `jelsz` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `cim` varchar(100) NOT NULL,
  `iranyitoszam` int(4) NOT NULL,
  `varos` varchar(50) NOT NULL,
  `megye` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `dijak`
--
ALTER TABLE `dijak`
  ADD PRIMARY KEY (`dijid`);

--
-- A tábla indexei `fizetes`
--
ALTER TABLE `fizetes`
  ADD PRIMARY KEY (`fizid`);

--
-- A tábla indexei `foglalas`
--
ALTER TABLE `foglalas`
  ADD PRIMARY KEY (`foglalasid`),
  ADD KEY `jarmuid` (`jarmuid`),
  ADD KEY `felhaszid` (`felhaszid`);

--
-- A tábla indexei `jarmuvek`
--
ALTER TABLE `jarmuvek`
  ADD PRIMARY KEY (`jarmuid`),
  ADD KEY `dijid` (`dijid`);

--
-- A tábla indexei `kolcsonzes`
--
ALTER TABLE `kolcsonzes`
  ADD PRIMARY KEY (`kolcsonzesid`),
  ADD KEY `felhaszid` (`felhaszid`);

--
-- A tábla indexei `kolcsonzeselemek`
--
ALTER TABLE `kolcsonzeselemek`
  ADD PRIMARY KEY (`kolcsonzesid`,`jarmuid`);

--
-- A tábla indexei `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`felhaszid`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `fizetes`
--
ALTER TABLE `fizetes`
  MODIFY `fizid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `jarmuvek`
--
ALTER TABLE `jarmuvek`
  MODIFY `jarmuid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `felhaszid` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
