-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 05. Mrz 2021 um 20:17
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
-- Datenbank: `sprintquiz`
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
(2, 100, 'Frage der Stufe 2 (momentan Schlussfrage)');

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
(1, 1, 1, 'Die erste Frage', 'Hier steht die richtige Antwort', 'Das wäre auch denkbar, aber falsch.', 'Das ist undenkbar.', 'Völlig unglaubwürdig.', 'bravo', 'obwohl denkbar, ist nun einmal falsch', 'völliger Stuss!', 'Keine voreiligen Schlüsse ziehen...'),
(2, 2, 1, 'Anschlussfrage', 'richtig', 'falsch 1', 'falsch 2', 'falsch 3', 'genau!', 'besser wäre 1', 'besser wäre nicht 2 sondern 1', 'besser wäre weder 2 noch 3 sondern 1');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
