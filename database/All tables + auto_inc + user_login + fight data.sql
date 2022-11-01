-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 01, 2022 at 01:02 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Flight`
--

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`ID`, `name`) VALUES
(1, 'ORD'),
(2, 'DFW'),
(3, 'JFK'),
(4, 'LAX'),
(5, 'SFO'),
(6, 'CLT'),
(7, 'MIA'),
(8, 'AUK'),
(9, 'SYD'),
(10, 'LHR'),
(11, 'CDG'),
(12, 'FRA');

-- --------------------------------------------------------

--
-- Table structure for table `airport_location`
--

CREATE TABLE `airport_location` (
  `ID` int(11) NOT NULL,
  `location_ID` int(11) NOT NULL,
  `airport_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airport_location`
--

INSERT INTO `airport_location` (`ID`, `location_ID`, `airport_ID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12);

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `ID` int(11) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `flight_ID` int(11) NOT NULL,
  `coupon_ID` int(11) NOT NULL,
  `booking_time` datetime NOT NULL,
  `seat_number` varchar(10) NOT NULL,
  `paid_amount` float(10,2) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `booking_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `ID` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `discount_amount` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `expire_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `departures`
--

CREATE TABLE `departures` (
  `ID` int(11) NOT NULL,
  `airport_ID` int(11) NOT NULL,
  `flight_ID` int(11) NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departures`
--

INSERT INTO `departures` (`ID`, `airport_ID`, `flight_ID`, `date_time`) VALUES
(1, 3, 1, '2022-11-27 16:26:18'),
(2, 3, 2, '2022-11-27 23:40:44'),
(3, 5, 3, '2022-11-27 17:05:11'),
(5, 12, 5, '2022-11-27 18:17:50'),
(6, 9, 6, '2022-11-27 17:15:01'),
(7, 8, 7, '2022-11-27 22:19:17'),
(8, 1, 8, '2022-11-27 23:27:25'),
(9, 5, 9, '2022-11-27 18:41:40'),
(12, 9, 12, '2022-11-27 14:44:02'),
(13, 7, 13, '2022-11-27 16:07:57'),
(14, 4, 14, '2022-11-27 14:37:09'),
(15, 7, 15, '2022-11-27 18:12:36'),
(16, 8, 16, '2022-11-27 15:31:11'),
(17, 12, 17, '2022-11-27 23:29:17'),
(19, 12, 19, '2022-11-27 18:30:37'),
(20, 2, 20, '2022-11-27 22:35:32'),
(21, 5, 21, '2022-11-27 18:33:57'),
(23, 12, 23, '2022-11-27 19:16:26'),
(24, 6, 24, '2022-11-27 23:56:38'),
(26, 10, 26, '2022-11-27 14:58:45'),
(27, 8, 27, '2022-11-27 21:28:15'),
(28, 1, 28, '2022-11-27 21:25:11'),
(29, 6, 29, '2022-11-27 18:08:17'),
(30, 11, 30, '2022-11-27 20:51:46'),
(31, 10, 31, '2022-11-27 15:46:20'),
(32, 1, 32, '2022-11-28 02:21:48'),
(33, 3, 33, '2022-11-28 01:26:50'),
(34, 3, 34, '2022-11-27 23:22:31'),
(35, 8, 35, '2022-11-27 21:00:01'),
(37, 6, 37, '2022-11-27 22:25:06'),
(38, 1, 38, '2022-11-28 00:50:33'),
(39, 12, 39, '2022-11-28 00:14:17'),
(40, 4, 40, '2022-11-28 00:33:30'),
(41, 9, 41, '2022-11-27 23:07:33'),
(42, 2, 42, '2022-11-28 00:46:29'),
(43, 6, 43, '2022-11-27 19:24:22'),
(44, 11, 44, '2022-11-28 02:00:12'),
(45, 7, 45, '2022-11-27 18:56:38'),
(46, 5, 46, '2022-11-27 22:42:53'),
(47, 1, 47, '2022-11-27 22:55:41'),
(48, 12, 48, '2022-11-27 23:26:16'),
(49, 7, 49, '2022-11-27 22:02:10');

-- --------------------------------------------------------

--
-- Table structure for table `favorite_place`
--

CREATE TABLE `favorite_place` (
  `ID` int(11) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `location_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `ID` int(11) NOT NULL,
  `number` varchar(100) NOT NULL,
  `company` varchar(100) NOT NULL,
  `A_capacity` int(11) NOT NULL,
  `A_occupancy` int(11) NOT NULL,
  `A_fare` int(11) NOT NULL,
  `B_capacity` int(11) NOT NULL,
  `B_occupancy` int(11) NOT NULL,
  `B_fare` int(11) NOT NULL,
  `C_capacity` int(11) NOT NULL,
  `C_occupancy` int(11) NOT NULL,
  `C_fare` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`ID`, `number`, `company`, `A_capacity`, `A_occupancy`, `A_fare`, `B_capacity`, `B_occupancy`, `B_fare`, `C_capacity`, `C_occupancy`, `C_fare`) VALUES
(1, 'Frontier Airlines_7', 'Frontier Airlines', 200, 84, 161, 100, 29, 339, 50, 29, 1504),
(2, 'Frontier Airlines_17', 'Frontier Airlines', 200, 56, 261, 100, 43, 256, 50, 43, 1273),
(3, 'Frontier Airlines_10', 'Frontier Airlines', 200, 47, 126, 100, 82, 517, 50, 43, 1180),
(4, 'British Airways_4', 'British Airways', 200, 142, 109, 100, 7, 510, 50, 29, 2445),
(5, 'Air France_1', 'Air France', 200, 88, 210, 100, 13, 300, 50, 19, 1485),
(6, 'Air New Zealand_14', 'Air New Zealand', 200, 80, 171, 100, 84, 451, 50, 37, 1151),
(7, 'British Airways_14', 'British Airways', 200, 97, 167, 100, 6, 450, 50, 31, 2974),
(8, 'British Airways_16', 'British Airways', 200, 143, 244, 100, 19, 404, 50, 23, 2526),
(9, 'United Airlines_11', 'United Airlines', 200, 46, 208, 100, 50, 434, 50, 0, 2126),
(10, 'Air New Zealand_13', 'Air New Zealand', 200, 0, 192, 100, 0, 389, 50, 0, 1042),
(11, 'Virgin America_7', 'Virgin America', 200, 37, 179, 100, 39, 482, 50, 21, 1045),
(12, 'Virgin America_6', 'Virgin America', 200, 2, 275, 100, 54, 420, 50, 45, 1702),
(13, 'Southwest Airlines_2', 'Southwest Airlines', 200, 53, 298, 100, 43, 404, 50, 35, 1472),
(14, 'Southwest Airlines_5', 'Southwest Airlines', 200, 182, 217, 100, 69, 416, 50, 29, 1951),
(15, 'American Airlines_13', 'American Airlines', 200, 159, 250, 100, 32, 342, 50, 32, 1033),
(16, 'Delta Airlines_2', 'Delta Airlines', 200, 185, 146, 100, 50, 322, 50, 26, 1232),
(17, 'United Airlines_5', 'United Airlines', 200, 34, 142, 100, 48, 352, 50, 19, 1707),
(18, 'Air New Zealand_6', 'Air New Zealand', 200, 86, 176, 100, 46, 390, 50, 9, 2421),
(19, 'Air New Zealand_19', 'Air New Zealand', 200, 53, 134, 100, 49, 244, 50, 26, 1327),
(20, 'Delta Airlines_13', 'Delta Airlines', 200, 0, 291, 100, 0, 515, 50, 0, 2107),
(21, 'Virgin America_3', 'Virgin America', 200, 172, 207, 100, 72, 391, 50, 23, 1219),
(22, 'JetBlue_5', 'JetBlue', 200, 129, 154, 100, 86, 232, 50, 37, 2700),
(23, 'Southwest Airlines_15', 'Southwest Airlines', 200, 22, 101, 100, 41, 351, 50, 48, 2471),
(24, 'Alaska Airlines_5', 'Alaska Airlines', 200, 178, 176, 100, 16, 333, 50, 48, 1306),
(25, 'Alaska Airlines_11', 'Alaska Airlines', 200, 66, 254, 100, 81, 352, 50, 24, 1525),
(26, 'Alaska Airlines_10', 'Alaska Airlines', 200, 199, 289, 100, 60, 494, 50, 32, 1636),
(27, 'Air France_7', 'Air France', 200, 173, 219, 100, 82, 376, 50, 44, 2267),
(28, 'Air New Zealand_4', 'Air New Zealand', 200, 151, 294, 100, 28, 350, 50, 0, 1997),
(29, 'Air France_1', 'Air France', 200, 73, 145, 100, 40, 508, 50, 19, 1598),
(30, 'JetBlue_19', 'JetBlue', 200, 0, 194, 100, 0, 253, 50, 0, 1693),
(31, 'United Airlines_4', 'United Airlines', 200, 64, 184, 100, 87, 503, 50, 29, 2165),
(32, 'Southwest Airlines_6', 'Southwest Airlines', 200, 112, 101, 100, 26, 235, 50, 38, 2031),
(33, 'American Airlines_14', 'American Airlines', 200, 99, 239, 100, 67, 396, 50, 25, 2517),
(34, 'Virgin America_12', 'Virgin America', 200, 165, 113, 100, 26, 328, 50, 22, 2463),
(35, 'Virgin America_12', 'Virgin America', 200, 45, 262, 100, 68, 560, 50, 12, 1098),
(36, 'American Airlines_17', 'American Airlines', 200, 153, 245, 100, 18, 437, 50, 15, 1420),
(37, 'JetBlue_2', 'JetBlue', 200, 85, 118, 100, 99, 594, 50, 44, 2034),
(38, 'Frontier Airlines_7', 'Frontier Airlines', 200, 32, 133, 100, 21, 283, 50, 0, 1127),
(39, 'Delta Airlines_2', 'Delta Airlines', 200, 12, 106, 100, 7, 329, 50, 24, 1382),
(40, 'Delta Airlines_18', 'Delta Airlines', 200, 0, 134, 100, 0, 379, 50, 0, 1268),
(41, 'Alaska Airlines_7', 'Alaska Airlines', 200, 105, 146, 100, 50, 436, 50, 44, 2551),
(42, 'Air New Zealand_11', 'Air New Zealand', 200, 48, 231, 100, 90, 419, 50, 36, 2459),
(43, 'Virgin America_15', 'Virgin America', 200, 13, 270, 100, 98, 365, 50, 43, 1914),
(44, 'British Airways_5', 'British Airways', 200, 99, 232, 100, 13, 298, 50, 14, 2665),
(45, 'Delta Airlines_15', 'Delta Airlines', 200, 116, 122, 100, 33, 430, 50, 3, 1823),
(46, 'JetBlue_5', 'JetBlue', 200, 15, 231, 100, 86, 446, 50, 33, 1944),
(47, 'Southwest Airlines_11', 'Southwest Airlines', 200, 186, 223, 100, 92, 523, 50, 15, 2852),
(48, 'American Airlines_1', 'American Airlines', 200, 82, 173, 100, 83, 591, 50, 4, 1096),
(49, 'JetBlue_1', 'JetBlue', 200, 179, 224, 100, 78, 552, 50, 8, 1192);

-- --------------------------------------------------------

--
-- Table structure for table `lands`
--

CREATE TABLE `lands` (
  `ID` int(11) NOT NULL,
  `airport_ID` int(11) NOT NULL,
  `flight_ID` int(11) NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lands`
--

INSERT INTO `lands` (`ID`, `airport_ID`, `flight_ID`, `date_time`) VALUES
(1, 11, 1, '2022-11-28 03:03:47'),
(2, 6, 2, '2022-11-28 01:14:08'),
(4, 10, 4, '2022-11-28 04:39:46'),
(5, 9, 5, '2022-11-28 01:55:13'),
(6, 10, 6, '2022-11-28 02:15:45'),
(7, 6, 7, '2022-11-28 08:14:12'),
(9, 12, 9, '2022-11-27 19:15:09'),
(10, 5, 10, '2022-11-28 04:00:48'),
(11, 8, 11, '2022-11-27 22:59:05'),
(12, 9, 12, '2022-11-27 21:13:49'),
(13, 10, 13, '2022-11-27 17:58:40'),
(14, 2, 14, '2022-11-27 21:00:35'),
(15, 10, 15, '2022-11-27 20:42:16'),
(17, 5, 17, '2022-11-28 09:04:49'),
(18, 6, 18, '2022-11-28 07:33:51'),
(19, 1, 19, '2022-11-28 04:07:34'),
(20, 6, 20, '2022-11-28 05:25:16'),
(21, 4, 21, '2022-11-27 21:22:50'),
(22, 12, 22, '2022-11-28 02:02:35'),
(23, 5, 23, '2022-11-27 21:11:55'),
(24, 5, 24, '2022-11-28 02:32:02'),
(25, 1, 25, '2022-11-28 02:14:49'),
(26, 5, 26, '2022-11-28 02:29:27'),
(27, 12, 27, '2022-11-28 01:26:49'),
(28, 9, 28, '2022-11-28 07:17:49'),
(29, 9, 29, '2022-11-27 19:07:39'),
(30, 11, 30, '2022-11-27 21:59:50'),
(31, 4, 31, '2022-11-27 18:06:07'),
(32, 5, 32, '2022-11-28 13:46:30'),
(33, 10, 33, '2022-11-28 06:46:41'),
(34, 5, 34, '2022-11-28 02:24:46'),
(35, 7, 35, '2022-11-27 21:58:39'),
(36, 4, 36, '2022-11-28 07:57:26'),
(38, 12, 38, '2022-11-28 02:16:50'),
(39, 8, 39, '2022-11-28 03:29:59'),
(40, 1, 40, '2022-11-28 01:27:16'),
(41, 12, 41, '2022-11-28 03:24:58'),
(42, 6, 42, '2022-11-28 06:34:04'),
(43, 5, 43, '2022-11-27 23:32:58'),
(44, 8, 44, '2022-11-28 06:50:52'),
(45, 7, 45, '2022-11-28 01:04:33'),
(46, 5, 46, '2022-11-28 01:18:12'),
(47, 5, 47, '2022-11-28 07:08:20'),
(48, 11, 48, '2022-11-28 00:01:47'),
(49, 8, 49, '2022-11-28 03:08:51');

-- --------------------------------------------------------

--
-- Table structure for table `lives`
--

CREATE TABLE `lives` (
  `ID` int(11) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `location_ID` int(11) NOT NULL,
  `apt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `ID` int(11) NOT NULL,
  `city` varchar(20) NOT NULL,
  `zip` int(11) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`ID`, `city`, `zip`, `state`, `country`) VALUES
(1, 'Chicago', 1001, 'Illinois', 'USA'),
(2, 'Dallas', 1002, 'Texas', 'USA'),
(3, 'New York', 1003, 'New York', 'USA'),
(4, 'Los Angeles', 1004, 'California', 'USA'),
(5, 'San Francisco', 1005, 'California', 'USA'),
(6, 'Charlotte', 1006, 'North Carolina', 'USA'),
(7, 'Miami', 1007, 'Florida', 'USA'),
(8, 'Auckland', 2013, 'Auckland', 'New Zealand'),
(9, 'Sydney', 2014, 'New South Wales', 'Australia'),
(10, 'London', 2015, 'England', 'United Kingdom'),
(11, 'Paris', 2016, 'Ile-de-France', 'France'),
(12, 'Frankfurt', 2017, 'Hesse', 'Germany');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `login` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `first_name`, `last_name`, `contact_number`, `email`, `password`, `login`) VALUES
(1, 'Tanmoy Sarkar', 'Pias', '55555555', 'tanmoysarkar@vt.edu', 'test', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `airport_location`
--
ALTER TABLE `airport_location`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `location_ID` (`location_ID`),
  ADD KEY `airport_ID` (`airport_ID`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_ID` (`user_ID`),
  ADD KEY `flight_ID` (`flight_ID`),
  ADD KEY `coupon_ID` (`coupon_ID`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `departures`
--
ALTER TABLE `departures`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `airport_ID` (`airport_ID`),
  ADD KEY `flight_ID` (`flight_ID`);

--
-- Indexes for table `favorite_place`
--
ALTER TABLE `favorite_place`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `location_ID` (`location_ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `lands`
--
ALTER TABLE `lands`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `flight_ID` (`flight_ID`),
  ADD KEY `airport_ID` (`airport_ID`);

--
-- Indexes for table `lives`
--
ALTER TABLE `lives`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `lives_ibfk_1` (`user_ID`),
  ADD KEY `lives_ibfk_2` (`location_ID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airport`
--
ALTER TABLE `airport`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `airport_location`
--
ALTER TABLE `airport_location`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departures`
--
ALTER TABLE `departures`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `favorite_place`
--
ALTER TABLE `favorite_place`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `lands`
--
ALTER TABLE `lands`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `lives`
--
ALTER TABLE `lives`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `airport_location`
--
ALTER TABLE `airport_location`
  ADD CONSTRAINT `airport_location_ibfk_1` FOREIGN KEY (`location_ID`) REFERENCES `location` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `airport_location_ibfk_2` FOREIGN KEY (`airport_ID`) REFERENCES `airport` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`flight_ID`) REFERENCES `flight` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `book_ibfk_3` FOREIGN KEY (`coupon_ID`) REFERENCES `coupon` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `departures`
--
ALTER TABLE `departures`
  ADD CONSTRAINT `departures_ibfk_1` FOREIGN KEY (`airport_ID`) REFERENCES `airport` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `departures_ibfk_2` FOREIGN KEY (`flight_ID`) REFERENCES `flight` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite_place`
--
ALTER TABLE `favorite_place`
  ADD CONSTRAINT `favorite_place_ibfk_1` FOREIGN KEY (`location_ID`) REFERENCES `location` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_place_ibfk_2` FOREIGN KEY (`user_ID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lands`
--
ALTER TABLE `lands`
  ADD CONSTRAINT `lands_ibfk_1` FOREIGN KEY (`flight_ID`) REFERENCES `flight` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lands_ibfk_2` FOREIGN KEY (`airport_ID`) REFERENCES `airport` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lives`
--
ALTER TABLE `lives`
  ADD CONSTRAINT `lives_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lives_ibfk_2` FOREIGN KEY (`location_ID`) REFERENCES `location` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
