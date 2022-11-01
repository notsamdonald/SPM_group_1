--
-- Database: `flight`
--

-- --------------------------------------------------------


INSERT INTO `airport` (`ID`, `name`) VALUES
(1, 'ATL'),
(2, 'ORD'),
(3, 'DFW'),
(4, 'JFK'),
(5, 'LAX'),
(6, 'SFO'),
(7, 'CLT'),
(8, 'MIA'),
(9, 'AUK'),
(10, 'SYD'),
(11, 'LHR'),
(12, 'CDG'),
(13, 'FRA');

-- --------------------------------------------------------

INSERT INTO `flight` (`ID`, `number`, `company`, `A_capacity`, `A_occupancy`, `A_fare`, `B_capacity`, `B_occupancy`, `B_fare`, `C_capacity`, `C_occupancy`, `C_fare`) VALUES
(1, 'Frontier Airlines_1', 'Frontier Airlines', 200, 200, 224, 100, 100, 288, 50, 50, 2257),
(2, 'British Airways_2', 'British Airways', 200, 189, 194, 100, 28, 260, 50, 5, 1887),
(3, 'Air New Zealand_3', 'Air New Zealand', 200, 7, 121, 100, 3, 585, 50, 20, 1900),
(4, 'Frontier Airlines_4', 'Frontier Airlines', 200, 89, 113, 100, 28, 441, 50, 34, 2040),
(5, 'Air New Zealand_5', 'Air New Zealand', 200, 43, 213, 100, 79, 514, 50, 47, 2448),
(6, 'JetBlue_6', 'JetBlue', 200, 184, 178, 100, 82, 453, 50, 12, 1259),
(7, 'Alaska Airlines_7', 'Alaska Airlines', 200, 130, 198, 100, 44, 406, 50, 30, 1786),
(8, 'United Airlines_8', 'United Airlines', 200, 54, 206, 100, 36, 295, 50, 26, 1545),
(9, 'Air New Zealand_9', 'Air New Zealand', 200, 43, 149, 100, 61, 577, 50, 0, 2747),
(10, 'Southwest Airlines_10', 'Southwest Airlines', 200, 67, 150, 100, 97, 290, 50, 25, 1311),
(11, 'JetBlue_11', 'JetBlue', 200, 200, 263, 100, 100, 559, 50, 50, 2587),
(12, 'Virgin America_12', 'Virgin America', 200, 77, 263, 100, 90, 561, 50, 21, 1652),
(13, 'United Airlines_13', 'United Airlines', 200, 175, 240, 100, 8, 213, 50, 32, 2233),
(14, 'Frontier Airlines_14', 'Frontier Airlines', 200, 196, 281, 100, 11, 291, 50, 11, 2399),
(15, 'JetBlue_15', 'JetBlue', 200, 3, 142, 100, 33, 575, 50, 6, 2178),
(16, 'Alaska Airlines_16', 'Alaska Airlines', 200, 53, 173, 100, 22, 233, 50, 48, 1635),
(17, 'United Airlines_17', 'United Airlines', 200, 142, 163, 100, 29, 569, 50, 26, 1275),
(18, 'JetBlue_18', 'JetBlue', 200, 54, 115, 100, 38, 555, 50, 45, 1493),
(19, 'Delta Airlines_19', 'Delta Airlines', 200, 136, 139, 100, 32, 222, 50, 24, 1347),
(20, 'JetBlue_20', 'JetBlue', 200, 38, 267, 100, 67, 561, 50, 14, 2404),
(21, 'Virgin America_21', 'Virgin America', 200, 200, 246, 100, 100, 594, 50, 50, 1011),
(22, 'Alaska Airlines_22', 'Alaska Airlines', 200, 148, 178, 100, 2, 583, 50, 28, 2872),
(23, 'Delta Airlines_23', 'Delta Airlines', 200, 169, 221, 100, 19, 397, 50, 40, 2935),
(24, 'American Airlines_24', 'American Airlines', 200, 20, 268, 100, 95, 484, 50, 12, 1197),
(25, 'Alaska Airlines_25', 'Alaska Airlines', 200, 14, 253, 100, 47, 201, 50, 28, 1882),
(26, 'Southwest Airlines_26', 'Southwest Airlines', 200, 45, 245, 100, 35, 508, 50, 33, 1337),
(27, 'Virgin America_27', 'Virgin America', 200, 14, 107, 100, 62, 503, 50, 45, 2282),
(28, 'Virgin America_28', 'Virgin America', 200, 62, 281, 100, 4, 230, 50, 3, 1925),
(29, 'American Airlines_29', 'American Airlines', 200, 192, 188, 100, 35, 442, 50, 48, 2655),
(30, 'Air New Zealand_30', 'Air New Zealand', 200, 98, 174, 100, 59, 252, 50, 37, 1435),
(31, 'Air New Zealand_31', 'Air New Zealand', 200, 200, 117, 100, 100, 315, 50, 50, 2513),
(32, 'Virgin America_32', 'Virgin America', 200, 127, 204, 100, 94, 289, 50, 0, 1059),
(33, 'Air New Zealand_33', 'Air New Zealand', 200, 88, 130, 100, 56, 462, 50, 6, 1307),
(34, 'American Airlines_34', 'American Airlines', 200, 14, 180, 100, 27, 310, 50, 27, 1423),
(35, 'United Airlines_35', 'United Airlines', 200, 158, 111, 100, 46, 343, 50, 32, 1107),
(36, 'Air France_36', 'Air France', 200, 42, 170, 100, 48, 470, 50, 7, 1766),
(37, 'Air France_37', 'Air France', 200, 116, 261, 100, 46, 234, 50, 21, 2066),
(38, 'JetBlue_38', 'JetBlue', 200, 64, 188, 100, 43, 581, 50, 45, 2594),
(39, 'United Airlines_39', 'United Airlines', 200, 194, 179, 100, 37, 333, 50, 9, 2681),
(40, 'Frontier Airlines_40', 'Frontier Airlines', 200, 181, 289, 100, 79, 202, 50, 18, 2959),
(41, 'Alaska Airlines_41', 'Alaska Airlines', 200, 200, 178, 100, 100, 400, 50, 50, 1623),
(42, 'British Airways_42', 'British Airways', 200, 121, 198, 100, 96, 266, 50, 23, 2469),
(43, 'American Airlines_43', 'American Airlines', 200, 172, 119, 100, 82, 548, 50, 32, 1013),
(44, 'Air France_44', 'Air France', 200, 75, 132, 100, 28, 368, 50, 19, 1678),
(45, 'American Airlines_45', 'American Airlines', 200, 0, 157, 100, 64, 467, 50, 25, 1701),
(46, 'Delta Airlines_46', 'Delta Airlines', 200, 175, 176, 100, 22, 454, 50, 6, 2889),
(47, 'Air New Zealand_47', 'Air New Zealand', 200, 80, 252, 100, 25, 204, 50, 32, 1236),
(48, 'Air France_48', 'Air France', 200, 60, 230, 100, 52, 536, 50, 4, 2502),
(49, 'Virgin America_49', 'Virgin America', 200, 149, 136, 100, 96, 391, 50, 46, 2189),
(50, 'Frontier Airlines_50', 'Frontier Airlines', 200, 33, 212, 100, 78, 378, 50, 25, 1497);


-- --------------------------------------------------------




INSERT INTO `location` (`ID`, `city`, `zip`, `state`, `country`) VALUES
(1, 'Atlanta', 1000, 'Georgia', 'USA'),
(2, 'Chicago', 1001, 'Illinois', 'USA'),
(3, 'Dallas', 1002, 'Texas', 'USA'),
(4, 'New York', 1003, 'New York', 'USA'),
(5, 'Los Angeles', 1004, 'California', 'USA'),
(6, 'San Francisco', 1005, 'California', 'USA'),
(7, 'Charlotte', 1006, 'North Carolina', 'USA'),
(8, 'Miami', 1007, 'Florida', 'USA'),
(9, 'Auckland', 2013, 'Auckland', 'New Zealand'),
(10, 'Sydney', 2014, 'New South Wales', 'Australia'),
(11, 'London', 2015, 'England', 'United Kingdom'),
(12, 'Paris', 2016, 'Ile-de-France', 'France'),
(13, 'Frankfurt', 2017, 'Hesse', 'Germany');

-- --------------------------------------------------------



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
(12, 12, 12),
(13, 13, 13);

-- --------------------------------------------------------

INSERT INTO `departures` (`ID`, `airport_ID`, `flight_ID`, `date_time`) VALUES
(1, 5, 1, '2022-12-01 21:55:03'),
(2, 11, 2, '2022-12-01 23:12:29'),
(3, 9, 3, '2022-12-01 21:12:55'),
(4, 10, 4, '2022-12-01 18:43:23'),
(5, 1, 5, '2022-12-01 22:21:56'),
(6, 4, 6, '2022-12-01 23:03:48'),
(7, 2, 7, '2022-12-02 04:59:39'),
(8, 2, 8, '2022-12-02 01:50:57'),
(9, 3, 9, '2022-12-01 23:13:55'),
(10, 9, 10, '2022-12-01 22:16:18'),
(11, 11, 11, '2022-12-01 18:41:36'),
(12, 9, 12, '2022-12-01 21:41:50'),
(13, 5, 13, '2022-12-01 21:02:04'),
(14, 5, 14, '2022-12-01 21:42:40'),
(15, 3, 15, '2022-12-02 01:32:14'),
(16, 2, 16, '2022-12-01 18:47:05'),
(17, 1, 17, '2022-12-01 20:40:20'),
(18, 0, 18, '2022-12-02 04:06:14'),
(19, 5, 19, '2022-12-01 20:17:28'),
(20, 4, 20, '2022-12-01 21:24:45'),
(21, 11, 21, '2022-12-01 19:01:06'),
(22, 5, 22, '2022-12-02 02:59:43'),
(23, 10, 23, '2022-12-02 03:58:08'),
(24, 1, 24, '2022-12-01 18:25:36'),
(25, 4, 25, '2022-12-02 00:55:44'),
(26, 8, 26, '2022-12-02 02:15:14'),
(27, 12, 27, '2022-12-02 00:49:55'),
(28, 10, 28, '2022-12-01 20:32:42'),
(29, 11, 29, '2022-12-01 19:44:16'),
(30, 5, 30, '2022-12-02 05:13:39'),
(31, 3, 31, '2022-12-01 23:37:05'),
(32, 12, 32, '2022-12-01 20:55:57'),
(33, 0, 33, '2022-12-01 23:56:11'),
(34, 6, 34, '2022-12-02 03:10:14'),
(35, 1, 35, '2022-12-02 00:43:58'),
(36, 1, 36, '2022-12-01 21:52:03'),
(37, 3, 37, '2022-12-02 04:34:13'),
(38, 7, 38, '2022-12-02 05:31:38'),
(39, 5, 39, '2022-12-02 05:14:59'),
(40, 3, 40, '2022-12-01 21:41:01'),
(41, 1, 41, '2022-12-01 19:51:50'),
(42, 4, 42, '2022-12-01 18:07:24'),
(43, 4, 43, '2022-12-01 18:57:48'),
(44, 5, 44, '2022-12-02 05:06:26'),
(45, 4, 45, '2022-12-01 23:15:31'),
(46, 6, 46, '2022-12-02 03:57:05'),
(47, 1, 47, '2022-12-02 00:03:41'),
(48, 0, 48, '2022-12-02 00:10:23'),
(49, 0, 49, '2022-12-01 19:33:06'),
(50, 4, 50, '2022-12-02 02:53:00');

-- --------------------------------------------------------


-- --------------------------------------------------------

INSERT INTO `lands` (`ID`, `airport_ID`, `flight_ID`, `date_time`) VALUES
(1, 10, 1, '2022-12-02 01:26:59'),
(2, 3, 2, '2022-12-02 02:43:44'),
(3, 7, 3, '2022-12-02 05:08:21'),
(4, 9, 4, '2022-12-01 21:08:39'),
(5, 2, 5, '2022-12-01 23:26:10'),
(6, 2, 6, '2022-12-02 07:57:34'),
(7, 9, 7, '2022-12-02 13:15:21'),
(8, 8, 8, '2022-12-02 06:15:50'),
(9, 2, 9, '2022-12-02 06:39:48'),
(10, 0, 10, '2022-12-02 08:55:56'),
(11, 9, 11, '2022-12-01 20:49:55'),
(12, 7, 12, '2022-12-02 09:36:04'),
(13, 1, 13, '2022-12-02 00:37:04'),
(14, 2, 14, '2022-12-02 00:13:45'),
(15, 8, 15, '2022-12-02 13:04:16'),
(16, 3, 16, '2022-12-01 21:01:28'),
(17, 6, 17, '2022-12-02 04:18:55'),
(18, 5, 18, '2022-12-02 12:19:24'),
(19, 10, 19, '2022-12-02 03:06:43'),
(20, 12, 20, '2022-12-02 00:57:24'),
(21, 2, 21, '2022-12-02 00:19:39'),
(22, 6, 22, '2022-12-02 07:09:15'),
(23, 11, 23, '2022-12-02 13:48:17'),
(24, 8, 24, '2022-12-02 03:51:57'),
(25, 3, 25, '2022-12-02 06:59:23'),
(26, 11, 26, '2022-12-02 12:05:33'),
(27, 2, 27, '2022-12-02 06:17:05'),
(28, 12, 28, '2022-12-01 22:50:34'),
(29, 2, 29, '2022-12-02 06:10:39'),
(30, 4, 30, '2022-12-02 15:49:59'),
(31, 2, 31, '2022-12-02 03:45:16'),
(32, 3, 32, '2022-12-01 22:49:06'),
(33, 7, 33, '2022-12-02 03:34:16'),
(34, 4, 34, '2022-12-02 06:23:29'),
(35, 5, 35, '2022-12-02 02:02:41'),
(36, 4, 36, '2022-12-02 09:29:58'),
(37, 0, 37, '2022-12-02 15:36:38'),
(38, 12, 38, '2022-12-02 08:08:12'),
(39, 8, 39, '2022-12-02 10:17:17'),
(40, 6, 40, '2022-12-01 22:11:16'),
(41, 9, 41, '2022-12-02 00:13:51'),
(42, 9, 42, '2022-12-02 03:07:51'),
(43, 7, 43, '2022-12-01 22:34:29'),
(44, 9, 44, '2022-12-02 16:28:14'),
(45, 9, 45, '2022-12-02 01:48:27'),
(46, 0, 46, '2022-12-02 15:06:45'),
(47, 4, 47, '2022-12-02 01:18:21'),
(48, 9, 48, '2022-12-02 01:56:29'),
(49, 5, 49, '2022-12-02 02:43:18'),
(50, 0, 50, '2022-12-02 11:10:07');

-- --------------------------------------------------------