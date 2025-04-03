-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Már 26. 11:56
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
-- Tábla szerkezet ehhez a táblához `connection`
--

CREATE TABLE `connection` (
  `id` int(11) NOT NULL,
  `vezeteknev` varchar(100) NOT NULL,
  `keresztnev` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefonszam` varchar(20) NOT NULL,
  `uzenet` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `connection`
--

INSERT INTO `connection` (`id`, `vezeteknev`, `keresztnev`, `email`, `telefonszam`, `uzenet`) VALUES
(1, 'Ódry', 'Attila', 'odry.attila@keri.mako.hu', '222', 'Áldjon meg benneteket az Isten!');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `dijak`
--

CREATE TABLE `dijak` (
  `dijid` int(10) NOT NULL,
  `ar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `dijak`
--

INSERT INTO `dijak` (`dijid`, `ar`) VALUES
(10, 7200),
(20, 8800),
(30, 7600),
(40, 7100),
(50, 9800),
(60, 8100),
(70, 9400),
(80, 9100),
(90, 9300),
(100, 10000),
(110, 9200),
(120, 11000),
(130, 8700),
(140, 9300),
(150, 9500),
(160, 7800),
(170, 8700),
(180, 9300);

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
  `marka` int(11) NOT NULL,
  `fogyasztas` decimal(5,0) NOT NULL,
  `uzemanyag` varchar(10) NOT NULL,
  `ajtoszam` int(11) NOT NULL,
  `loero` int(11) NOT NULL,
  `kep` varchar(50) NOT NULL,
  `valtos` varchar(15) NOT NULL,
  `klima` tinyint(1) NOT NULL,
  `kivitel` varchar(20) NOT NULL,
  `hengerurtart` int(5) NOT NULL,
  `meghajtas` varchar(20) NOT NULL,
  `darab` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `jarmuvek`
--

INSERT INTO `jarmuvek` (`jarmuid`, `dijid`, `autonev`, `marka`, `fogyasztas`, `uzemanyag`, `ajtoszam`, `loero`, `kep`, `valtos`, `klima`, `kivitel`, `hengerurtart`, `meghajtas`, `darab`) VALUES
(1, 10, 'Ford Fusion', 2, 8, 'benzin', 5, 141, 'fordfusion.jpg', 'manual', 1, 'ferdehátú', 1388, 'Első kerék', 7),
(2, 20, 'BMW E30', 1, 7, 'benzin', 5, 192, 'bmwe30.jpg', 'manual', 1, 'sedan', 2443, 'Hátsó kerék', 10),
(3, 30, 'Honda Civic', 9, 9, 'benzin', 5, 158, 'hondacivic.jpg', 'manual', 0, 'ferdehátú', 1996, 'Első kerék', 7),
(4, 40, 'Toyota Corolla', 4, 8, 'benzin', 5, 169, 'toyotacorolla.jpg', 'automatic', 1, 'sedan', 1798, 'Első kerék', 9),
(5, 50, 'MERCEDES-AMG', 6, 7, 'benzin', 5, 250, 'mercedesamg.jpg', 'automatic', 1, 'kombi', 2999, 'Összkerék', 9),
(6, 60, 'Ford Focus', 2, 8, 'benzin', 5, 160, 'fordfocus.jpg', 'manual', 0, 'sedan', 1499, 'Első kerék', 8),
(7, 70, 'Audi A6 4G', 5, 6, 'dizel', 5, 177, 'audia8.jpg', 'manual', 1, 'sedan', 2967, 'Összkerék', 13),
(8, 80, 'Ford Bronco', 2, 9, 'benzin', 5, 330, 'bronco.jpg', 'automatic', 1, 'városi terepjáró', 1999, 'Összkerék', 7),
(9, 90, 'Ford Bronco Sport', 2, 11, 'benzin', 5, 238, 'broncosport.jpg', 'automatic', 1, 'városi terepjáró', 2694, 'Összkerék', 5),
(10, 100, 'Audi SQ7 SUV', 5, 9, 'benzin', 5, 500, 'audisqsuv.jpg', 'automatic', 1, 'városi terepjáró', 3956, 'Összkerék', 7),
(11, 110, 'Renault Espace', 3, 6, 'dizel', 5, 255, 'renaultespace.jpg', 'manual', 1, 'egyterű', 1798, 'Első kerék', 5),
(12, 120, 'Skoda Superb', 10, 8, 'dizel', 5, 255, 'skodasuperb.jpg', 'automatic', 1, 'ferdehátú', 1968, 'Első kerék', 3),
(13, 130, 'Skoda Octavia', 10, 7, 'benzin', 5, 255, 'toyotaoctavia.jpg', 'manual', 1, 'kombi', 1598, 'Első kerék', 12),
(14, 140, 'Opel Corsa', 7, 8, 'benzin', 5, 255, 'opelcorsa.jpg', 'manual', 1, 'ferdehátú', 1199, 'Első kerék', 12),
(15, 150, 'Audi A6', 5, 6, 'dizel', 5, 255, 'audia6.jpg', 'manual', 1, 'sedan', 2967, 'Összkerék', 13),
(16, 160, 'Renault Megane', 3, 7, 'dizel', 5, 255, 'renaultmegane.jpg', 'manual', 1, 'kombi', 1461, 'Első kerék', 15),
(17, 170, 'BMW 5 G30', 1, 7, 'dizel', 5, 255, 'bmwg30.jpg', 'manual', 1, 'sedan', 1998, 'Összkerék', 11),
(18, 180, 'Audi 80', 5, 8, 'dizel', 5, 255, 'audi80.jpg', 'manual', 1, 'sedan', 1896, 'Első kerék', 6);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kolcsonzes`
--

CREATE TABLE `kolcsonzes` (
  `kolcsonzesid` int(25) NOT NULL,
  `felhaszid` int(11) NOT NULL,
  `vegosszeg` int(11) NOT NULL,
  `felvhely` varchar(50) NOT NULL,
  `leadhely` varchar(50) NOT NULL,
  `felvdatum` date NOT NULL,
  `leaddatum` date NOT NULL
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
-- Tábla szerkezet ehhez a táblához `markak`
--

CREATE TABLE `markak` (
  `id` int(11) NOT NULL,
  `nev` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `markak`
--

INSERT INTO `markak` (`id`, `nev`) VALUES
(1, 'BMW'),
(2, 'Ford'),
(3, 'Renault'),
(4, 'Toyota'),
(5, 'Audi'),
(6, 'Mercedes'),
(7, 'Opel'),
(9, 'Honda'),
(10, 'Skoda');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user`
--

CREATE TABLE `user` (
  `felhaszid` int(11) NOT NULL,
  `jelsz` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `vezeteknev` varchar(100) NOT NULL,
  `keresztnev` varchar(100) NOT NULL,
  `masodiknev` varchar(100) DEFAULT NULL,
  `telszam` varchar(20) NOT NULL,
  `szulev` date NOT NULL,
  `nem` char(1) NOT NULL,
  `cim` varchar(100) DEFAULT NULL,
  `iranyitoszam` int(4) DEFAULT NULL,
  `varos` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`felhaszid`, `jelsz`, `email`, `vezeteknev`, `keresztnev`, `masodiknev`, `telszam`, `szulev`, `nem`, `cim`, `iranyitoszam`, `varos`) VALUES
(1, '1234Aa', 'pragai.bence-2020@keri.mako.hu', 'Prágai', 'Bence', 'Leonárd', '06201114466', '2005-07-06', 'M', 'Doktor u. 5', 6000, 'Tilted towers'),
(7, '1234Aa', 'asd@asdasd.com', 'asd', 'asd', NULL, '06201112233', '1988-12-13', 'M', NULL, NULL, NULL),
(8, '1234Aa', 'a@a.aa', 'AAAAAAAAAAAA', 'BBBBBBBBBBBB', NULL, '2332323223', '2026-07-24', 'M', 'AAAAAAAAAAAAAAAAAAAAA', 0, 'assasa'),
(9, '1234Aa', 'nagyjanos@gmail.com', 'Nagy', 'János', 'László', '06704443312', '1999-01-04', 'M', NULL, NULL, 'Kaposvár');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `connection`
--
ALTER TABLE `connection`
  ADD PRIMARY KEY (`id`);

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
-- A tábla indexei `markak`
--
ALTER TABLE `markak`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`felhaszid`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `connection`
--
ALTER TABLE `connection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `fizetes`
--
ALTER TABLE `fizetes`
  MODIFY `fizid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `jarmuvek`
--
ALTER TABLE `jarmuvek`
  MODIFY `jarmuid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT a táblához `kolcsonzes`
--
ALTER TABLE `kolcsonzes`
  MODIFY `kolcsonzesid` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `markak`
--
ALTER TABLE `markak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `felhaszid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
