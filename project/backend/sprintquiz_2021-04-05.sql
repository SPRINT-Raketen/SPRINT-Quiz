-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 05. Apr 2021 um 13:08
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
-- Datenbank: `sprintquiz db`
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
(1, 1, 1, 'Was bezeichnet eine DJ-Technik?', 'Scratchen', 'Posen', 'Drillen', 'Patchen', 'Richtig! Unter Scratchen oder Scratching wird im Musikjargon die Erzeugung von Tönen durch rhythmisches Hin- und Herbewegen einer laufenden Schallplatte auf einem Plattenspieler bei aufgelegter Nadel verstanden. Dabei können die Töne mit dem Crossfader des Mischpultes rhythmisch ein- und ausgeblendet werden, um diese zu neuen Melodien zusammenzufügen.', 'Posen ist eine polnische Stadt. Unter posen versteht man auch, sich in Szene zu stellen und eine bestimmte Haltung einzunehmen.', 'Unter drillen versteht man ein hartes Training das sich durch viel Wiederholung auszeichnet.', 'Patchen bedeutet eigentlich ausbessern. In der Informatik bedeutet patchen einen Patch einspielen, ein Programm einspielen, das einen Softwarefehler behebt.'),
(2, 1, 1, 'Was kann man nicht essen?', 'Dortmunder', 'Berliner', 'Krakauer', 'Hamburger', 'Ein Dortmunder ist ein Bewohner der neuntgrössten Stadt Deutschlands genannt Dortmund.', 'Ein Berliner Pfannkuchen (kurz: Berliner) besteht aus süßem Hefeteig mit einer Füllung aus Konfitüre und wird meist mit feinem Zucker bestäubt oder mit einer Glasur überzogen.', 'Als Krakauer bezeichnet man diverse Wurstsorten in Mitteleuropa.', 'Ein Burger (Kurzform) ist ein Sandwich aus einem Brötchen und einer gegrillten Scheibe Rinderhackfleisch dazwischen.'),
(3, 2, 1, 'Die Altersvorsorge in der Schweiz baut auf drei Säulen auf. Die erste Säule ist die …? ', 'staatliche Vorsorge', 'berufliche Vorsorge', 'private Vorsorge', 'geerbte Vorsorge', 'Das Schweizer Vorsorgesystem besteht aus 3 Säulen.  Die staatliche Vorsorge ist das Fundament, die 1. Säule und wird kurz AHV genannt und ist obligatorisch für alle die ein AHV-pflichtiges Einkommen erzielen. Sie besteht aus der AHV, der Alters- und Hinterlassenenversicherung, und der IV, der Invalidenversicherung. Mit der 1. Säule sorgt der Staat für Ihre Existenzgrundlage im Alter, bei Invalidität und im Todesfall für Ihre Hinterbliebenen. Gegebenenfalls erhalten Sie in der 1. Säule auch Ergänzungsleistungen (EL) oder Erwerbsersatz (EO) für den Militärdienst sowie für die Mutterschaft.', 'Die 2. Säule (berufliche Vorsorge) ist Teil der privaten Vorsorge und bildet zusammen mit der 1. Säule und der Säule 3a und 3b das Drei-Säulen-Prinzip des Schweizer Vorsorgesystems. Die Berufliche Vorsorge BVG ist der zweite Grundpfeiler der sozialen Sicherheit in der Schweiz. Zusammen mit der 1. Säule sollen die gesetzlichen Pensionskassenrenten rund 60 bis 70 Prozent des zuletzt bezogenen Lohnes abdecken.', 'Die Säule 3a ist Teil der privaten Vorsorge und bildet zusammen mit der Säule 3b die dritte Säule des Schweizer Vorsorgesystems. Die 3. Säule ist freiwillig, deckt aber die Vorsorgelücken. Die Säule 3a ist eine an feste Bedingungen (wie jährliche  Maximaleinzahlung) gebundene Vorsorge. Mit der Säule 3b, der freien Vorsorge ist man deutlich flexibler.   Mit der Säule 3a verbessern Sie Ihre finanzielle Lage im Alter, profitieren von Zinsen, können sich mit einer Versicherungslösung absichern lassen, verkleinern die Vorsorgelücke und sparen gleichzeitig Steuern.', 'Ein Erbe ist immer schön, gehört aber nicht zum Vorsorgemodell der drei Säulen.'),
(4, 2, 1, 'Wobei handelt es sich nicht um eine Programmiersprache?', 'Linux', 'TypeSkript', 'Java', 'Python', 'Richtig. Linux ist ein kostenloses, frei zugängliches Mehrbenutzer Betriebssystem das von Linux Torvald 1991 entwickelt wurde. Der Quellcode ist frei zugänglich und jeder kann an der Weiterentwicklung mitarbeiten. Das Maskottchen und unverwechselbares Erkennungszeichen von Linux ist Tux, ein kleiner Pinguin.', 'TypeSkript ist eine von Microsoft 2012 entwickelte Programmiersprache striktere Variante von JavaSkript. Jede Variable wird mit einem Typ versehen. Die Typisierung ist vor allem hilfreich, wenn Sie mit mehreren Leuten an einem Projekt arbeitet oder alten Code anpassen müssen.', 'Java erschien in der ersten Version 1995 und ist zusammen mit C eine der berühmtesten Programmiersprachen weltweit. Die Sprache Java gehört zur Gruppe der objektorientierten Programmiersprachen. Das heißt, die geschriebenen Programme werden in Klassen und Objekten strukturiert.', 'Python genießt einen Ruf als einfache und saubere Programmiersprache mit klarer Struktur. Ihr Programmcode ist intuitiv nutzbar und gleichzeitig leicht lesbar. Sie wurde 1991 von Guido van Rossum entwickelt.'),
(5, 3, 1, 'Wie heißt eine Textdatei, in der Informationen über den Besuch und über die\r\nNutzung einer Website gespeichert werden?', 'Cookie', 'Junk', 'Signatur', 'Spam', 'Richtig! Ein Cookie ist eine Textinformation, die im Browser auf dem Endgerät des Betrachters jeweils zu einer besuchten Website gespeichert werden kann.', 'Junk ist englisch und steht für \"Abfall\" , \"Plunder\".  Junk-E-Mails sind unerwünschte dem Empfänger unverlangt zugestellte Nachrichten, die ihn oft belästigen und häufig werbenden Inhalt enthalten.', 'Als Signatur wird ein Textabschnitt bezeichnet, der häufig am Ende von E-Mails, Usenet-Postings oder Beiträgen in Internetforen steht und Angaben zum Absender enthält.', 'Als Spam ​werden unerwünschte, in der Regel auf elektronischem Weg übertragene massenhafte Nachrichten (Informationen) bezeichnet, die dem Empfänger unverlangt zugestellt werden, ihn oft belästigen und auch häufig werbenden Inhalt enthalten. Dieser Vorgang wird Spamming oder spammen genannt, der Verursacher Spammer. '),
(6, 3, 1, 'Welche Dateinamenerweiterung ist typisch für eine ausführbare Datei?', '.exe', '.wav', '.mp3', '.ppsx', '.exe ist eine Dateinamenserweiterung für ausführbare Dateien unter den Betriebsystemen DOS, Windows, OS/2, OpenVMS und Symbian.', '.wav ist ein Audiodateiformatstandard, der von IBM und Microsoft entwickelt wurde, um einen Audio-Bitstream auf PCs zu speichern.', '.mp3 ist ein Verfahren zur verlustbehafteten Kompression digital gespeicherter Audiodateien.', '.ppsx ist eine Dateinamenserweiterung eines PowerPoint Dokuments, das im Open XML Format erstellt wurde. Eine ppsx Datei ist eigentlich ein Archiv, in dem einzelne Dokument-Elemente, wie etwa Text oder Grafiken, gesondert voneinander gespeichert werden. '),
(7, 4, 1, 'Was wärmt ein Muff?', 'Hände', 'Hals', 'Ohren', 'Füsse', 'Richtig! ist ein röhrenförmiges Bekleidungsaccessoire, in das die Hände von beiden Seiten hineingesteckt werden, um sie warm zu halten. Meist ist er zusätzlich warm ausgefüttert. Er hat entweder eine Schlaufe, um ihn in der Hand halten zu können, oder eine lange Kordel, mit der er um den Hals getragen werden kann. Meist ist ein kleines Geldtäschchen eingearbeitet. Heute ist ein Muff aus der Mode gekommen.', 'Den Hals wärmt man mit einem Halstuch oder Schal.', 'Die Ohren hält man mit Mütze, Kappe, Stirnband, Ohrenwärmer, gefütterten Kopfhören warm. ', 'Füsse gehören in Socken und gefütterte Schuhe um warm zu haben. Ebenso eignet sich Bewegung, um die Durchblutung zu verbessern.'),
(8, 4, 1, 'Was ist das leichteste aller Metalle?\r\n', 'Lithium', 'Aluminium', 'Quecksilber\r\n', 'Titan', 'Richtig! Lithium ist ein Leichtmetall und besitzt die geringste Dichte der unter Standardbedingungen festen Elemente. \r\nDie Dichte beträgt: 0,534 g/cm³ ', 'Aluminium ist ein silbrig-weißes Leichtmetall. In der Erdhülle ist es, nach Sauerstoff und Silicium, das dritthäufigste Element und in der Erdkruste das häufigste Metall.\r\nDie Dichte beträgt: 2,6989 g/cm³', 'Es ist das einzige Metall und neben Brom das einzige Element, das bei Standardbedingungen flüssig ist. Aufgrund seiner hohen Oberflächenspannung und seiner starken Kohäsion bildet es linsenförmige Tropfen. Es ist wie jedes andere Metall elektrisch leitfähig. \r\nDie Dichte beträgt: 13,5459 g/cm³', 'Das Metall ist weiß-metallisch glänzend, hat eine geringe Dichte, ist dehnbar, korrosions- und temperaturbeständig.\r\nDie Dichte beträgt: 4,50 g/cm³'),
(9, 5, 1, 'Der Name welchen Steines bedeutet übersetzt \"nicht trunken\"?', 'Amethyst', 'Saphir', 'Bernstein', 'Opal', 'Richtig! Der Amethyst ist eine Besonderheit in violett. Der Name dieses Edelsteins stammt vom griechischen Wort „amethyein“, was „nicht betrunken“ bedeutet und auf die entgiftende Wirkung des Amethysts anspielt, die angeblich Trunkenheit verhindern sollte. Der Amethyst symbolisiert schöpferisches Denken und Weisheit. ', 'Der Name dieses Edelsteins leitet sich aus dem griechischen „sappheiros“ für „blau“ ab. Saphir kann wegen seiner enormen Härte bis auf Diamanten alle anderen Materialien einritzen.', 'Seinen Namen hat der Bernstein vom mittelhochdeutschen Wort bernen. Es lässt sich mit brennen übersetzen und bezeichnet eine besonders auffällige Eigenschaft dieses Steins: er ist im Gegensatz zu anderen Steinen brennbar.\r\nBernstein ist ein Heilstein, der aus versteinertem fossilem Harz besteht.', 'Der Name des Opals stammt wahrscheinlich aus dem aus dem altindischen Sanskrit wo er „upala“ für „Edelstein“ genannt wurde.\r\nOpal gilt bei der Meditation als stärkster Stein für die Seele.'),
(10, 5, 1, 'In welchem Jahr wurde Rätoromanisch als offizielle Landessprache der Schweiz anerkannt?', '1938', '1945', '1948', '1952', 'richtig! Das Rätoromanische ist seit 1938 neben Deutsch, Französisch und Italienisch eine in der Verfassung verankerte Landessprache der Schweiz.', 'Früher! Das Rätoromanische ist seit 1938 neben Deutsch, Französisch und Italienisch eine in der Verfassung verankerte Landessprache der Schweiz.', 'Früher! Das Rätoromanische ist seit 1938 neben Deutsch, Französisch und Italienisch eine in der Verfassung verankerte Landessprache der Schweiz.', 'Früher! Das Rätoromanische ist seit 1938 neben Deutsch, Französisch und Italienisch eine in der Verfassung verankerte Landessprache der Schweiz.'),
(11, 6, 1, 'In welcher Einheit gibt man die Lichtstärke an?', 'Candela', 'Lux', 'Lumen', 'Nox', 'Richtig! Die Candela bezeichnet die Lichtstärke. Eine gewöhnliche Haushaltskerze hat eine Lichtstärke von etwa 1 cd.', 'Lux ist die Einheit für die Beleuchtungsstärke. 1 Lux ist die Beleuchtungsstärke in 1 Meter Entfernung von einer punktförmigen Lichtquelle der Lichtstärke 1 Candela (1 cd).', 'Lumen ist die Einheit des Lichtstroms. Es gibt also an, wie viel Licht (fachsprachlich: welche Lichtmenge) eine Lichtquelle pro Zeiteinheit insgesamt abgibt.', 'Nox ist eine veraltete und seit dem 1. Januar 1978 ungesetzliche Einheit der Dunkelbeleuchtungsstärke für Leuchtdichten, bei denen die Stäbchen der Netzhaut teilweise bei der Vermittlung des Lichteindrucks mitwirken.\r\nDie gesetzliche Einheit der Beleuchtungsstärke ist heute das Lux.'),
(12, 6, 1, 'Was bezeichnen die Biologen als Bryophyten?', 'Moose', 'Quallen', 'Pilze', 'Amöben', 'Richtig! Es gibt vorwiegend in feuchten Gebieten etwa 24000 verschiedene Bryophyten (Moose). Es sind mit Chlorophyll ausgestattete, autotrophe Pflanzen ohne echte Wurzeln.', 'Als Qualle, im wissenschaftlichen Sprachgebrauch auch Meduse oder Medusa bezeichnet sind Nesseltiere.', 'Pilze sind eukaryotische Lebewesen. Dies bedeutet, dass ihre Zellen, beispielsweise im Gegensatz zu denen von Bakterien, einen Zellkern besitzen. Pilze können im Gegensatz zu Pflanzen keine Photosynthese betreiben. Dafür verfügen sie über Mitochondrien.', 'Amöben sind Einzeller, die keine feste Zellwand besitzen und dadurch ihre Form verändern können. Sie zählen zu den Protozoen (Urtierchen) und hier zur Gruppe der Rhizopoda (Wurzelfüsser).');

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
(1, 'Allgemein');

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
-- AUTO_INCREMENT für Tabelle `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
