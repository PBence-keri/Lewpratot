-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Ápr 29. 23:49
-- Kiszolgáló verziója: 10.4.24-MariaDB
-- PHP verzió: 8.1.6

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(180, 9300),
(190, 7800),
(200, 7600),
(210, 7600),
(220, 7500),
(230, 8100),
(240, 7700),
(250, 7500),
(260, 8000),
(270, 7700),
(290, 7900);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `fizetes`
--

CREATE TABLE `fizetes` (
  `fizid` int(11) NOT NULL,
  `megnev` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `meghajtas` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `jarmuvek`
--

INSERT INTO `jarmuvek` (`jarmuid`, `dijid`, `autonev`, `marka`, `fogyasztas`, `uzemanyag`, `ajtoszam`, `loero`, `kep`, `valtos`, `klima`, `kivitel`, `hengerurtart`, `meghajtas`) VALUES
(1, 10, 'Ford Fusion', 2, '8', 'benzin', 5, 141, 'fordfusion.jpg', 'manual', 1, 'ferdehátú', 1388, 'Első kerék'),
(2, 20, 'BMW E30', 1, '7', 'benzin', 5, 192, 'bmwe30.jpg', 'manual', 1, 'sedan', 2443, 'Hátsó kerék'),
(3, 30, 'Honda Civic', 9, '9', 'benzin', 5, 158, 'hondacivic.jpg', 'manual', 0, 'ferdehátú', 1996, 'Első kerék'),
(4, 40, 'Toyota Corolla', 4, '8', 'benzin', 5, 169, 'toyotacorolla.jpg', 'automatic', 1, 'sedan', 1798, 'Első kerék'),
(5, 50, 'MERCEDES-AMG', 6, '7', 'benzin', 5, 250, 'mercedesamg.jpg', 'automatic', 1, 'kombi', 2999, 'Összkerék'),
(6, 60, 'Ford Focus', 2, '8', 'benzin', 5, 160, 'fordfocus.jpg', 'manual', 0, 'sedan', 1499, 'Első kerék'),
(7, 70, 'Audi A6 4G', 5, '6', 'dizel', 5, 177, 'audia8.jpg', 'manual', 1, 'sedan', 2967, 'Összkerék'),
(8, 80, 'Ford Bronco', 2, '9', 'benzin', 5, 330, 'bronco.jpg', 'automatic', 1, 'városi terepjáró', 1999, 'Összkerék'),
(9, 90, 'Ford Bronco Sport', 2, '11', 'benzin', 5, 238, 'broncosport.jpg', 'automatic', 1, 'városi terepjáró', 2694, 'Összkerék'),
(10, 100, 'Audi SQ7 SUV', 5, '9', 'benzin', 5, 500, 'audisqsuv.jpg', 'automatic', 1, 'városi terepjáró', 3956, 'Összkerék'),
(11, 110, 'Renault Espace', 3, '6', 'dizel', 5, 255, 'renaultespace.jpg', 'manual', 1, 'egyterű', 1798, 'Első kerék'),
(12, 120, 'Skoda Superb', 10, '8', 'dizel', 5, 255, 'skodasuperb.jpg', 'automatic', 1, 'ferdehátú', 1968, 'Első kerék'),
(13, 130, 'Skoda Octavia', 10, '7', 'benzin', 5, 255, 'toyotaoctavia.jpg', 'manual', 1, 'kombi', 1598, 'Első kerék'),
(14, 140, 'Opel Corsa', 7, '8', 'benzin', 5, 255, 'opelcorsa.jpg', 'manual', 1, 'ferdehátú', 1199, 'Első kerék'),
(15, 150, 'Audi A6', 5, '6', 'dizel', 5, 255, 'audia6.jpg', 'manual', 1, 'sedan', 2967, 'Összkerék'),
(16, 160, 'Renault Megane', 3, '7', 'dizel', 5, 255, 'renaultmegane.jpg', 'manual', 1, 'kombi', 1461, 'Első kerék'),
(17, 170, 'BMW 5 G30', 1, '7', 'dizel', 5, 255, 'bmwg30.jpg', 'manual', 1, 'sedan', 1998, 'Összkerék'),
(18, 180, 'Audi 80', 5, '8', 'dizel', 5, 255, 'audi80.jpg', 'manual', 1, 'sedan', 1896, 'Első kerék'),
(19, 190, 'BMW M3', 1, '10', 'dizel', 5, 212, 'bmw_1.jpg', 'automatic', 1, 'sedan', 1798, 'Első Kerék'),
(20, 200, 'Honda Accord', 9, '9', 'dizel', 5, 160, 'honda_accord.jpg', 'maunal', 1, 'kombi', 1889, 'Hátsó Kerek'),
(21, 210, 'Honda Jazz', 9, '9', 'benzin', 5, 142, 'honda_jazz.jpg', 'manual', 1, 'sedan', 1800, 'Első Kerék'),
(22, 220, 'Mercedes A', 5, '11', 'dizel', 5, 194, 'mercedes_A.jpg', 'automatic', 1, 'kombi', 1892, 'Első Kereék'),
(23, 230, 'Mercedes E', 6, '12', 'dizel', 5, 193, 'mercedes_E.jpg', 'automatic', 1, 'kombi', 1670, 'Hátsó Kerék'),
(24, 240, 'Opel Ampera', 7, '7', 'benzin', 5, 152, 'opel_ampera.jpg', 'maunual', 1, 'Egyterű', 1800, 'Első Kerek'),
(25, 250, 'Opel Transpert', 7, '9', 'benzin', 5, 146, 'opel_transpert.jpg', 'manual', 1, 'egyterű', 1601, 'Első Kerék'),
(26, 260, 'Renault Twingo', 3, '10', 'benzin', 3, 134, 'renault twingo.jpg', 'manual', 1, 'sedan', 1705, 'Első Kerék'),
(27, 270, 'Skoda SUV', 10, '13', 'dizel', 5, 163, 'skoda_suv.jpg', 'automatic', 1, 'városi terepjáró', 1978, 'Első kerék'),
(28, 280, 'Toyota Camry', 4, '12', 'dizel', 5, 176, 'toyota_camry.jpg', 'maunal', 1, 'kombi', 1487, 'Első kerék'),
(29, 290, 'Toyota Corolla 2025', 4, '9', 'benzin', 5, 142, 'toyota_corolla.jpg', 'maunal', 1, 'ferdehátú', 1672, 'Első Kerék');

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
  `leaddatum` date NOT NULL,
  `jarmuid` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `kolcsonzes`
--

INSERT INTO `kolcsonzes` (`kolcsonzesid`, `felhaszid`, `vegosszeg`, `felvhely`, `leadhely`, `felvdatum`, `leaddatum`, `jarmuid`) VALUES
(1, 9, 7600, 'asd', '', '0000-00-00', '2222-02-01', 0),
(2, 9, 8800, 'asd', '', '2025-03-29', '2025-04-02', 2),
(3, 9, 8800, 'asd', '', '2025-03-29', '2025-04-02', 2),
(4, 9, 7200, '95951', '2952952952', '2025-03-27', '2025-04-04', 1),
(5, 9, 8800, '23', '4', '0000-00-00', '5555-11-02', 2),
(6, 9, 7600, 'v', 'v v', '2025-03-26', '2025-03-27', 3),
(7, 9, 7600, 'c', 'f', '2025-03-27', '2025-04-01', 3),
(8, 9, 7600, '', '', '0000-00-00', '0000-00-00', 3),
(9, 9, 9800, 'er', 'r', '2025-03-27', '2025-04-03', 5);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `markak`
--

CREATE TABLE `markak` (
  `id` int(11) NOT NULL,
  `nev` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Tábla szerkezet ehhez a táblához `review`
--

CREATE TABLE `review` (
  `nev` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `ertekeles` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`felhaszid`, `jelsz`, `email`, `vezeteknev`, `keresztnev`, `masodiknev`, `telszam`, `szulev`, `nem`, `cim`, `iranyitoszam`, `varos`) VALUES
(1, '1234Aa', 'kovacsbela@gmail.com', 'Kovács', 'Béla', 'István', '06101234567', '1990-05-14', 'M', 'Fő utca 1.', 1011, 'Budapest'),
(2, '1234Aa', 'nagyanna@freemail.hu', 'Nagy', 'Anna', '', '06102345678', '1989-11-22', 'F', 'Petőfi utca 2.', 4026, 'Debrecen'),
(3, '1234Aa', 'szabogabor@citromail.hu', 'Szabó', 'Gábor', '', '06103456789', '1992-03-18', 'M', 'Kossuth tér 3.', 6720, 'Szeged'),
(4, '1234Aa', 'totheszter@gmail.com', 'Tóth', 'Eszter', 'Linda', '06104567890', '1985-07-09', 'F', 'Jókai utca 4.', 8000, 'Székesfehérvár'),
(5, '1234Aa', 'kissdaniel@freemail.hu', 'Kiss', 'Dániel', '', '06105678901', '1993-02-26', 'M', 'Ady Endre utca 5.', 8900, 'Zalaegerszeg'),
(6, '1234Aa', 'molnarreka@citromail.hu', 'Molnár', 'Réka', '', '06106789012', '1991-08-13', 'F', 'Bartók Béla út 6.', 7400, 'Kaposvár'),
(7, '1234Aa', 'vargamate@gmail.com', 'Varga', 'Máté', 'András', '06107890123', '1988-01-17', 'M', 'Széchenyi tér 7.', 3525, 'Miskolc'),
(8, '1234Aa', 'horvathkitti@freemail.hu', 'Horváth', 'Kitti', '', '06108901234', '1994-04-06', 'F', 'Arany János utca 8.', 4032, 'Debrecen'),
(9, '1234Aa', 'baloghzoltan@gmail.com', 'Balogh', 'Zoltán', '', '06109012345', '1987-12-29', 'M', 'Erzsébet körút 9.', 7621, 'Pécs'),
(10, '1234Aa', 'pappjulia@citromail.hu', 'Papp', 'Júlia', 'Éva', '06100123456', '1995-09-30', 'F', 'Rákóczi út 10.', 9022, 'Győr'),
(11, '1234Aa', 'takacsbence@freemail.hu', 'Takács', 'Bence', '', '06111234567', '1990-06-21', 'M', 'Attila út 11.', 1134, 'Budapest'),
(12, '1234Aa', 'farkasaniko@gmail.com', 'Farkas', 'Anikó', '', '06112234567', '1992-10-04', 'F', 'Szondi utca 12.', 7633, 'Pécs'),
(13, '1234Aa', 'juhasznorbert@citromail.hu', 'Juhász', 'Norbert', '', '06113234567', '1986-03-12', 'M', 'Lövőház utca 13.', 2045, 'Törökbálint'),
(14, '1234Aa', 'kissviktoria@gmail.com', 'Kiss', 'Viktória', 'Mária', '06114234567', '1991-05-03', 'F', 'Váci út 14.', 3529, 'Miskolc'),
(15, '1234Aa', 'olahpeter@freemail.hu', 'Oláh', 'Péter', '', '06115234567', '1989-02-15', 'M', 'Thököly út 15.', 6724, 'Szeged'),
(16, '1234Aa', 'lakatoserika@citromail.hu', 'Lakatos', 'Erika', '', '06116234567', '1993-07-27', 'F', 'Üllői út 16.', 9700, 'Szombathely'),
(17, '1234Aa', 'simonkristof@gmail.com', 'Simon', 'Kristóf', '', '06117234567', '1994-11-01', 'M', 'Fogarasi út 17.', 6000, 'Kecskemét'),
(18, '1234Aa', 'raczlilla@freemail.hu', 'Rácz', 'Lilla', '', '06118234567', '1985-08-16', 'F', 'Fehérvári út 18.', 5600, 'Békéscsaba'),
(19, '1234Aa', 'szilagyiadam@citromail.hu', 'Szilágyi', 'Ádám', 'Gergely', '06119234567', '1987-01-06', 'M', 'Bajcsy-Zsilinszky út 19.', 7100, 'Szekszárd'),
(20, '1234Aa', 'feherzsofia@gmail.com', 'Fehér', 'Zsófia', '', '06120234567', '1990-12-11', 'F', 'Andrássy út 20.', 8800, 'Nagykanizsa'),
(21, '1234Aa', 'pragai.bence-2020@keri.mako.hu', 'Prágai', 'Bence', '', '06202960195', '2005-07-06', 'M', NULL, NULL, NULL);

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
  MODIFY `jarmuid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT a táblához `kolcsonzes`
--
ALTER TABLE `kolcsonzes`
  MODIFY `kolcsonzesid` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `markak`
--
ALTER TABLE `markak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `felhaszid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
