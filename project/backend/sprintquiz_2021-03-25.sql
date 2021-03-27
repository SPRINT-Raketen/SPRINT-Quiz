-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 25. Mrz 2021 um 21:15
-- Server-Version: 10.4.17-MariaDB
-- PHP-Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `sprintquiz 1`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `level`
--

INSERT INTO `level` (`id`, `value`, `text`) VALUES
(1, 50, 'Einstiegsfrage'),
(2, 100, 'Frage der Stufe 2 '),
(3, 1000, 'Frage der Stufe 3'),
(4, 10000, 'Frage der Stufe 4'),
(5, 100000, 'Frage der Stufe 5'),
(6, 1000000, 'Frage der Stufe 6 (Millionenfrage)');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `id_level` int(11) NOT NULL DEFAULT 1 COMMENT 'Fremdschlüssl zu level',
  `id_subject` int(11) NOT NULL DEFAULT 1 COMMENT 'Fremdschlüssel zu subject',
  `text` text NOT NULL COMMENT 'die Frage',
  `answer1` text NOT NULL COMMENT 'korrekte Antwort',
  `answer2` text NOT NULL COMMENT 'falsche Antwort 1',
  `answer3` text NOT NULL COMMENT 'falsche Antwort 2',
  `answer4` text NOT NULL COMMENT 'falsche Antwort 3',
  `feedback1` text NOT NULL COMMENT 'feedback zur richtigen Antwort',
  `feedback2` text NOT NULL COMMENT 'Feedback zur falschen Antwort 1',
  `feedback3` text NOT NULL COMMENT 'Feedback zur falschen Antwort 2',
  `feedback4` text NOT NULL COMMENT 'Feedback zur falschen Antwort 3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `question`
--

INSERT INTO `question` (`id`, `id_level`, `id_subject`, `text`, `answer1`, `answer2`, `answer3`, `answer4`, `feedback1`, `feedback2`, `feedback3`, `feedback4`) VALUES
(1, 1, 1, 'Was bezeichnet eine DJ-Technik?', 'Scratchen', 'Posen', 'Drillen', 'Patchen', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(2, 2, 1, 'Was kann man nicht essen?', 'Dortmunder', 'Hamburger', 'Krakauer', 'Berliner', 'genau!', 'besser wäre 1', 'besser wäre nicht 2 sondern 1', 'besser wäre weder 2 noch 3 sondern 1'),
(3, 1, 1, 'Wo lebte Wilhelm Tell angeblich', 'Bürglen', 'Flüelen', 'Altdorf', 'Schattdorf', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(4, 1, 1, 'Woraus besteht der Erdkern?', 'Eisen', 'Kohlenstoff', 'Silizium', 'Wasserstoff', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(5, 1, 1, 'Welches Land war der Gastgeber der Fussball Europameisterschaft 2004?', 'Portugal', 'Griechenland', 'England', 'Frankreich', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(6, 1, 1, 'Die Altersvorsorge in der Schweiz baut auf drei Säulen auf. Die erste Säule ist die …? ', 'staatliche Vorsorge', 'berufliche Vorsorge', 'private Vorsorge', 'geerbte Vorsorge', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(7, 2, 1, 'Welche Nuss ist ein Gewürz?', 'Muskatnuss', 'Kokosnuss', 'Pfeffernuss', 'Walnuss', 'genau!', 'besser wäre 1', 'besser wäre nicht 2 sondern 1', 'besser wäre weder 2 noch 3 sondern 1'),
(8, 2, 1, 'Wie nennt man sinnverwandte Wörter?', 'Synonyme', 'Synkopen', 'Synergien', 'Syndrome', 'genau!', 'besser wäre 1', 'besser wäre nicht 2 sondern 1', 'besser wäre weder 2 noch 3 sondern 1'),
(9, 2, 1, 'Was ist eine Korinthe?', 'getrocknete Weintraube', 'Lebkuchen', 'Lakritze', 'Tempel in Athen', 'genau!', 'besser wäre 1', 'besser wäre nicht 2 sondern 1', 'besser wäre weder 2 noch 3 sondern 1'),
(10, 2, 1, 'Wo kann man mit einer Karte Superpunkte sammeln?', 'Coop', 'SBB', 'Post', 'Spar', 'genau!', 'besser wäre 1', 'besser wäre nicht 2 sondern 1', 'besser wäre weder 2 noch 3 sondern 1'),
(11, 3, 1, 'Wie heisst die Skala, die zur Bestimmung der Schärfe von Früchten der Paprikaprikapflanze dient?', 'Scoville-Skala', 'Richter-Skala', 'Beaufort-Skala', 'Fujita-Skala', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(12, 3, 1, 'Was ist eine Empanada?', 'Teigtasche mit Fleisch', 'Fischsuppe', 'Pudding', 'Gebäck', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(13, 3, 1, 'Die erste Frau, die eine Professur für katholische Theologie erhielt ist Uta Ranke …?', 'Heinemann', 'Herzog', 'Heuss', 'Weizsäcker', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(14, 3, 1, 'Was ist ein Enduro?', 'geländegängiges Fahrzeug', 'parasitische Schnecke', 'Holzkravatte', 'Streitaxt', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(15, 3, 1, 'Die Schweiz ist ein Land von ..?', 'Bergen und Seen', 'Schwingern und Volleyballern', 'Flüssen und Bächen', 'Banker und Büetzer', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(16, 4, 1, 'Was ist ein \"Jambus\"?', 'Versmass', 'Balkon', 'Rollschinken', 'Werkzeug', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(17, 4, 1, 'Was wärmt ein Muff?', 'Hände', 'Hals', 'Ohren', 'Füsse', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(18, 4, 1, 'Wie heisst eine Darstellerin von Acapickels-Mitglied \"Barbara Hutzenlauf\" mit Vornamen?', 'Fritz', 'Hans', 'Joel', 'Kim', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(19, 4, 1, 'Welchen Schmetterling gibt es tatsächlich?', 'Kommafalter', 'Punktfalter', 'Doppelpunktfalter', 'Semikolon', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(20, 4, 1, 'Was ist das leichteste aller Metalle?', 'Lithium', 'Aluminium', 'Quecksilber', 'Titan', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(21, 5, 1, 'Wie schwer ist der Unspunnenstein?', '83.5 kg', '44.7 kg', '101.3 kg', '22.5 kg', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(22, 5, 1, 'Wie nennt man eine Anordnung von drei Pferden vor einer Kutsche, die hintereinander postiert sind?', 'Random', 'Troika', 'Triole', 'Tertiga', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(23, 5, 1, 'Was ist ein Saluki?', 'Windhund', 'Würfelspiel', 'Teezeremonie', 'Kapuzengewand', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(24, 5, 1, 'Der Name welchen Steines bedeutet übersetzt \"nicht trunken\"?', 'Amethyst', 'Saphir', 'Bernstein', 'Opal', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(25, 5, 1, 'In welchem Jahr wurde Rätoromanisch als offizielle Landessprache der Schweiz anerkannt?', '1938', '1945', '1948', '1952', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(26, 6, 1, 'In welcher Einheit gibt man die Lichtstärke an?', 'Candela', 'Lux', 'Lumen', 'Nox', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(27, 6, 1, 'Welcher dieser Teppiche stammt nicht aus Persien?', 'Kaschgar', 'Bachtiari', 'Isfahan', 'Kerman', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(28, 6, 1, 'Was bezeichnen die Biologen als Bryophyten?', 'Moose', 'Quallen', 'Pilze', 'Amöben', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(29, 6, 1, 'Aus welchem Goethe-Drama stammt die Redewendung: \"Himmelhoch jauchzend, zum Tode betrübt?\"', 'Egmont', 'Faust', 'Clavigo', 'Stella', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...'),
(30, 6, 1, 'Welcher Quäker war mit 9 Jahren Vollwaise wurde später Bauingenieur und US-Präsident?', 'Herbert Hoover', 'Franklin D. Roosevelt', 'Jimmy Carter', 'Harry S. Truman', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'knapp daneben', 'Keine voreiligen Schlüsse ziehen...');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `text` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `subject`
--

INSERT INTO `subject` (`id`, `text`) VALUES
(1, 'Allgemein'),
(2, 'Mathematik');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_subject` (`id_subject`),
  ADD KEY `id_level` (`id_level`) USING BTREE;

--
-- Indizes für die Tabelle `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT für Tabelle `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `question_ibfk_2` FOREIGN KEY (`id_subject`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
