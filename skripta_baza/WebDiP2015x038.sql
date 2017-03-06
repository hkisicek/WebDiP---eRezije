-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u7
-- http://www.phpmyadmin.net
--
-- Računalo: localhost
-- Vrijeme generiranja: Velj 24, 2017 u 09:00 PM
-- Verzija poslužitelja: 5.5.54
-- PHP verzija: 5.4.45-0+deb7u7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza podataka: `WebDiP2015x038`
--

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `Dnevnik`
--

CREATE TABLE IF NOT EXISTS `Dnevnik` (
  `ID_dnevnik` int(11) NOT NULL AUTO_INCREMENT,
  `Skripta` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Upit` longtext COLLATE utf8_unicode_ci,
  `Vrijeme` datetime NOT NULL,
  `FK_korisnik` int(11) DEFAULT NULL,
  `FK_vrsta` int(11) NOT NULL,
  PRIMARY KEY (`ID_dnevnik`),
  KEY `FK_vrsta` (`FK_vrsta`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1311 ;

--
-- Izbacivanje podataka za tablicu `Dnevnik`
--

INSERT INTO `Dnevnik` (`ID_dnevnik`, `Skripta`, `Upit`, `Vrijeme`, `FK_korisnik`, `FK_vrsta`) VALUES
(624, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 21:58:29', 0, 2),
(625, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 21:58:35', NULL, 2),
(626, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 21:58:37', 0, 2),
(627, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 21:58:38', NULL, 2),
(628, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 21:58:40', 0, 2),
(629, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 21:58:41', NULL, 2),
(630, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 21:58:42', 0, 2),
(631, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 21:58:43', NULL, 2),
(632, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 21:58:46', 0, 2),
(633, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 21:59:10', 0, 2),
(634, 'prijava.php', NULL, '2016-06-15 21:59:39', 12, 1),
(635, 'nova_rezervacija.php', 'INSERT INTO Rezervacija;', '2016-06-15 21:59:42', 12, 2),
(636, 'pregled_racuna.php', 'SELECT * FROM Racun;', '2016-06-15 21:59:45', 12, 2),
(637, 'nova_zalba.php', 'INSERT INTO Zalba;', '2016-06-15 21:59:57', 12, 2),
(638, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 21:59:59', 12, 2),
(639, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:00:00', NULL, 2),
(640, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:00:02', 12, 2),
(641, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:00:03', NULL, 2),
(642, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:00:04', 12, 2),
(643, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:00:06', NULL, 2),
(644, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:00:08', 12, 2),
(645, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:00:09', NULL, 2),
(646, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:00:09', 12, 2),
(647, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:00:09', 12, 2),
(648, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:00:09', 12, 2),
(649, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:00:09', 12, 2),
(650, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:00:10', 12, 2),
(651, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:00:12', 12, 2),
(652, 'prijava.php', NULL, '2016-06-15 22:00:22', 7, 1),
(653, 'nova_kategorija.php', 'INSERT INTO Kategorija_ocitavanja;', '2016-06-15 22:00:33', 7, 2),
(654, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:00:33', NULL, 2),
(655, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:00:33', 7, 2),
(656, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:00:33', 7, 2),
(657, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:00:33', 7, 2),
(658, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:00:33', 7, 2),
(659, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:00:33', 7, 2),
(660, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-15 22:00:52', 7, 3),
(661, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-15 22:00:53', 7, 3),
(662, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:00:53', 7, 2),
(663, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-15 22:00:58', 7, 3),
(664, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:00:58', 7, 2),
(665, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-15 22:01:00', 7, 3),
(666, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:01:00', 7, 2),
(667, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:01:05', 7, 2),
(668, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:01:06', 7, 2),
(669, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:07', NULL, 2),
(670, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:07', 7, 2),
(671, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:07', 7, 2),
(672, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:07', 7, 2),
(673, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:07', 7, 2),
(674, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:07', 7, 2),
(675, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-15 22:01:11', 7, 3),
(676, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:11', NULL, 2),
(677, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:11', 7, 2),
(678, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:11', 7, 2),
(679, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:11', 7, 2),
(680, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:11', 7, 2),
(681, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:11', 7, 2),
(682, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-15 22:01:14', 7, 3),
(683, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:14', NULL, 2),
(684, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:14', 7, 2),
(685, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:14', 7, 2),
(686, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:14', 7, 2),
(687, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:14', 7, 2),
(688, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:14', 7, 2),
(689, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-15 22:01:16', 7, 3),
(690, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:01:16', 7, 2),
(691, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:25', NULL, 2),
(692, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:25', 7, 2),
(693, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:25', 7, 2),
(694, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:25', 7, 2),
(695, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:25', 7, 2),
(696, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:25', 7, 2),
(697, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-15 22:01:38', 7, 3),
(698, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:38', NULL, 2),
(699, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:38', 7, 2),
(700, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:38', 7, 2),
(701, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:38', 7, 2),
(702, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:38', 7, 2),
(703, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 22:01:38', 7, 2),
(704, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-15 22:01:43', 7, 2),
(705, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-15 22:01:44', 7, 2),
(706, 'akcija_korisnik.php', 'SELECT * FROM Rezervacija;', '2016-06-15 22:01:47', 7, 2),
(707, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-15 22:01:47', 7, 2),
(708, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-15 22:01:49', 7, 2),
(709, 'akcija_zalba.php', 'UPDATE Zalba SET Status=1;', '2016-06-15 22:01:52', 7, 3),
(710, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-15 22:01:57', 7, 2),
(711, 'statistikaU.php', 'SELECT * FROM Lajkovi;', '2016-06-15 22:02:03', 7, 3),
(712, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-15 22:02:15', 7, 2),
(713, 'nova_rezervacija.php', 'INSERT INTO Rezervacija;', '2016-06-15 22:02:20', 7, 2),
(714, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-15 22:02:22', 7, 2),
(715, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-15 22:02:29', 7, 2),
(716, 'novi_racun.php', 'INSERT INTO Racun;', '2016-06-15 22:02:35', 7, 2),
(717, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-15 22:02:36', 7, 2),
(718, 'statistikaU.php', 'SELECT * FROM Lajkovi;', '2016-06-15 22:02:38', 7, 3),
(719, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-15 22:02:42', 7, 2),
(720, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-15 22:02:43', 7, 2),
(721, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-15 22:02:44', 7, 2),
(722, 'prijava.php', NULL, '2016-06-15 22:03:21', 10, 1),
(723, 'pregled_adresa.php', 'SELECT * FROM Poslovnica;', '2016-06-15 22:03:26', NULL, 2),
(724, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-15 22:03:27', 10, 2),
(725, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-15 22:03:33', 10, 2),
(726, 'novi_racun.php', 'INSERT INTO Racun;', '2016-06-15 22:03:38', 10, 2),
(727, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-15 22:03:38', 10, 2),
(728, 'pregled_racuna.php', 'SELECT * FROM Racun;', '2016-06-15 22:03:42', 10, 2),
(729, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-15 22:03:45', 10, 2),
(730, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-15 22:03:48', 10, 2),
(731, 'pregled_korisnika.php', 'SELECT * FROM Korisnik;', '2016-06-15 22:03:50', 10, 2),
(732, 'akcija_korisnik.php', 'UPDATE Korisnik SET Status=3;', '2016-06-15 22:03:51', 12, 2),
(733, 'pregled_korisnika.php', 'SELECT * FROM Korisnik;', '2016-06-15 22:03:51', 10, 2),
(734, 'akcija_korisnik.php', 'UPDATE Korisnik SET Status=1;', '2016-06-15 22:03:54', 12, 2),
(735, 'pregled_korisnika.php', 'SELECT * FROM Korisnik;', '2016-06-15 22:03:54', 10, 2),
(736, 'statistikaS.php', 'SELECT * FROM Lajkovi;', '2016-06-15 22:03:55', 10, 3),
(737, 'dnevnik.php', 'SELECT * FROM Dnevnik;', '0000-00-00 00:00:00', 10, 2),
(738, 'dnevnik.php', 'SELECT * FROM Dnevnik;', '2016-06-15 22:04:40', 10, 2),
(739, 'dnevnik.php', 'SELECT * FROM Dnevnik;', '2016-06-15 22:04:57', 10, 2),
(740, 'dnevnik.php', 'SELECT * FROM Dnevnik;', '2016-06-15 22:05:34', 10, 2),
(741, 'prijava.php', NULL, '2016-06-15 22:14:26', 7, 1),
(742, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-15 22:14:31', 7, 2),
(743, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-15 22:14:33', 7, 2),
(744, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-15 22:14:34', 7, 2),
(745, 'statistikaU.php', 'SELECT * FROM Lajkovi;', '2016-06-15 22:14:35', 7, 3),
(746, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-15 22:14:39', 7, 2),
(747, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-15 22:14:41', 7, 2),
(748, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-15 22:14:43', 7, 2),
(749, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-15 22:14:45', 7, 2),
(750, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-15 22:15:04', 7, 2),
(751, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-15 22:15:05', 7, 2),
(752, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-15 22:15:06', 7, 2),
(753, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-15 22:15:07', 7, 2),
(754, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-15 22:15:08', 7, 2),
(755, 'statistikaU.php', 'SELECT * FROM Lajkovi;', '2016-06-15 22:15:10', 7, 3),
(756, 'statistikaK.php', 'SELECT * FROM Lajkovi;', '2016-06-15 22:15:12', 7, 3),
(757, 'statistikaU.php', 'SELECT * FROM Lajkovi;', '2016-06-15 22:15:15', 7, 3),
(758, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-15 22:15:23', 7, 2),
(759, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-15 22:15:24', 7, 2),
(760, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-15 22:15:25', 7, 2),
(761, 'prijava.php', NULL, '2016-06-15 22:15:39', 10, 1),
(762, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:15:41', 10, 2),
(763, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:16:15', 10, 2),
(764, 'prijava.php', NULL, '2016-06-15 22:16:21', 7, 1),
(765, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-15 22:16:53', 7, 2),
(766, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-15 22:16:54', 7, 2),
(767, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-15 22:16:56', 7, 2),
(768, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-15 22:17:06', 7, 2),
(769, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:30:33', 0, 2),
(770, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:37:53', 0, 2),
(771, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:37:58', 0, 2),
(772, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:39:00', 0, 2),
(773, 'aktivacija.php', 'UPDATE Korisnik SET Status;', '2016-06-15 22:43:48', NULL, 3),
(774, 'aktivacija.php', 'UPDATE Korisnik SET Status;', '2016-06-15 22:46:14', NULL, 3),
(775, 'prijava.php', NULL, '2016-06-15 22:46:28', 18, 1),
(776, 'aktivacija.php', 'UPDATE Korisnik SET Status;', '2016-06-15 22:47:41', NULL, 3),
(777, 'aktivacija.php', 'UPDATE Korisnik SET Status;', '2016-06-15 22:47:51', NULL, 3),
(778, 'aktivacija.php', 'UPDATE Korisnik SET Status;', '2016-06-15 22:49:47', NULL, 3),
(779, 'aktivacija.php', 'UPDATE Korisnik SET Status;', '2016-06-15 22:50:14', NULL, 3),
(780, 'prijava.php', NULL, '2016-06-15 22:51:34', 17, 1),
(781, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:51:35', 17, 2),
(782, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:51:37', 17, 2),
(783, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:51:38', 17, 2),
(784, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:52:18', 0, 2),
(785, 'prijava.php', NULL, '2016-06-15 22:52:25', 18, 1),
(786, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:53:58', 0, 2),
(787, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:54:00', 0, 2),
(788, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:54:08', 0, 2),
(789, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:54:23', 0, 2),
(790, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:54:41', 0, 2),
(791, 'prijava.php', NULL, '2016-06-15 22:57:34', 17, 1),
(792, 'prijava.php', NULL, '2016-06-15 22:57:41', 17, 1),
(793, 'prijava.php', NULL, '2016-06-15 22:57:51', 17, 1),
(794, 'aktivacija.php', 'UPDATE Korisnik SET Status;', '2016-06-15 22:58:02', NULL, 3),
(795, 'prijava.php', NULL, '2016-06-15 22:58:25', 19, 1),
(796, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 22:58:50', 0, 2),
(797, 'prijava.php', NULL, '2016-06-15 23:01:11', 19, 1),
(798, 'prijava.php', NULL, '2016-06-15 23:04:20', 17, 1),
(799, 'pregled_racuna.php', 'SELECT * FROM Racun;', '2016-06-15 23:04:29', 17, 2),
(800, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 23:04:33', 17, 2),
(801, 'prijava.php', NULL, '2016-06-15 23:05:16', 17, 1),
(802, 'pregled_racuna.php', 'SELECT * FROM Racun;', '2016-06-15 23:12:38', 19, 2),
(803, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 23:12:40', 19, 2),
(804, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 23:24:14', 0, 2),
(805, 'prijava.php', NULL, '2016-06-15 23:24:26', 17, 1),
(806, 'nova_ustanova.php', 'INSERT INTO Ustanova;', '2016-06-15 23:24:39', 17, 2),
(807, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 23:24:39', 17, 2),
(808, 'nova_ustanova.php', 'INSERT INTO Ustanova;', '2016-06-15 23:24:57', 17, 2),
(809, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 23:24:57', 17, 2),
(810, 'nova_ustanova.php', 'INSERT INTO Ustanova;', '2016-06-15 23:26:05', 17, 2),
(811, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 23:26:05', 17, 2),
(812, 'nova_ustanova.php', 'INSERT INTO Ustanova;', '2016-06-15 23:31:55', 17, 2),
(813, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 23:31:56', 17, 2),
(814, 'nova_adresa.php', 'UPDATE Korisnik SET Status;', '2016-06-15 23:32:21', 17, 3),
(815, 'pregled_adresa.php', 'SELECT * FROM Poslovnica;', '2016-06-15 23:32:21', NULL, 2),
(816, 'nova_adresa.php', 'UPDATE Korisnik SET Status;', '2016-06-15 23:32:44', 17, 3),
(817, 'pregled_adresa.php', 'SELECT * FROM Poslovnica;', '2016-06-15 23:32:45', NULL, 2),
(818, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 23:32:51', 17, 2),
(819, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 23:32:53', NULL, 2),
(820, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 23:32:55', 17, 2),
(821, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 23:32:57', NULL, 2),
(822, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 23:32:59', 17, 2),
(823, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 23:33:00', NULL, 2),
(824, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 23:33:01', 17, 2),
(825, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 23:33:04', NULL, 2),
(826, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 23:33:06', 17, 2),
(827, 'pregled_adresa.php', 'SELECT * FROM Poslovnica;', '2016-06-15 23:33:07', NULL, 2),
(828, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 23:33:21', 17, 2),
(829, 'nova_ustanova.php', 'INSERT INTO Ustanova;', '2016-06-15 23:34:05', 17, 2),
(830, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 23:34:06', 17, 2),
(831, 'nova_adresa.php', 'UPDATE Korisnik SET Status;', '2016-06-15 23:34:27', 17, 3),
(832, 'pregled_adresa.php', 'SELECT * FROM Poslovnica;', '2016-06-15 23:34:27', NULL, 2),
(833, 'pregled_adresa.php', 'SELECT * FROM Poslovnica;', '2016-06-15 23:34:34', NULL, 2),
(834, 'pregled_adresa.php', 'SELECT * FROM Poslovnica;', '2016-06-15 23:34:36', NULL, 2),
(835, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 23:34:37', 17, 2),
(836, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-15 23:34:39', 17, 2),
(837, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-15 23:34:41', 17, 2),
(838, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-15 23:34:42', 17, 2),
(839, 'pregled_racuna.php', 'SELECT * FROM Racun;', '2016-06-15 23:34:43', 17, 2),
(840, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 23:34:49', 17, 2),
(841, 'pregled_adresa.php', 'SELECT * FROM Poslovnica;', '2016-06-15 23:34:52', NULL, 2),
(842, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-15 23:34:55', 17, 2),
(843, 'prijava.php', NULL, '2016-06-15 23:35:51', 21, 1),
(844, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 23:40:44', 0, 2),
(845, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 23:40:49', 0, 2),
(846, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 23:40:51', NULL, 2),
(847, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-15 23:40:54', 0, 2),
(848, 'prijava.php', NULL, '2016-06-15 23:41:07', 20, 1),
(849, 'nova_kategorija.php', 'INSERT INTO Kategorija_ocitavanja;', '2016-06-15 23:41:32', 20, 2),
(850, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 23:41:32', NULL, 2),
(851, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 23:41:32', 20, 2),
(852, 'nova_kategorija.php', 'INSERT INTO Kategorija_ocitavanja;', '2016-06-15 23:42:34', 20, 2),
(853, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 23:42:35', NULL, 2),
(854, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-15 23:42:35', 20, 2),
(855, 'statistikaS.php', 'SELECT * FROM Lajkovi;', '2016-06-16 00:17:37', 19, 3),
(856, 'statistikaU.php', 'SELECT * FROM Lajkovi;', '2016-06-16 00:17:40', 19, 3),
(857, 'prijava.php', NULL, '2016-06-16 00:20:06', 17, 1),
(858, 'prijava.php', NULL, '2016-06-16 00:20:21', 20, 1),
(859, 'nova_kategorija.php', 'INSERT INTO Kategorija_ocitavanja;', '2016-06-16 00:20:39', 20, 2),
(860, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 00:20:39', NULL, 2),
(861, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 00:20:39', 20, 2),
(862, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 00:20:39', 20, 2),
(863, 'prijava.php', NULL, '2016-06-16 00:21:25', 22, 1),
(864, 'nova_kategorija.php', 'INSERT INTO Kategorija_ocitavanja;', '2016-06-16 00:22:01', 22, 2),
(865, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 00:22:01', NULL, 2),
(866, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 00:22:01', 22, 2),
(867, 'nova_kategorija.php', 'INSERT INTO Kategorija_ocitavanja;', '2016-06-16 00:22:23', 22, 2),
(868, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 00:22:23', NULL, 2),
(869, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 00:22:23', 22, 2),
(870, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 00:22:23', 22, 2),
(871, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 00:22:29', 22, 2),
(872, 'statistikaU.php', 'SELECT * FROM Lajkovi;', '2016-06-16 00:24:02', 22, 3),
(873, 'statistikaK.php', 'SELECT * FROM Lajkovi;', '2016-06-16 00:24:06', 22, 3),
(874, 'statistikaU.php', 'SELECT * FROM Lajkovi;', '2016-06-16 00:24:07', 22, 3),
(875, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-16 00:24:09', 22, 2),
(876, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 00:24:10', 22, 2),
(877, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 00:24:12', 22, 2),
(878, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 00:24:13', 22, 2),
(879, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 00:54:08', 0, 2),
(880, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 00:54:36', NULL, 2),
(881, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 00:54:38', 0, 2),
(882, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 00:54:39', NULL, 2),
(883, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 00:54:42', 0, 2),
(884, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 00:54:44', NULL, 2),
(885, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 00:54:45', 0, 2),
(886, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 01:15:23', 0, 2),
(887, 'prijava.php', NULL, '2016-06-16 01:16:34', 17, 1),
(888, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 01:16:50', 17, 2),
(889, 'pregled_adresa.php', 'SELECT * FROM Poslovnica;', '2016-06-16 01:16:52', NULL, 2),
(890, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 01:16:55', 17, 2),
(891, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 01:16:57', 17, 2),
(892, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 01:17:00', 17, 2),
(893, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 01:17:01', 17, 2),
(894, 'pregled_racuna.php', 'SELECT * FROM Racun;', '2016-06-16 01:17:04', 17, 2),
(895, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-16 01:17:08', 17, 2),
(896, 'pregled_korisnika.php', 'SELECT * FROM Korisnik;', '2016-06-16 01:17:10', 17, 2),
(897, 'statistikaS.php', 'SELECT * FROM Lajkovi;', '2016-06-16 01:17:35', 17, 3),
(898, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-16 01:17:38', 17, 2),
(899, 'pregled_racuna.php', 'SELECT * FROM Racun;', '2016-06-16 01:17:40', 17, 2),
(900, 'pregled_korisnika.php', 'SELECT * FROM Korisnik;', '2016-06-16 01:17:45', 17, 2),
(901, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 01:17:47', 17, 2),
(902, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 01:17:48', 17, 2),
(903, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 01:28:39', 0, 2),
(904, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 01:28:44', 0, 2),
(905, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 01:28:47', NULL, 2),
(906, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 01:28:48', 0, 2),
(907, 'prijava.php', NULL, '2016-06-16 01:28:59', 20, 1),
(908, 'nova_kategorija.php', 'INSERT INTO Kategorija_ocitavanja;', '2016-06-16 01:30:31', 20, 2),
(909, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 01:30:31', NULL, 2),
(910, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 01:30:31', 20, 2),
(911, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 01:30:31', 20, 2),
(912, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 01:30:44', 0, 2),
(913, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 01:30:49', 0, 2),
(914, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 01:30:52', NULL, 2),
(915, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 01:32:39', 0, 2),
(916, 'prijava.php', NULL, '2016-06-16 01:32:55', 17, 1),
(917, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 01:33:00', 17, 2),
(918, 'pregled_adresa.php', 'SELECT * FROM Poslovnica;', '2016-06-16 01:33:02', NULL, 2),
(919, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 01:33:03', 17, 2),
(920, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 01:33:05', 17, 2),
(921, 'pregled_racuna.php', 'SELECT * FROM Racun;', '2016-06-16 01:33:06', 17, 2),
(922, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-16 01:33:08', 17, 2),
(923, 'pregled_korisnika.php', 'SELECT * FROM Korisnik;', '2016-06-16 01:33:10', 17, 2),
(924, 'statistikaS.php', 'SELECT * FROM Lajkovi;', '2016-06-16 01:33:12', 17, 3),
(925, 'dnevnik.php', 'SELECT * FROM Dnevnik;', '2016-06-16 01:33:17', 17, 2),
(926, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 08:12:47', 0, 2),
(927, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 08:12:53', NULL, 2),
(928, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:10:11', 0, 2),
(929, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 09:10:18', NULL, 2),
(930, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:10:20', 0, 2),
(931, 'prijava.php', NULL, '2016-06-16 09:10:46', 17, 1),
(932, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:10:49', 17, 2),
(933, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:11:56', 17, 2),
(934, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:12:22', 17, 2),
(935, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:12:52', 0, 2),
(936, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:12:59', 0, 2),
(937, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:13:18', 0, 2),
(938, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:15:23', 0, 2),
(939, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:15:45', 0, 2),
(940, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:15:54', 0, 2),
(941, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:16:26', 0, 2),
(942, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:16:33', 0, 2),
(943, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:16:36', 0, 2),
(944, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 09:16:36', NULL, 2),
(945, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:16:39', 0, 2),
(946, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 09:16:40', NULL, 2),
(947, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:16:43', 0, 2),
(948, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:16:51', 0, 2),
(949, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:17:49', 0, 2),
(950, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:52:25', 0, 2),
(951, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 09:52:29', NULL, 2),
(952, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:52:31', 0, 2),
(953, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 09:52:32', NULL, 2),
(954, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:52:33', 0, 2),
(955, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:52:36', 0, 2),
(956, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 09:52:45', 0, 2),
(957, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:03:42', 0, 2),
(958, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:03:46', 0, 2),
(959, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:08:12', 0, 2),
(960, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:11:17', 0, 2),
(961, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:12:36', 0, 2),
(962, 'prijava.php', NULL, '2016-06-16 12:13:02', 17, 1),
(963, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:13:06', 17, 2),
(964, 'pregled_adresa.php', 'SELECT * FROM Poslovnica;', '2016-06-16 12:13:19', NULL, 2),
(965, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 12:13:26', 17, 2),
(966, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:14:06', 0, 2),
(967, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:14:18', 0, 2),
(968, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:15:34', 0, 2),
(969, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:16:06', 0, 2),
(970, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:16:31', 0, 2),
(971, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:17:16', 0, 2),
(972, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:17:51', 0, 2),
(973, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:17:59', 0, 2),
(974, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:17:59', 0, 2),
(975, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 12:18:00', NULL, 2),
(976, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:18:01', 0, 2),
(977, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 12:18:04', NULL, 2),
(978, 'prijava.php', NULL, '2016-06-16 12:18:21', 17, 1),
(979, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:18:24', 17, 2),
(980, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:18:33', 0, 2),
(981, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:18:58', 0, 2),
(982, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:19:04', 0, 2),
(983, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:19:33', 0, 2),
(984, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:19:41', 0, 2),
(985, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:20:21', 0, 2),
(986, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:20:23', 0, 2),
(987, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 12:20:25', NULL, 2),
(988, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:20:27', 0, 2),
(989, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:20:38', 0, 2),
(990, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:21:02', 0, 2),
(991, 'prijava.php', NULL, '2016-06-16 12:23:57', 21, 1),
(992, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:23:57', 0, 2),
(993, 'nova_rezervacija.php', 'INSERT INTO Rezervacija;', '2016-06-16 12:24:18', 21, 2),
(994, 'nova_rezervacija.php', 'INSERT INTO Rezervacija;', '2016-06-16 12:24:23', 21, 2),
(995, 'nova_rezervacija.php', 'INSERT INTO Rezervacija;', '2016-06-16 12:24:27', 21, 2),
(996, 'nova_rezervacija.php', 'INSERT INTO Rezervacija;', '2016-06-16 12:24:31', 21, 2),
(997, 'nova_rezervacija.php', 'INSERT INTO Rezervacija;', '2016-06-16 12:24:34', 21, 2),
(998, 'nova_rezervacija.php', 'INSERT INTO Rezervacija;', '2016-06-16 12:24:39', 21, 2),
(999, 'pregled_racuna.php', 'SELECT * FROM Racun;', '2016-06-16 12:24:42', 21, 2),
(1000, 'prijava.php', NULL, '2016-06-16 12:24:54', 20, 1),
(1001, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 12:24:57', 20, 2),
(1002, 'akcija_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 12:25:02', 20, 3),
(1003, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 12:25:02', 20, 2),
(1004, 'akcija_korisnik.php', 'SELECT * FROM Rezervacija;', '2016-06-16 12:25:04', 20, 2),
(1005, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 12:25:04', 20, 2),
(1006, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 12:25:09', 20, 2),
(1007, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 12:25:18', 20, 2),
(1008, 'novi_racun.php', 'INSERT INTO Racun;', '2016-06-16 12:25:23', 20, 2),
(1009, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 12:25:23', 20, 2),
(1010, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:25:24', 0, 2),
(1011, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:27:13', 0, 2),
(1012, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:27:18', 0, 2),
(1013, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:27:28', 0, 2),
(1014, 'prijava.php', NULL, '2016-06-16 12:27:34', 17, 1),
(1015, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:27:39', 17, 2),
(1016, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:28:13', 17, 2),
(1017, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:28:27', 0, 2),
(1018, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:28:41', 0, 2),
(1019, 'prijava.php', NULL, '2016-06-16 12:28:41', 21, 1),
(1020, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:28:43', 21, 2),
(1021, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 12:28:44', 21, 3),
(1022, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:28:44', 21, 2),
(1023, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 12:28:46', 21, 3),
(1024, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:28:46', 21, 2),
(1025, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 12:28:46', 21, 3),
(1026, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:28:46', 21, 2),
(1027, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 12:28:48', 21, 3),
(1028, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:28:48', 21, 2),
(1029, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 12:28:50', 21, 3),
(1030, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:28:50', 21, 2),
(1031, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 12:28:52', 21, 3),
(1032, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:28:52', 21, 2),
(1033, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 12:28:53', 21, 3),
(1034, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:28:53', 21, 2),
(1035, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 12:28:58', 21, 3),
(1036, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 12:29:00', 21, 3),
(1037, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:29:00', 21, 2),
(1038, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:29:01', 0, 2),
(1039, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 12:29:03', 21, 3),
(1040, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:29:03', 21, 2),
(1041, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 12:29:04', 21, 3),
(1042, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:29:04', 21, 2),
(1043, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 12:29:06', 21, 3),
(1044, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:29:06', 21, 2),
(1045, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 12:29:08', 21, 3),
(1046, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:29:08', 21, 2),
(1047, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 12:29:09', 21, 3),
(1048, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:29:09', 21, 2),
(1049, 'prijava.php', NULL, '2016-06-16 12:29:56', 27, 1),
(1050, 'nova_rezervacija.php', 'INSERT INTO Rezervacija;', '2016-06-16 12:30:02', 27, 2),
(1051, 'nova_rezervacija.php', 'INSERT INTO Rezervacija;', '2016-06-16 12:30:06', 27, 2),
(1052, 'nova_rezervacija.php', 'INSERT INTO Rezervacija;', '2016-06-16 12:30:09', 27, 2),
(1053, 'nova_rezervacija.php', 'INSERT INTO Rezervacija;', '2016-06-16 12:30:13', 27, 2),
(1054, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:30:18', 0, 2),
(1055, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:30:30', 0, 2),
(1056, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:31:01', 27, 2),
(1057, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:31:04', 0, 2),
(1058, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:31:07', 0, 2),
(1059, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:31:18', 0, 2),
(1060, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:31:34', 0, 2),
(1061, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:31:45', 0, 2),
(1062, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:31:58', 0, 2),
(1063, 'prijava.php', NULL, '2016-06-16 12:32:11', 19, 1),
(1064, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-16 12:32:16', 19, 2),
(1065, 'prijava.php', NULL, '2016-06-16 12:32:32', 17, 1),
(1066, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:32:36', 17, 2),
(1067, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:32:55', 17, 2),
(1068, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:33:10', 17, 2),
(1069, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:33:27', 0, 2),
(1070, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:39:26', 17, 2),
(1071, 'pregled_adresa.php', 'SELECT * FROM Poslovnica;', '2016-06-16 12:39:28', NULL, 2),
(1072, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 12:39:30', 17, 2),
(1073, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 12:39:31', 17, 2),
(1074, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 12:39:33', 17, 2),
(1075, 'pregled_racuna.php', 'SELECT * FROM Racun;', '2016-06-16 12:39:36', 17, 2),
(1076, 'pregled_racuna.php', 'SELECT * FROM Racun;', '2016-06-16 12:39:40', 17, 2),
(1077, 'statistikaS.php', 'SELECT * FROM Lajkovi;', '2016-06-16 12:39:44', 17, 3),
(1078, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:40:04', 0, 2),
(1079, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:40:12', 0, 2),
(1080, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:40:30', 0, 2),
(1081, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:44:07', 0, 2),
(1082, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:44:09', 0, 2),
(1083, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:44:17', 0, 2),
(1084, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:48:53', 0, 2),
(1085, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 12:49:02', NULL, 2),
(1086, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:49:06', 0, 2),
(1087, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:49:14', 0, 2),
(1088, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:49:19', 0, 2),
(1089, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 12:49:21', NULL, 2),
(1090, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 12:49:23', 0, 2),
(1091, 'prijava.php', NULL, '2016-06-16 12:50:07', 20, 1),
(1092, 'statistikaU.php', 'SELECT * FROM Lajkovi;', '2016-06-16 12:50:09', 20, 3),
(1093, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 12:50:43', 20, 2),
(1094, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 12:50:48', 20, 2),
(1095, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 12:50:54', 20, 2),
(1096, 'akcija_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 12:50:56', 20, 3),
(1097, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 12:50:56', 20, 2),
(1098, 'akcija_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 12:50:56', 20, 3),
(1099, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 12:50:56', 20, 2),
(1100, 'akcija_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 12:50:57', 20, 3),
(1101, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 12:50:57', 20, 2),
(1102, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 12:50:59', 20, 2),
(1103, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 12:51:07', 20, 2),
(1104, 'novi_racun.php', 'INSERT INTO Racun;', '2016-06-16 12:51:13', 20, 2),
(1105, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 12:51:13', 20, 2),
(1106, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 12:51:23', 20, 2),
(1107, 'novi_racun.php', 'INSERT INTO Racun;', '2016-06-16 12:51:28', 20, 2),
(1108, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 12:51:28', 20, 2),
(1109, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 12:51:33', 20, 2),
(1110, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 12:51:36', 20, 2),
(1111, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-16 12:51:39', 20, 2),
(1112, 'statistikaU.php', 'SELECT * FROM Lajkovi;', '2016-06-16 12:51:41', 20, 3),
(1113, 'statistikaK.php', 'SELECT * FROM Lajkovi;', '2016-06-16 12:51:44', 20, 3),
(1114, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 13:19:27', 0, 2),
(1115, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 13:19:35', NULL, 2),
(1116, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 13:19:40', 0, 2),
(1117, 'aktivacija.php', 'UPDATE Korisnik SET Status;', '2016-06-16 13:21:26', NULL, 3),
(1118, 'prijava.php', NULL, '2016-06-16 13:21:38', 32, 1),
(1119, 'prijava.php', NULL, '2016-06-16 13:21:47', 32, 1),
(1120, 'prijava.php', NULL, '2016-06-16 13:22:55', 32, 1),
(1121, 'nova_rezervacija.php', 'INSERT INTO Rezervacija;', '2016-06-16 13:23:00', 32, 2),
(1122, 'pregled_racuna.php', 'SELECT * FROM Racun;', '2016-06-16 13:23:02', 32, 2),
(1123, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 13:23:07', 32, 2),
(1124, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 13:23:10', 32, 3),
(1125, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 13:23:10', 32, 2),
(1126, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 13:23:12', 32, 3),
(1127, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 13:23:12', 32, 2),
(1128, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 13:23:13', 32, 3),
(1129, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 13:23:13', 32, 2),
(1130, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 13:23:17', 32, 3),
(1131, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 13:23:17', 32, 2),
(1132, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 13:23:21', NULL, 2),
(1133, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 13:23:21', 32, 2),
(1134, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 13:23:21', 32, 2),
(1135, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 13:23:22', 32, 3),
(1136, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 13:23:22', NULL, 2),
(1137, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 13:23:22', 32, 2),
(1138, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 13:23:22', 32, 2),
(1139, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 13:23:23', 32, 3),
(1140, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 13:23:24', NULL, 2),
(1141, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 13:23:24', 32, 2),
(1142, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 13:23:24', 32, 2),
(1143, 'prijava.php', NULL, '2016-06-16 13:26:57', 20, 1),
(1144, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 13:27:00', 20, 2),
(1145, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 13:27:03', 20, 2),
(1146, 'akcija_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 13:27:05', 20, 3),
(1147, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 13:27:05', 20, 2),
(1148, 'akcija_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 13:27:05', 20, 3),
(1149, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 13:27:05', 20, 2),
(1150, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 13:27:07', 20, 2),
(1151, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 13:27:15', 20, 2),
(1152, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 13:27:18', 20, 2),
(1153, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 13:27:25', 20, 2),
(1154, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 13:27:36', 20, 2),
(1155, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 13:27:38', 20, 2),
(1156, 'nova_kategorija.php', 'INSERT INTO Kategorija_ocitavanja;', '2016-06-16 13:27:57', 20, 2),
(1157, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 13:27:57', NULL, 2),
(1158, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 13:27:57', 20, 2),
(1159, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 13:27:57', 20, 2),
(1160, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 13:27:57', 20, 2),
(1161, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-16 13:28:09', 20, 2),
(1162, 'prijava.php', NULL, '2016-06-16 13:29:05', 21, 1),
(1163, 'pregled_racuna.php', 'SELECT * FROM Racun;', '2016-06-16 13:29:07', 21, 2),
(1164, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 13:30:56', 0, 2),
(1165, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 13:30:58', NULL, 2),
(1166, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 13:31:03', 0, 2),
(1167, 'prijava.php', NULL, '2016-06-16 13:33:40', 17, 1),
(1168, 'statistikaS.php', 'SELECT * FROM Lajkovi;', '2016-06-16 13:33:52', 17, 3),
(1169, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 13:34:03', 17, 2),
(1170, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 13:34:06', 17, 2),
(1171, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 13:34:13', 17, 2),
(1172, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 13:34:16', 17, 2),
(1173, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 13:34:22', 17, 2),
(1174, 'prijava.php', NULL, '2016-06-16 13:47:51', 17, 1),
(1175, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 13:47:58', 17, 2),
(1176, 'pregled_adresa.php', 'SELECT * FROM Poslovnica;', '2016-06-16 13:48:06', NULL, 2),
(1177, 'statistikaS.php', 'SELECT * FROM Lajkovi;', '2016-06-16 13:48:13', 17, 3),
(1178, 'statistikaK.php', 'SELECT * FROM Lajkovi;', '2016-06-16 13:48:17', 17, 3),
(1179, 'statistikaS.php', 'SELECT * FROM Lajkovi;', '2016-06-16 13:48:22', 17, 3),
(1180, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-16 13:48:49', 17, 2),
(1181, 'statistikaS.php', 'SELECT * FROM Lajkovi;', '2016-06-16 13:49:02', 17, 3),
(1182, 'dnevnik.php', 'SELECT * FROM Dnevnik;', '2016-06-16 13:49:15', 17, 2),
(1183, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 14:02:52', 0, 2),
(1184, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 14:03:36', 0, 2),
(1185, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 14:42:28', 0, 2),
(1186, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 15:01:14', 0, 2),
(1187, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 15:01:19', NULL, 2),
(1188, 'prijava.php', NULL, '2016-06-16 15:05:07', 17, 1),
(1189, 'aktivacija.php', 'UPDATE Korisnik SET Status;', '2016-06-16 15:05:49', NULL, 3),
(1190, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 15:05:59', 0, 2),
(1191, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 15:06:06', 0, 2),
(1192, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 15:06:12', 0, 2),
(1193, 'prijava.php', NULL, '2016-06-16 15:07:47', 17, 1),
(1194, 'pregled_korisnika.php', 'SELECT * FROM Korisnik;', '2016-06-16 15:07:48', 17, 2),
(1195, 'akcija_korisnik.php', 'UPDATE Korisnik SET Status=1;', '2016-06-16 15:07:58', 33, 2),
(1196, 'pregled_korisnika.php', 'SELECT * FROM Korisnik;', '2016-06-16 15:07:58', 17, 2),
(1197, 'prijava.php', NULL, '2016-06-16 15:08:25', 33, 1),
(1198, 'prijava.php', NULL, '2016-06-16 15:09:23', 33, 1),
(1199, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 15:09:57', 33, 2),
(1200, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 15:10:01', 33, 3),
(1201, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 15:10:01', 33, 2),
(1202, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 15:10:03', 33, 3),
(1203, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 15:10:03', 33, 2),
(1204, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 15:10:05', NULL, 2),
(1205, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 15:10:05', 33, 2),
(1206, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 15:10:05', 33, 2),
(1207, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 15:10:05', 33, 2),
(1208, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 15:10:07', 33, 3),
(1209, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 15:10:07', NULL, 2),
(1210, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 15:10:07', 33, 2),
(1211, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 15:10:07', 33, 2),
(1212, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 15:10:07', 33, 2),
(1213, 'lajkovi.php', 'INSERT INTO Lajkovi;', '2016-06-16 15:10:09', 33, 3),
(1214, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 15:10:09', 33, 2),
(1215, 'prijava.php', NULL, '2016-06-16 15:11:00', 20, 1),
(1216, 'prijava.php', NULL, '2016-06-16 15:11:20', 21, 1),
(1217, 'nova_zalba.php', 'INSERT INTO Zalba;', '2016-06-16 15:11:35', 21, 2),
(1218, 'prijava.php', NULL, '2016-06-16 15:11:49', 20, 1),
(1219, 'prijava.php', NULL, '2016-06-16 15:12:46', 21, 1),
(1220, 'nova_zalba.php', 'INSERT INTO Zalba;', '2016-06-16 15:12:57', 21, 2),
(1221, 'prijava.php', NULL, '2016-06-16 15:13:07', 20, 1),
(1222, 'prijava.php', NULL, '2016-06-16 15:13:41', 21, 1),
(1223, 'nova_rezervacija.php', 'INSERT INTO Rezervacija;', '2016-06-16 15:13:52', 21, 2),
(1224, 'nova_rezervacija.php', 'INSERT INTO Rezervacija;', '2016-06-16 15:14:04', 21, 2),
(1225, 'prijava.php', NULL, '2016-06-16 15:14:12', 20, 1);
INSERT INTO `Dnevnik` (`ID_dnevnik`, `Skripta`, `Upit`, `Vrijeme`, `FK_korisnik`, `FK_vrsta`) VALUES
(1226, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 15:14:14', 20, 2),
(1227, 'akcija_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 15:14:26', 20, 3),
(1228, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 15:14:27', 20, 2),
(1229, 'akcija_korisnik.php', 'SELECT * FROM Rezervacija;', '2016-06-16 15:14:29', 20, 2),
(1230, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 15:14:29', 20, 2),
(1231, 'prijava.php', NULL, '2016-06-16 15:15:03', 21, 1),
(1232, 'prijava.php', NULL, '2016-06-16 15:16:29', 33, 1),
(1233, 'nova_rezervacija.php', 'INSERT INTO Rezervacija;', '2016-06-16 15:16:41', 33, 2),
(1234, 'prijava.php', NULL, '2016-06-16 15:16:58', 20, 1),
(1235, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 15:17:01', 20, 2),
(1236, 'akcija_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 15:17:10', 20, 3),
(1237, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 15:17:10', 20, 2),
(1238, 'akcija_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 15:17:13', 20, 3),
(1239, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 15:17:13', 20, 2),
(1240, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 15:17:55', 20, 2),
(1241, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 15:18:06', 20, 2),
(1242, 'novi_racun.php', 'INSERT INTO Racun;', '2016-06-16 15:18:53', 20, 2),
(1243, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 15:18:54', 20, 2),
(1244, 'pregled_racuna.php', 'SELECT * FROM Racun;', '2016-06-16 15:19:05', 20, 2),
(1245, 'pregled_racuna.php', 'SELECT * FROM Racun;', '2016-06-16 15:19:20', 20, 2),
(1246, 'prijava.php', NULL, '2016-06-16 15:19:33', 21, 1),
(1247, 'pregled_racuna.php', 'SELECT * FROM Racun;', '2016-06-16 15:19:36', 21, 2),
(1248, 'prijava.php', NULL, '2016-06-16 15:21:22', 33, 1),
(1249, 'pregled_racuna.php', 'SELECT * FROM Racun;', '2016-06-16 15:21:25', 33, 2),
(1250, 'prijava.php', NULL, '2016-06-16 15:22:07', 17, 1),
(1251, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 19:22:35', 33, 2),
(1252, 'prijava.php', NULL, '2016-06-16 19:22:48', 20, 1),
(1253, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 19:22:51', 20, 2),
(1254, 'nova_rezervacija.php', 'INSERT INTO Rezervacija;', '2016-06-16 19:23:06', 20, 2),
(1255, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 19:23:10', 20, 2),
(1256, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 19:23:19', 20, 2),
(1257, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 19:23:32', 20, 2),
(1258, 'prijava.php', NULL, '2016-06-16 19:24:15', 33, 1),
(1259, 'nova_rezervacija.php', 'INSERT INTO Rezervacija;', '2016-06-16 19:24:21', 33, 2),
(1260, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 19:24:30', 33, 2),
(1261, 'prijava.php', NULL, '2016-06-16 19:24:43', 20, 1),
(1262, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 19:24:46', 20, 2),
(1263, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 19:24:46', 20, 2),
(1264, 'akcija_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 19:25:47', 20, 3),
(1265, 'pregled_rezervacija.php', 'SELECT * FROM Rezervacija;', '2016-06-16 19:25:47', 20, 2),
(1266, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 19:26:02', 20, 2),
(1267, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 19:26:17', 20, 2),
(1268, 'novi_racun.php', 'INSERT INTO Racun;', '2016-06-16 19:26:23', 20, 2),
(1269, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 19:26:23', 20, 2),
(1270, 'pregled_racuna.php', 'SELECT * FROM Racun;', '2016-06-16 19:26:27', 20, 2),
(1271, 'prijava.php', NULL, '2016-06-16 19:27:09', 33, 1),
(1272, 'pregled_racuna.php', 'SELECT * FROM Racun;', '2016-06-16 19:27:10', 33, 2),
(1273, 'nova_zalba.php', 'INSERT INTO Zalba;', '2016-06-16 19:27:48', 33, 2),
(1274, 'nova_zalba.php', 'INSERT INTO Zalba;', '2016-06-16 19:28:08', 33, 2),
(1275, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-16 19:28:23', 20, 2),
(1276, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-16 19:28:38', 20, 2),
(1277, 'akcija_zalba.php', 'UPDATE Zalba SET Status=1;', '2016-06-16 19:28:48', 20, 3),
(1278, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-16 19:28:48', 20, 2),
(1279, 'akcija_zalba.php', 'UPDATE Zalba SET Status=1;', '2016-06-16 19:28:49', 20, 3),
(1280, 'pregled_ocitanja.php', 'SELECT * FROM Ocitano_stanje;', '2016-06-16 19:29:07', 20, 2),
(1281, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-16 19:29:12', 20, 2),
(1282, 'nova_kategorija.php', 'INSERT INTO Kategorija_ocitavanja;', '2016-06-16 19:30:16', 20, 2),
(1283, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 19:30:16', NULL, 2),
(1284, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 19:30:16', 20, 2),
(1285, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 19:30:16', 20, 2),
(1286, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 19:30:16', 20, 2),
(1287, 'statistikaU.php', 'SELECT * FROM Lajkovi;', '2016-06-16 19:30:52', 20, 3),
(1288, 'popis_zalbi.php', 'SELECT * FROM Zalba;', '2016-06-16 19:32:15', 20, 2),
(1289, 'prijava.php', NULL, '2016-06-16 19:32:42', 17, 1),
(1290, 'dnevnik.php', 'SELECT * FROM Dnevnik;', '2016-06-16 19:32:45', 17, 2),
(1291, 'dnevnik.php', 'SELECT * FROM Dnevnik;', '2016-06-16 19:32:45', 17, 2),
(1292, 'statistikaS.php', 'SELECT * FROM Lajkovi;', '2016-06-16 19:33:15', 17, 3),
(1293, 'dnevnik.php', 'SELECT * FROM Dnevnik;', '2016-06-16 19:35:04', 33, 2),
(1294, 'prijava.php', NULL, '2016-06-16 19:35:37', 17, 1),
(1295, 'nova_ustanova.php', 'INSERT INTO Ustanova;', '2016-06-16 19:35:55', 17, 2),
(1296, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 19:35:55', 17, 2),
(1297, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 19:36:00', NULL, 2),
(1298, 'nova_adresa.php', 'UPDATE Korisnik SET Status;', '2016-06-16 19:36:18', 17, 3),
(1299, 'pregled_adresa.php', 'SELECT * FROM Poslovnica;', '2016-06-16 19:36:18', NULL, 2),
(1300, 'upload_csvA.php', 'INSERT INTO Poslovnica;', '2016-06-16 19:38:52', 17, 3),
(1301, 'pregled_adresa.php', 'SELECT * FROM Poslovnica;', '2016-06-16 19:38:55', NULL, 2),
(1302, 'statistikaS.php', 'SELECT * FROM Lajkovi;', '2016-06-16 19:39:06', 17, 3),
(1303, 'statistikA.php', 'SELECT * FROM Lajkovi;', '2016-06-16 19:39:11', 17, 3),
(1304, 'prijava.php', NULL, '2016-06-16 21:08:18', 33, 1),
(1305, 'pregled_racuna.php', 'SELECT * FROM Racun;', '2016-06-16 21:08:22', 33, 2),
(1306, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 21:08:33', 33, 2),
(1307, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 21:08:57', NULL, 2),
(1308, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 21:09:01', 33, 2),
(1309, 'popis_kategorija.php', 'SELECT * FROM Kategorija;', '2016-06-16 21:09:02', NULL, 2),
(1310, 'popis_ustanova.php', 'SELECT * FROM Ustanova;', '2016-06-16 21:09:04', 33, 2);

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `Kategorija_ocitavanja`
--

CREATE TABLE IF NOT EXISTS `Kategorija_ocitavanja` (
  `ID_kategorija` int(11) NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Cijena` decimal(10,2) NOT NULL,
  `Jedinica` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Datum` date NOT NULL,
  `Opis` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Status` int(11) NOT NULL,
  `FK_moderator` int(11) NOT NULL,
  `FK_ustanova` int(11) NOT NULL,
  PRIMARY KEY (`ID_kategorija`),
  KEY `fk_Kategorija_ocitavanja_Korisnik1_idx` (`FK_moderator`),
  KEY `fk_Kategorija_ocitavanja_Ustanova1_idx` (`FK_ustanova`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Izbacivanje podataka za tablicu `Kategorija_ocitavanja`
--

INSERT INTO `Kategorija_ocitavanja` (`ID_kategorija`, `Naziv`, `Cijena`, `Jedinica`, `Datum`, `Opis`, `Status`, `FK_moderator`, `FK_ustanova`) VALUES
(10, 'dnevna', 5.57, 'kn/kWh', '2016-06-17', 'klasicna ', 0, 20, 27),
(11, 'dnevna', 0.51, 'kn/m3', '2016-06-17', 'nova', 0, 20, 31),
(12, 'dnevna', 2.66, 'kn/kWh', '2016-06-04', 'nova', 0, 20, 31),
(13, 'dnevna', 2.33, 'kn/kWh', '2016-06-12', 'nema', 0, 22, 30),
(14, 'vikend', 3.55, 'kn/m3', '2016-06-17', 'nema', 0, 22, 30),
(15, 'dnevna', 0.56, 'kn/kWh', '2016-06-24', 'nema', 0, 20, 27),
(16, 'dnevna', 6.55, 'kn/kWh', '2016-06-24', 'nema', 0, 20, 27),
(17, 'dnevna', 5.55, 'kn/m3', '2012-02-20', 'hkj', 0, 20, 31);

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `Korisnik`
--

CREATE TABLE IF NOT EXISTS `Korisnik` (
  `ID_korisnik` int(11) NOT NULL AUTO_INCREMENT,
  `Ime` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Prezime` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Korisnicko_ime` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Lozinka` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Ulica` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Grad` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Telefon` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Vrijeme` datetime NOT NULL,
  `Kod` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Neuspjelo` int(11) NOT NULL,
  `FK_tip` int(11) NOT NULL,
  PRIMARY KEY (`ID_korisnik`),
  KEY `fk_Korisnik_Tip_korisnika1_idx` (`FK_tip`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=34 ;

--
-- Izbacivanje podataka za tablicu `Korisnik`
--

INSERT INTO `Korisnik` (`ID_korisnik`, `Ime`, `Prezime`, `Email`, `Korisnicko_ime`, `Lozinka`, `Ulica`, `Grad`, `Telefon`, `Vrijeme`, `Kod`, `Status`, `Neuspjelo`, `FK_tip`) VALUES
(17, 'helena', 'kisicek', 'kisicek@foi.hr', 'helena', '123456', 'jerovec 220', 'ivanec', '042781691', '2016-06-15 22:40:58', 'a6c4cff2ca8dbcc3c0e9433806a006d8c3506875', 1, 1, 3),
(18, 'mojeime', 'prezime', 'mojmejl@mailinator.com', 'nekoime', 'lozinka', 'moja ulica', 'grad', '232523525', '2016-06-15 22:45:13', 'db064c42c552a7968571df8c8621df7a6fb92f2e', 1, 0, 1),
(19, 'nikola', 'sinjori', 'nikola.sinjori@gmail.com', 'nsinjori', 'lozinka', 'Orehovec 42', 'Novi Marof', '0917988975', '2016-06-15 22:57:46', '209bae27d8712fc92121ea803afbab0625bb14a3', 1, 1, 2),
(20, 'danijel', 'kisicek', 'dkisicek@foi.hr', 'dkisicek', '123456', 'jerovec 220', 'ivanec', '042781691', '2016-06-15 23:22:53', 'b45d9a04e840f29e20726c8e90014f12afbe9840', 1, 0, 2),
(21, 'ljiljana', 'kisicek', 'ljkisicek@foi.hr', 'ljikisicek', '123456', 'jerovec 220', 'ivanec', '042781691', '2016-06-15 00:00:00', '564564564665', 1, 0, 1),
(22, 'stjepan', 'kisicek', 'skisicek@foi.hr', 'skisicek', '123456', 'jerovec 220', 'ivanec', '042781691', '2016-06-15 00:00:00', '54654564', 1, 0, 2),
(23, 'agata', 'rudnicki', 'agatarud@foi.hr', 'arudnicki', '123456', 'jerovec 221', 'ivanec', '042781691', '2016-06-16 08:16:08', '654564', 1, 0, 2),
(24, 'josip', 'rudnicki', 'jrudnicki@foi.hr', 'jrudnicki', '123456', 'jerovec 221', 'ivanec', '042781691', '2016-06-29 08:25:22', '5456465', 1, 0, 2),
(25, 'stefica', 'kisicek', 'skisicek1@foi.hr', 'skisicek1', '123456', 'zarovnica 225', 'lepoglava', '042782666', '2016-06-15 00:00:00', '54654', 1, 0, 2),
(26, 'snjezana', 'varovic', 'svarovic@foi.hr', 'svarovic', '123456', 'strossmayerova 3', 'lepoglava', '042755888', '2016-06-08 00:00:00', '65456456', 1, 0, 2),
(27, 'vlado', 'kisicek', 'vkisicek@foi.hr', 'vkisicek', '123456', 'josipa juraja 50', 'zagreb', '0989888916', '2016-06-14 00:00:00', '465456', 1, 0, 1),
(28, 'nero', 'kisicek', 'nkisicek@foi.hr', 'nkisicek', '123456', 'jerovec 222', 'ivanec', '042781691', '2016-06-16 00:00:00', '5645465', 1, 0, 2),
(29, 'mima', 'kisicek', 'mkisicek@foi.hr', 'mkisicek', '123456', 'jerovec 220', 'ivanec', '042781691', '2016-06-15 00:00:00', '64564', 1, 0, 2),
(30, 'dragutin', 'vresk', 'dvres45465k@gmail.com', 'dvresk', '123456', 'jerovec 167', 'ivanec', '042777888', '2016-06-08 00:00:00', '12132', 1, 0, 2),
(31, 'andrija', 'kisicek', 'akisicek@foi.hr', 'akisicek', '123456', 'zarovnica 225', 'lepoglava', '042777888', '2016-06-14 00:00:00', '54564', 1, 0, 2),
(32, 'helena', 'kisicek', 'kelena@foi.hr', 'hana', 'ni3m5gagzt', 'jerovec 220', 'ivanec', '042781691', '2016-06-16 13:21:14', 'e6523d9f01e0af684f2f44571139d98855587e61', 1, 0, 1),
(33, 'hkisicek', 'kisicek', 'hkisicek@foi.hr', 'hkisicek', '6engswgsub', 'jerovec', 'ivanec', '042781691', '2016-06-16 15:03:53', 'bac64d9109780a4bb5efd5b116d8f852a2233a3b', 1, 7, 1);

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `Lajkovi`
--

CREATE TABLE IF NOT EXISTS `Lajkovi` (
  `ID_lajkovi` int(11) NOT NULL AUTO_INCREMENT,
  `Ustanova` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Kategorija_ocitavanja` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Vrijeme` datetime NOT NULL,
  `Like` int(11) DEFAULT NULL,
  `Dislike` int(11) DEFAULT NULL,
  `FK_korisnik` int(11) NOT NULL,
  PRIMARY KEY (`ID_lajkovi`),
  KEY `fk_Lajkovi_Korisnik1_idx` (`FK_korisnik`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=77 ;

--
-- Izbacivanje podataka za tablicu `Lajkovi`
--

INSERT INTO `Lajkovi` (`ID_lajkovi`, `Ustanova`, `Kategorija_ocitavanja`, `Vrijeme`, `Like`, `Dislike`, `FK_korisnik`) VALUES
(53, 'Elektrana Jerovec', NULL, '2016-06-16 12:28:44', 1, 0, 21),
(54, 'Elektrana Orehovec', NULL, '2016-06-16 12:28:46', 1, 0, 21),
(55, 'Elektro Zapresic', NULL, '2016-06-16 12:28:46', 1, 0, 21),
(56, 'Novokom', NULL, '2016-06-16 12:28:48', 0, 1, 21),
(57, 'Varkom', NULL, '2016-06-16 12:28:50', 0, 1, 21),
(58, 'Elektrana Orehovec', NULL, '2016-06-16 12:28:52', 0, 1, 21),
(59, 'Varkom', NULL, '2016-06-16 12:28:53', 0, 1, 21),
(60, 'Vodovod Koprivnica', NULL, '2016-06-16 12:28:58', 1, 0, 21),
(61, 'Vodovod Orehovec', NULL, '2016-06-16 12:29:00', 0, 1, 21),
(62, 'Plinara Jerovec', NULL, '2016-06-16 12:29:03', 1, 0, 21),
(63, 'Ivkom', NULL, '2016-06-16 12:29:04', 1, 0, 21),
(64, 'Vodovod Slunj', NULL, '2016-06-16 12:29:06', 0, 1, 21),
(65, 'Elektrana Orehovec', NULL, '2016-06-16 12:29:08', 1, 0, 21),
(66, 'Vodovod Koprivnica', NULL, '2016-06-16 12:29:09', 1, 0, 21),
(67, 'Elektrana Jerovec', NULL, '2016-06-16 13:23:10', 1, 0, 32),
(68, 'Ivkom', NULL, '2016-06-16 13:23:12', 0, 1, 32),
(69, 'Varkom', NULL, '2016-06-16 13:23:13', 1, 0, 32),
(70, 'Ivkom', NULL, '2016-06-16 13:23:17', 0, 1, 32),
(71, NULL, 'dnevna', '2016-06-16 13:23:22', 1, 0, 32),
(72, NULL, 'dnevna', '2016-06-16 13:23:23', 1, 0, 32),
(73, 'Elektrana Jerovec', NULL, '2016-06-16 15:10:01', 1, 0, 33),
(74, 'Plinara Dubrovnik', NULL, '2016-06-16 15:10:03', 1, 0, 33),
(75, NULL, 'dnevna', '2016-06-16 15:10:07', 1, 0, 33),
(76, 'dnevna', NULL, '2016-06-16 15:10:09', 0, 1, 33);

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `Moderator_ustanova`
--

CREATE TABLE IF NOT EXISTS `Moderator_ustanova` (
  `FK_moderator` int(11) NOT NULL,
  `FK_ustanova` int(11) NOT NULL,
  PRIMARY KEY (`FK_moderator`,`FK_ustanova`),
  KEY `fk_Korisnik_has_Ustanova_Ustanova1_idx` (`FK_ustanova`),
  KEY `fk_Korisnik_has_Ustanova_Korisnik_idx` (`FK_moderator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Izbacivanje podataka za tablicu `Moderator_ustanova`
--

INSERT INTO `Moderator_ustanova` (`FK_moderator`, `FK_ustanova`) VALUES
(17, 27),
(18, 27),
(20, 27),
(19, 28),
(19, 29),
(21, 29),
(28, 29),
(22, 30),
(26, 30),
(20, 31),
(22, 31),
(24, 31),
(29, 31),
(19, 38),
(26, 39),
(31, 40),
(23, 42);

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `Ocitano_stanje`
--

CREATE TABLE IF NOT EXISTS `Ocitano_stanje` (
  `ID_stanje` int(11) NOT NULL AUTO_INCREMENT,
  `Stanje` decimal(10,2) NOT NULL,
  `Status` int(11) NOT NULL,
  `FK_rezervacija` int(11) NOT NULL,
  PRIMARY KEY (`ID_stanje`),
  KEY `FK_rezervacija` (`FK_rezervacija`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Izbacivanje podataka za tablicu `Ocitano_stanje`
--

INSERT INTO `Ocitano_stanje` (`ID_stanje`, `Stanje`, `Status`, `FK_rezervacija`) VALUES
(12, 55.50, 1, 30),
(13, 555.22, 1, 31),
(14, 666.60, 1, 34),
(15, 33.55, 0, 32),
(16, 66.88, 0, 38),
(17, 55.44, 1, 43),
(18, 55.52, 1, 45),
(19, 12.22, 0, 40);

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `Pomak`
--

CREATE TABLE IF NOT EXISTS `Pomak` (
  `pomak` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Izbacivanje podataka za tablicu `Pomak`
--

INSERT INTO `Pomak` (`pomak`) VALUES
(4);

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `Poslovnica`
--

CREATE TABLE IF NOT EXISTS `Poslovnica` (
  `ID_poslovnica` int(11) NOT NULL AUTO_INCREMENT,
  `Drzava` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Grad` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Ulica` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Broj` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `FK_ustanova` int(11) NOT NULL,
  PRIMARY KEY (`ID_poslovnica`),
  KEY `fk_Poslovnica_Ustanova1_idx` (`FK_ustanova`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Izbacivanje podataka za tablicu `Poslovnica`
--

INSERT INTO `Poslovnica` (`ID_poslovnica`, `Drzava`, `Grad`, `Ulica`, `Broj`, `FK_ustanova`) VALUES
(13, 'Hrvatska', 'Ivanec', 'Rajterova', '10', 27),
(14, 'Hrvatska', 'Ivanec', 'Nazorova', '15', 29),
(15, 'Hrvatska', 'Dubrovnik', 'Dumanciceva ', '5', 31),
(16, 'hrvastka', 'osijek', 'rajterova', '10', 30),
(17, 'hrvatska', 'slavonski brod', 'strossmayerova', '22', 38),
(18, 'hrvatska', 'ivanec', 'jerovec ', '220', 42),
(20, 'hrvatska', 'osijek', 'rajterova', '5', 31),
(21, 'hrvatska', 'zagreb', 'ilica', '20', 29);

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `Prijava`
--

CREATE TABLE IF NOT EXISTS `Prijava` (
  `ID_prijava` int(11) NOT NULL AUTO_INCREMENT,
  `Vrijeme` datetime DEFAULT NULL,
  `FK_korisnik` int(11) NOT NULL,
  PRIMARY KEY (`ID_prijava`),
  KEY `fk_Prijava_Korisnik1_idx` (`FK_korisnik`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=211 ;

--
-- Izbacivanje podataka za tablicu `Prijava`
--

INSERT INTO `Prijava` (`ID_prijava`, `Vrijeme`, `FK_korisnik`) VALUES
(150, '2016-06-15 22:46:28', 18),
(151, '2016-06-15 22:51:34', 17),
(152, '2016-06-15 22:52:25', 18),
(153, '2016-06-15 22:57:34', 17),
(154, '2016-06-15 22:57:41', 17),
(155, '2016-06-15 22:57:51', 17),
(156, '2016-06-15 22:58:25', 19),
(157, '2016-06-15 23:01:11', 19),
(158, '2016-06-15 23:04:20', 17),
(159, '2016-06-15 23:05:16', 17),
(160, '2016-06-15 23:24:26', 17),
(161, '2016-06-15 23:35:51', 21),
(162, '2016-06-15 23:41:07', 20),
(163, '2016-06-16 00:20:06', 17),
(164, '2016-06-16 00:20:21', 20),
(165, '2016-06-16 00:21:25', 22),
(166, '2016-06-16 01:16:34', 17),
(167, '2016-06-16 01:28:59', 20),
(168, '2016-06-16 01:32:55', 17),
(169, '2016-06-16 09:10:46', 17),
(170, '2016-06-16 12:13:02', 17),
(171, '2016-06-16 12:18:21', 17),
(172, '2016-06-16 12:23:57', 21),
(173, '2016-06-16 12:24:54', 20),
(174, '2016-06-16 12:27:34', 17),
(175, '2016-06-16 12:28:41', 21),
(176, '2016-06-16 12:29:56', 27),
(177, '2016-06-16 12:32:11', 19),
(178, '2016-06-16 12:32:32', 17),
(179, '2016-06-16 12:50:07', 20),
(180, '2016-06-16 13:21:38', 32),
(181, '2016-06-16 13:21:47', 32),
(182, '2016-06-16 13:22:55', 32),
(183, '2016-06-16 13:26:57', 20),
(184, '2016-06-16 13:29:05', 21),
(185, '2016-06-16 13:33:40', 17),
(186, '2016-06-16 13:47:51', 17),
(187, '2016-06-16 15:05:07', 17),
(188, '2016-06-16 15:07:47', 17),
(189, '2016-06-16 15:08:25', 33),
(190, '2016-06-16 15:09:23', 33),
(191, '2016-06-16 15:11:00', 20),
(192, '2016-06-16 15:11:20', 21),
(193, '2016-06-16 15:11:49', 20),
(194, '2016-06-16 15:12:46', 21),
(195, '2016-06-16 15:13:07', 20),
(196, '2016-06-16 15:13:41', 21),
(197, '2016-06-16 15:14:12', 20),
(198, '2016-06-16 15:15:03', 21),
(199, '2016-06-16 15:16:29', 33),
(200, '2016-06-16 15:16:58', 20),
(201, '2016-06-16 15:19:33', 21),
(202, '2016-06-16 15:21:22', 33),
(203, '2016-06-16 15:22:07', 17),
(204, '2016-06-16 19:22:48', 20),
(205, '2016-06-16 19:24:15', 33),
(206, '2016-06-16 19:24:43', 20),
(207, '2016-06-16 19:27:09', 33),
(208, '2016-06-16 19:32:42', 17),
(209, '2016-06-16 19:35:37', 17),
(210, '2016-06-16 21:08:18', 33);

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `Racun`
--

CREATE TABLE IF NOT EXISTS `Racun` (
  `ID_racun` int(11) NOT NULL AUTO_INCREMENT,
  `Usluga` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Stanje` int(11) NOT NULL,
  `Potrosnja` int(11) NOT NULL,
  `Cijena` int(11) NOT NULL,
  `Vrijeme` datetime DEFAULT NULL,
  `Status` int(11) NOT NULL,
  `FK_rezervacija` int(11) NOT NULL,
  `FK_moderator` int(11) NOT NULL,
  `FK_korisnik` int(11) NOT NULL,
  PRIMARY KEY (`ID_racun`),
  KEY `fk_Racun_Rezervacija1_idx` (`FK_rezervacija`),
  KEY `fk_Racun_Korisnik1_idx` (`FK_moderator`),
  KEY `FK_korisnik` (`FK_korisnik`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=55 ;

--
-- Izbacivanje podataka za tablicu `Racun`
--

INSERT INTO `Racun` (`ID_racun`, `Usluga`, `Stanje`, `Potrosnja`, `Cijena`, `Vrijeme`, `Status`, `FK_rezervacija`, `FK_moderator`, `FK_korisnik`) VALUES
(50, 'voda', 56, 56, 309, '2016-06-16 12:25:23', 0, 30, 20, 21),
(51, 'plin', 555, 555, 283, '2016-06-16 12:51:13', 0, 31, 20, 21),
(52, 'plin', 667, 112, 396, '2016-06-16 12:51:28', 0, 34, 20, 21),
(53, 'plin', 55, 55, 28, '2016-06-16 15:18:53', 0, 43, 20, 33),
(54, 'voda', 56, 56, 364, '2016-06-16 19:26:23', 0, 45, 20, 33);

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `Rezervacija`
--

CREATE TABLE IF NOT EXISTS `Rezervacija` (
  `ID_rezervacija` int(11) NOT NULL AUTO_INCREMENT,
  `Datum` datetime NOT NULL,
  `Status` int(11) NOT NULL,
  `FK_korisnik` int(11) NOT NULL,
  `FK_kategorija` int(11) NOT NULL,
  PRIMARY KEY (`ID_rezervacija`),
  KEY `fk_Rezervacija_Korisnik1_idx` (`FK_korisnik`),
  KEY `fk_Rezervacija_Kategorija_ocitavanja1_idx` (`FK_kategorija`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=46 ;

--
-- Izbacivanje podataka za tablicu `Rezervacija`
--

INSERT INTO `Rezervacija` (`ID_rezervacija`, `Datum`, `Status`, `FK_korisnik`, `FK_kategorija`) VALUES
(30, '2016-06-16 12:24:18', 4, 21, 10),
(31, '2016-06-16 12:24:23', 4, 21, 11),
(32, '2016-06-16 12:24:27', 2, 21, 13),
(33, '2016-06-16 12:24:31', 3, 21, 10),
(34, '2016-06-16 12:24:34', 4, 21, 14),
(35, '2016-06-16 12:24:39', 0, 21, 15),
(36, '2016-06-16 12:30:02', 0, 27, 11),
(37, '2016-06-16 12:30:06', 1, 27, 13),
(38, '2016-06-16 12:30:09', 2, 27, 13),
(39, '2016-06-16 12:30:13', 0, 27, 14),
(40, '2016-06-16 13:23:00', 2, 32, 10),
(41, '2016-06-16 15:13:52', 3, 21, 13),
(42, '2016-06-16 15:14:04', 1, 21, 11),
(43, '2016-06-16 15:16:41', 4, 33, 11),
(44, '2016-06-16 19:23:06', 0, 20, 12),
(45, '2016-06-16 19:24:21', 4, 33, 16);

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `Tip_korisnika`
--

CREATE TABLE IF NOT EXISTS `Tip_korisnika` (
  `ID_tipKorisnika` int(11) NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Opis` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_tipKorisnika`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Izbacivanje podataka za tablicu `Tip_korisnika`
--

INSERT INTO `Tip_korisnika` (`ID_tipKorisnika`, `Naziv`, `Opis`) VALUES
(1, 'registrirani', 'ima korisnicki racun'),
(2, 'moderator', 'ima posebne ovlasti'),
(3, 'administrator', 'ima sve ovlasti');

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `Ustanova`
--

CREATE TABLE IF NOT EXISTS `Ustanova` (
  `ID_ustanova` int(11) NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Energent` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_ustanova`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=43 ;

--
-- Izbacivanje podataka za tablicu `Ustanova`
--

INSERT INTO `Ustanova` (`ID_ustanova`, `Naziv`, `Energent`) VALUES
(27, 'Ivkom', 'voda'),
(28, 'Varkom', 'voda'),
(29, 'Novokom', 'struja'),
(30, 'Plinara Zagreb', 'plin'),
(31, 'Plinara Dubrovnik', 'plin'),
(32, 'Vodovod Slunj', 'voda'),
(33, 'Plinara Osijek', 'plin'),
(34, 'Elektro Zapresic', 'struja'),
(35, 'Plinara Rovinj', 'plin'),
(36, 'Plinara Jerovec', 'plin'),
(37, 'Elektrana Jerovec', 'struja'),
(38, 'Elektrana Orehovec', 'struja'),
(39, 'Vodovod Orehovec', 'voda'),
(40, 'Vodovod Rijeka', 'voda'),
(41, 'Vodovod Koprivnica', 'voda'),
(42, 'FOI', 'struja');

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `Vrsta`
--

CREATE TABLE IF NOT EXISTS `Vrsta` (
  `ID_vrsta` int(11) NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_vrsta`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Izbacivanje podataka za tablicu `Vrsta`
--

INSERT INTO `Vrsta` (`ID_vrsta`, `Naziv`) VALUES
(1, 'prijava/odjava'),
(2, 'rad s bazom'),
(3, 'ostale radnje');

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `Zalba`
--

CREATE TABLE IF NOT EXISTS `Zalba` (
  `ID_zalba` int(11) NOT NULL AUTO_INCREMENT,
  `Status` int(11) NOT NULL,
  `Datum` datetime NOT NULL,
  `Opis` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Slika` longblob NOT NULL,
  `FK_racun` int(11) NOT NULL,
  PRIMARY KEY (`ID_zalba`),
  KEY `fk_Zalba_Racun1_idx` (`FK_racun`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Izbacivanje podataka za tablicu `Zalba`
--

INSERT INTO `Zalba` (`ID_zalba`, `Status`, `Datum`, `Opis`, `Slika`, `FK_racun`) VALUES
(9, 0, '2016-06-16 15:11:35', 'krivo', 0x75706c6f6164732f636f756e7465722d6e756d6265722e6a7067, 50),
(10, 0, '2016-06-16 15:12:57', 'neznam', 0x75706c6f6164732f62726f6a696c6f2e6a7067, 51),
(11, 1, '2016-06-16 19:27:48', 'jasda', 0x75706c6f6164732f636f756e7465722d6e756d6265722e6a7067, 54),
(12, 1, '2016-06-16 19:28:08', 'dsadas', 0x75706c6f6164732f6465662e6a7067, 54);

--
-- Ograničenja za izbačene tablice
--

--
-- Ograničenja za tablicu `Dnevnik`
--
ALTER TABLE `Dnevnik`
  ADD CONSTRAINT `Dnevnik_ibfk_1` FOREIGN KEY (`FK_vrsta`) REFERENCES `Vrsta` (`ID_vrsta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograničenja za tablicu `Kategorija_ocitavanja`
--
ALTER TABLE `Kategorija_ocitavanja`
  ADD CONSTRAINT `fk_Kategorija_ocitavanja_Korisnik1` FOREIGN KEY (`FK_moderator`) REFERENCES `Korisnik` (`ID_korisnik`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Kategorija_ocitavanja_ibfk_1` FOREIGN KEY (`FK_ustanova`) REFERENCES `Ustanova` (`ID_ustanova`);

--
-- Ograničenja za tablicu `Korisnik`
--
ALTER TABLE `Korisnik`
  ADD CONSTRAINT `fk_Korisnik_Tip_korisnika1` FOREIGN KEY (`FK_tip`) REFERENCES `Tip_korisnika` (`ID_tipKorisnika`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograničenja za tablicu `Lajkovi`
--
ALTER TABLE `Lajkovi`
  ADD CONSTRAINT `fk_Lajkovi_Korisnik1` FOREIGN KEY (`FK_korisnik`) REFERENCES `Korisnik` (`ID_korisnik`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograničenja za tablicu `Moderator_ustanova`
--
ALTER TABLE `Moderator_ustanova`
  ADD CONSTRAINT `Moderator_ustanova_ibfk_1` FOREIGN KEY (`FK_moderator`) REFERENCES `Korisnik` (`ID_korisnik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Moderator_ustanova_ibfk_2` FOREIGN KEY (`FK_ustanova`) REFERENCES `Ustanova` (`ID_ustanova`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograničenja za tablicu `Ocitano_stanje`
--
ALTER TABLE `Ocitano_stanje`
  ADD CONSTRAINT `Ocitano_stanje_ibfk_1` FOREIGN KEY (`FK_rezervacija`) REFERENCES `Rezervacija` (`ID_rezervacija`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograničenja za tablicu `Poslovnica`
--
ALTER TABLE `Poslovnica`
  ADD CONSTRAINT `Poslovnica_ibfk_1` FOREIGN KEY (`FK_ustanova`) REFERENCES `Ustanova` (`ID_ustanova`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograničenja za tablicu `Prijava`
--
ALTER TABLE `Prijava`
  ADD CONSTRAINT `fk_Prijava_Korisnik1` FOREIGN KEY (`FK_korisnik`) REFERENCES `Korisnik` (`ID_korisnik`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograničenja za tablicu `Racun`
--
ALTER TABLE `Racun`
  ADD CONSTRAINT `Racun_ibfk_1` FOREIGN KEY (`FK_rezervacija`) REFERENCES `Rezervacija` (`ID_rezervacija`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Racun_ibfk_2` FOREIGN KEY (`FK_moderator`) REFERENCES `Korisnik` (`ID_korisnik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Racun_ibfk_3` FOREIGN KEY (`FK_korisnik`) REFERENCES `Korisnik` (`ID_korisnik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograničenja za tablicu `Rezervacija`
--
ALTER TABLE `Rezervacija`
  ADD CONSTRAINT `fk_Rezervacija_Kategorija_ocitavanja1` FOREIGN KEY (`FK_kategorija`) REFERENCES `Kategorija_ocitavanja` (`ID_kategorija`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Rezervacija_Korisnik1` FOREIGN KEY (`FK_korisnik`) REFERENCES `Korisnik` (`ID_korisnik`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograničenja za tablicu `Zalba`
--
ALTER TABLE `Zalba`
  ADD CONSTRAINT `fk_Zalba_Racun1` FOREIGN KEY (`FK_racun`) REFERENCES `Racun` (`ID_racun`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
