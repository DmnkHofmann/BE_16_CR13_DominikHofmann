-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2022 at 05:35 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `be16_cr13_bigeventsdominikhofmann`
--
CREATE DATABASE IF NOT EXISTS `be16_cr13_bigeventsdominikhofmann` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `be16_cr13_bigeventsdominikhofmann`;

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220805162245', '2022-08-05 18:23:22', 126);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `starttime` datetime NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phonenumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `date`, `starttime`, `description`, `image`, `capacity`, `email`, `phonenumber`, `address`, `url`, `type`) VALUES
(1, 'Theater Wien', '2022-08-06 14:44:03', '2022-08-07 19:00:00', 'Theater an der Wien Vorführung', 'https://cdn.pixabay.com/photo/2019/11/07/20/48/cinema-4609877_960_720.jpg', '200', 'theater@mail.com', '0123456', 'Theaterstrasse 1 1150 Wien', 'www.theater.at', 'theater'),
(5, 'Musuem Wien', '2022-08-08 19:00:00', '2022-08-08 19:30:00', 'Museumsvorstellung Wien', 'https://cdn.pixabay.com/photo/2017/04/05/01/10/natural-history-museum-2203648_960_720.jpg', '150', 'museum@mail.com', '135791', 'Museumstrasse 1 1010 Wien', 'www.museum.at', 'museum'),
(6, 'Kindermuseum Wien', '2022-08-09 13:00:00', '2022-08-09 14:00:00', 'Kindermuseum Wien', 'https://cdn.pixabay.com/photo/2019/07/03/09/41/national-history-museum-4314035_960_720.jpg', '100', 'kindermuseum@mail.com', '0987654', 'Kindermuseumstrasse 1 1020 Wien', 'www.kindermuseum.at', 'museum'),
(7, 'Phantom der Oper', '2022-08-10 18:00:00', '2022-08-10 19:00:00', 'Theateraufführung Wien', 'https://cdn.pixabay.com/photo/2016/03/10/17/01/stage-1248769_960_720.jpg', '250', 'phantom@mail.com', '2468912', 'Operastrasse 4 1030 Wien', 'www.phantom.at', 'theater'),
(8, 'Malen im Garten', '2022-08-11 12:00:00', '2022-08-11 13:00:00', 'Kunst Workshop im Freien', 'https://cdn.pixabay.com/photo/2015/08/28/11/37/painting-911804_960_720.jpg', '30', 'malen@mail.com', '12345678', 'Malerstrasse 5 1040 Wien', 'www.malen.at', 'workshop'),
(9, 'Töpferkurs Wien', '2022-08-12 13:00:00', '2022-08-12 19:00:00', 'Töpferkurs im Herzen Wiens', 'https://cdn.pixabay.com/photo/2016/01/13/22/48/pottery-1139047_960_720.jpg', '15', 'topf@mail.com', '1312546', 'Topfstrasse 6 1050 Wien', 'www.topf.at', 'workshop'),
(10, 'Brunchtime Vienna', '2022-08-13 14:00:00', '2022-08-13 15:00:00', 'Brunch genießen in Wien', 'https://cdn.pixabay.com/photo/2020/01/29/04/48/food-4801581_960_720.jpg', '40', 'brunch@mail.com', '95647382', 'Brunchstrasse 1 1060 Wien', 'www.brunch.at', 'kulinarik'),
(11, 'Candlelightdinner für Verliebte', '2022-08-14 20:00:00', '2022-08-14 21:00:00', 'Romantikdinner in Wien', 'https://cdn.pixabay.com/photo/2016/03/19/20/36/wine-1267427_960_720.jpg', '2', 'dinner@mail.com', '142354', 'Dinnerstrasse 4 1070 Wien', 'www.dinner.at', 'kulinarik'),
(12, 'Racebike Workshop', '2022-08-15 09:00:00', '2022-08-15 12:00:00', 'Rennradworkshop mit Rennprofi', 'https://cdn.pixabay.com/photo/2015/01/13/13/21/racing-bike-598195_960_720.jpg', '60', 'rad@mail.com', '392018', 'Radstrasse 2 1090 Wien', 'www.rad.at', 'workshop');

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
