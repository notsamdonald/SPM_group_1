
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

DROP DATABASE IF EXISTS Flight;
CREATE DATABASE IF NOT EXISTS Flight;
USE Flight;

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


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
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `login` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `airport_location`
--
ALTER TABLE `airport_location`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorite_place`
--
ALTER TABLE `favorite_place`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lands`
--
ALTER TABLE `lands`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lives`
--
ALTER TABLE `lives`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

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