-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 04, 2025 at 05:11 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carpooldb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminID`, `username`, `email`, `password`, `role`) VALUES
(1, 'Root Admin', 'sooyk-jm21@student.tarc.edu.my', '$2y$10$RZ3uSOS41WIutgWl9ZL.JuGbZle91vp4uoRMAismRUwp7uOiLJM7y', 'Root Admin'),
(2, 'yksoo', 'yksoo2011@gmail.com', '$2y$10$nCX3RAiyaB9o7p3zB9Oh1uo4c0vIIonaqMK.YuoEz3LXQWHPCrkTu', 'Admin'),
(3, 'testing', 'teeyp-jm21@student.tarc.edu.my', '$2y$10$jc11scxF6nDLPlVZ13wDe.AoV708tjUDRCUWjQ0ynyOPdTRUi1Nh6', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `announcementID` int(11) NOT NULL,
  `adminID` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `dateCreated` date DEFAULT curdate(),
  `dateModify` date DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `formatMetadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`formatMetadata`)),
  `pendingDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`announcementID`, `adminID`, `title`, `content`, `dateCreated`, `dateModify`, `status`, `formatMetadata`, `pendingDate`) VALUES
(6, 1, 'Carpooling System Launch!', 'Join us in building a greener future! Our new carpooling system connects commuters for a more sustainable and affordable journey. Be a part of the change register now and start sharing rides today!', '2024-12-11', '2024-12-24', 'Pending', '{\"title\":[{\"word\":\"Carpooling S\",\"styles\":[\"bold\"]},{\"word\":\"Carpooling S\",\"styles\":[\"color:rgb(184, 49, 47)\"]},{\"word\":\"ystem Launch!\",\"styles\":[\"color:rgb(184, 49, 47)\"]},{\"word\":\"ystem Launch!\",\"styles\":[\"bold\"]}],\"content\":[{\"word\":\"greener\",\"styles\":[\"color:rgb(97, 189, 109)\"]},{\"word\":\"sustainable and affordable journey\",\"styles\":[\"color:rgb(247, 218, 100)\"]},{\"word\":\"register now\",\"styles\":[\"color:rgb(147, 101, 184)\"]}]}', NULL),
(7, 1, 'Drive Together, Save Together!', 'Reduce your commute costs and your carbon footprint! Sign up for our carpooling system and connect with others heading your way. Let\'s make every mile count join the carpool revolution now!', '2024-12-11', NULL, 'Publish', '{\"title\":[{\"word\":\"Drive Together, Save Together!\",\"styles\":[\"bold\"]}],\"content\":[{\"word\":\"Sign up for our carpooling system\",\"styles\":[\"color:rgb(247, 218, 100)\"]}]}', NULL),
(8, 1, 'Your Ride, Your Way!', 'Why ride alone? Use our carpooling system to find companions for your daily commutes or occasional trips. Sharing rides has never been this simple get started today!', '2024-12-11', '2024-12-27', 'Publish', '{\"title\":[],\"content\":[]}', '2024-12-27 23:28:00'),
(9, 1, 'Connect & Commute with Ease!', 'Our carpooling system is live! Link up with people heading in the same direction. Whether you\'re driving or riding, it\'s a win-win for everyone. Sign up and share the road!', '2024-12-11', '2024-12-27', 'Pending', '{\"title\":[{\"word\":\"Connect & Commute with Ease!\",\"styles\":[\"bold\"]}],\"content\":[{\"word\":\"Link up with people\",\"styles\":[\"color:rgb(44, 130, 201)\"]}]}', '2024-12-27 23:33:00'),
(10, 1, 'Share the Ride, Share the Planet!', 'Every ride shared is a step towards a cleaner planet. Join our carpooling system to save money, time, and the environment. Together, we can make a difference register today!', '2024-12-11', '2024-12-27', 'Publish', '{\"title\":[],\"content\":[{\"word\":\"register today!\",\"styles\":[\"bold\"]},{\"word\":\"register today!\",\"styles\":[\"color:rgb(209, 72, 65)\"]}]}', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `anonymous_report`
--

CREATE TABLE `anonymous_report` (
  `reportingID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `reason` text NOT NULL,
  `reportDate` date DEFAULT curdate(),
  `status` varchar(20) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anonymous_report`
--

INSERT INTO `anonymous_report` (`reportingID`, `userID`, `reason`, `reportDate`, `status`) VALUES
(1, 4, 'Drive too fast, unsafe', '2024-12-18', 'pending'),
(2, 4, 'danger driver', '2024-12-18', 'pending'),
(3, 4, 'bad driver', '2024-12-18', 'pending'),
(4, 6, 'bad passenger', '2024-12-19', 'Solved');

-- --------------------------------------------------------

--
-- Table structure for table `blacklist`
--

CREATE TABLE `blacklist` (
  `blacklistID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `blacklistedID` int(11) NOT NULL,
  `role` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','solved') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blacklist`
--

INSERT INTO `blacklist` (`blacklistID`, `userID`, `blacklistedID`, `role`, `created_at`, `status`) VALUES
(4, 4, 1, 'driver', '2024-12-12 14:08:41', 'solved'),
(5, 4, 1, 'driver', '2024-12-09 14:08:41', 'solved'),
(6, 6, 7, 'driver', '2024-12-17 14:48:14', 'solved'),
(7, 2, 7, 'driver', '2024-12-18 15:04:51', 'solved'),
(12, 6, 1, 'driver', '2024-12-18 19:37:39', 'solved');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `bookingID` int(11) NOT NULL,
  `passengerID` int(11) DEFAULT NULL,
  `tripID` int(11) DEFAULT NULL,
  `bookingDate` date DEFAULT curdate(),
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`bookingID`, `passengerID`, `tripID`, `bookingDate`, `status`) VALUES
(1, 3, 58, '2024-11-13', 'approved'),
(2, 4, 58, '2024-11-13', 'approved'),
(6, 22, 58, '2024-11-13', 'pending'),
(8, 2, 58, '2024-11-15', 'pending'),
(14, 4, 54, '2024-11-24', 'pending'),
(15, 4, 53, '2024-11-24', 'approved'),
(23, 4, 50, '2024-12-07', 'approved'),
(24, 3, 62, '2024-12-24', 'pending'),
(25, 3, 52, '2024-12-24', 'pending'),
(26, 3, 53, '2024-12-24', 'approved'),
(27, 4, 57, '2024-12-30', 'pending'),
(28, 4, 56, '2024-12-30', 'approved'),
(29, 3, 57, '2024-12-30', 'pending'),
(30, 3, 56, '2024-12-30', 'pending'),
(31, 6, 63, '2025-01-01', 'approved'),
(32, 6, 64, '2025-01-01', 'approved'),
(33, 6, 65, '2025-01-01', 'pending'),
(34, 6, 66, '2025-01-01', 'pending'),
(35, 6, 68, '2025-01-01', 'pending'),
(36, 6, 70, '2025-01-01', 'approved'),
(37, 6, 71, '2025-01-01', 'approved'),
(41, 4, 72, '2025-01-01', 'approved'),
(42, 6, 69, '2025-01-02', 'pending'),
(43, 4, 78, '2025-01-02', 'pending'),
(44, 4, 77, '2025-01-02', 'pending'),
(45, 4, 76, '2025-01-02', 'pending'),
(46, 3, 78, '2025-01-02', 'pending'),
(47, 3, 77, '2025-01-02', 'pending'),
(48, 3, 74, '2025-01-02', 'pending'),
(49, 3, 79, '2025-01-02', 'approved'),
(50, 4, 74, '2025-01-02', 'pending'),
(51, 4, 79, '2025-01-02', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driverID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `licenseNum` varchar(50) NOT NULL,
  `licenseExpiry` date DEFAULT NULL,
  `licenseExpiryNotification` date DEFAULT NULL,
  `licenseImg` varchar(255) DEFAULT NULL,
  `carRegNo` varchar(50) NOT NULL,
  `carImg` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driverID`, `userID`, `licenseNum`, `licenseExpiry`, `licenseExpiryNotification`, `licenseImg`, `carRegNo`, `carImg`, `status`) VALUES
(1, 2, '030320-01-0935', '2025-12-12', NULL, '../uploads/2_license_mrbeanlicence.jpg', 'WA753DD', '../uploads/2_car_hondared.png', 'active'),
(2, 1, '030320-01-0935', '2025-01-22', NULL, '../uploads/1_license_mrbeanlicence.jpg', 'WA753D', '../uploads/1_car_hondared.png', 'active'),
(3, 3, '030320-01-0935', NULL, NULL, '../uploads/3_license_mrbeanlicence.jpg', 'WA74444', '../uploads/3_car_hondared.png', 'active'),
(6, 4, '030320010935', NULL, NULL, '../uploads/4_license_mrbeanlicence.jpg', 'WA753D', '../uploads/4_car_hondared.png', 'banned'),
(7, 6, '030320-01-0935', NULL, NULL, '../uploads/6_license_mrbeanlicence.jpg', 'WA73333', '../uploads/6_car_hondared.png', 'active'),
(22, 7, '', NULL, NULL, NULL, '', NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedbackID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `dateSubmitted` date DEFAULT curdate(),
  `response` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedbackID`, `userID`, `content`, `dateSubmitted`, `response`) VALUES
(1, 2, 'good\r\nhahah', '2024-12-11', NULL),
(2, 2, 'bad\r\nNOOOOOOOOO', '2024-12-11', NULL),
(3, 2, 'well', '2024-12-11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `guideline`
--

CREATE TABLE `guideline` (
  `guidelineID` int(11) NOT NULL,
  `adminID` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `dateCreated` date DEFAULT curdate(),
  `dateModify` date DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `formatMetadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`formatMetadata`)),
  `pendingDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guideline`
--

INSERT INTO `guideline` (`guidelineID`, `adminID`, `title`, `content`, `dateCreated`, `dateModify`, `status`, `formatMetadata`, `pendingDate`) VALUES
(6, 1, 'Be Punctual', 'Respect everyone\'s time. Arrive at the pickup and drop-off points on time to ensure a smooth journey for all.', '2024-12-11', '2024-12-24', 'Pending', '{\"title\":[],\"content\":[]}', NULL),
(7, 1, 'Plan Your Routes', 'Coordinate routes and timings with fellow carpoolers ahead of time to minimize confusion and delays.', '2024-12-11', NULL, 'Publish', '{\"title\":[],\"content\":[]}', NULL),
(8, 1, 'Share Costs Fairly', 'Divide fuel or trip expenses equally among riders. Transparency ensures a hassle-free experience for everyone.', '2024-12-11', NULL, 'Publish', '{\"title\":[],\"content\":[]}', NULL),
(9, 1, 'Respect Privacy & Comfort', 'Be courteous. Avoid loud music, personal conversations, or any behavior that may cause discomfort to others during the ride.', '2024-12-11', NULL, 'Publish', '{\"title\":[],\"content\":[]}', NULL),
(10, 1, 'Safety First', 'Always wear seat belts, obey traffic laws, and ensure the vehicle is in good condition. Safety is everyone\'s responsibility.', '2024-12-11', NULL, 'Publish', '{\"title\":[],\"content\":[]}', NULL),
(11, 1, 'Communication is Key', 'Use the app or agreed platforms to update about delays, cancellations, or changes in plans. Keep everyone informed.', '2024-12-11', NULL, 'Publish', '{\"title\":[],\"content\":[]}', NULL),
(12, 1, 'No Last-Minute Changes', 'Plan your schedule carefully to avoid unexpected cancellations or changes that inconvenience others.', '2024-12-11', NULL, 'Publish', '{\"title\":[],\"content\":[]}', NULL),
(13, 1, 'Keep the Vehicle Clean', 'Drivers and riders should maintain cleanliness in the vehicle. Leave it as you found it or better!', '2024-12-11', '2024-12-13', 'Publish', '{\"title\":[],\"content\":[]}', NULL),
(14, 1, 'Be Flexible', 'Sometimes, plans change. Be patient and work together to adjust schedules or routes if needed.', '2024-12-11', NULL, 'Publish', '{\"title\":[],\"content\":[]}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender_email` varchar(255) NOT NULL,
  `receiver_email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp(),
  `delDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender_email`, `receiver_email`, `message`, `timestamp`, `delDate`) VALUES
(12, 'ypenn39@gmail.com', 'sooyk-jm21@student.tarc.edu.my', 'hi', '2024-12-24 18:36:30', '2025-01-01'),
(13, 'sooyk-jm21@student.tarc.edu.my', 'ypenn39@gmail.com', 'hihi', '2024-12-24 18:36:57', '2025-01-01'),
(14, 'ypenn39@gmail.com', 'sooyk-jm21@student.tarc.edu.my', 'hhh', '2024-12-24 18:37:09', '2025-01-01'),
(15, 'sooyk-jm21@student.tarc.edu.my', 'ypenn39@gmail.com', 'hihihihihihi', '2024-12-24 18:37:19', '2025-01-01'),
(16, 'ypenn39@gmail.com', 'youpenn2003@gmail.com', 'Hi', '2025-01-01 04:58:02', NULL),
(17, 'youpenn2003@gmail.com', 'ypenn39@gmail.com', 'hello', '2025-01-01 04:58:12', NULL),
(18, 'ypenn39@gmail.com', 'youpenn2003@gmail.com', 'How r u', '2025-01-01 04:58:25', NULL),
(19, 'ypenn39@gmail.com', 'youpenn2003@gmail.com', 'Good', '2025-01-01 04:58:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `passengerID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`passengerID`, `userID`, `status`) VALUES
(2, 4, 'banned'),
(3, 3, 'active'),
(4, 2, 'active'),
(6, 1, 'active'),
(7, 6, 'active'),
(22, 7, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentID` int(11) NOT NULL,
  `bookingID` int(11) DEFAULT NULL,
  `passengerConfirmDate` date DEFAULT NULL,
  `driverConfirmDate` date DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentID`, `bookingID`, `passengerConfirmDate`, `driverConfirmDate`, `status`) VALUES
(24, 1, NULL, '2024-12-09', 'pending'),
(25, 2, '2024-12-10', NULL, 'pending'),
(26, 23, NULL, NULL, 'pending'),
(27, 15, NULL, NULL, 'pending'),
(28, 26, NULL, NULL, 'pending'),
(29, 28, NULL, NULL, 'pending'),
(30, 28, NULL, NULL, 'pending'),
(31, 28, NULL, NULL, 'pending'),
(32, 28, NULL, NULL, 'pending'),
(33, 32, '2025-01-02', NULL, 'pending'),
(34, 31, NULL, NULL, 'pending'),
(35, 36, NULL, NULL, 'pending'),
(36, 37, NULL, NULL, 'pending'),
(38, 41, '2025-01-01', '2025-01-01', 'completed'),
(39, 51, NULL, NULL, 'pending'),
(40, 49, NULL, NULL, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `ratingID` int(11) NOT NULL,
  `passengerID` int(11) DEFAULT NULL,
  `tripID` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `star` int(11) DEFAULT NULL CHECK (`star` between 1 and 5),
  `dateSubmitted` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`ratingID`, `passengerID`, `tripID`, `comment`, `star`, `dateSubmitted`) VALUES
(13, 4, 56, '1', 1, '2024-12-06'),
(15, 2, 56, 'qwert', 4, '2024-12-06'),
(19, 3, 53, 'Test4', 4, '2024-12-30'),
(20, 4, 53, 'Test 3', 3, '2024-12-30'),
(21, 4, 50, 'test 5', 5, '2024-12-30'),
(22, 4, 58, 'bad', 2, '2024-12-30'),
(23, 3, 58, 'very bad', 1, '2024-12-30');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `reportID` int(11) NOT NULL,
  `adminID` int(11) DEFAULT NULL,
  `reportName` varchar(100) NOT NULL,
  `data` varchar(255) DEFAULT NULL,
  `generatedDate` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`reportID`, `adminID`, `reportName`, `data`, `generatedDate`) VALUES
(12, 1, 'ICT', '{\"headers\":[\"Pickup Location\",\"Trips\"],\"rows\":[[\"ict carpark\",\"2\"]]}', '2024-12-24'),
(13, 1, 'jementah-Sg', '{\"headers\":[\"Start Location\",\"End Location\",\"Trips\"],\"rows\":[[\"JEMENTAH\",\"SEGAMAT\",\"1\"],[\"JEMENTAH\",\"MUAR\",\"1\"]]}', '2024-12-24'),
(14, 1, 'peterTee', '{\"headers\":[\"Driver\",\"Trips\",\"Rating\"],\"rows\":[[\"Peter Tee\",\"8\",3.5]]}', '2024-12-24'),
(15, 1, 'yk-blacklist', '{\"headers\":[\"Username\",\"Blacklisted Username\",\"Count\"],\"rows\":[[\"SY\",\"Peter Tee\",\"3\"],[\"Student 1\"],[\"Student 1\"],[\"Peter\",\"YK\",\"3\"],[\"SY\"],[\"Peter\"]]}', '2024-12-24'),
(16, 1, 'new blacklist', '{\"headers\":[\"Blacklisted Username\",\"Count\"],\"rows\":[[\"Peter Tee\",\"3\"],[\"YK\",\"2\"]]}', '2024-12-25');

-- --------------------------------------------------------

--
-- Table structure for table `sos`
--

CREATE TABLE `sos` (
  `sosID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `dateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `location` varchar(255) NOT NULL,
  `status` varchar(20) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sos`
--

INSERT INTO `sos` (`sosID`, `userID`, `dateTime`, `location`, `status`) VALUES
(21, 2, '2024-11-07 06:21:41', 'Latitude: 2.53329625, Longitude: 102.39625808333334', 'active'),
(22, 2, '2024-11-07 06:22:40', 'Latitude: 2.53329625, Longitude: 102.39625808333334', 'active'),
(23, 1, '2024-11-07 06:23:20', 'Latitude: 2.53329625, Longitude: 102.39625808333334', 'active'),
(24, 1, '2024-11-07 06:43:43', 'Latitude: 2.5332760999999997, Longitude: 102.39615620000001', 'active'),
(25, 1, '2024-11-07 06:44:13', 'Latitude: 2.5332853571428573, Longitude: 102.39632785714285', 'active'),
(26, 1, '2024-11-07 06:44:38', 'Latitude: 2.5333028333333334, Longitude: 102.3964267222222', 'active'),
(27, 1, '2024-11-07 09:46:33', 'Latitude: 2.5333065, Longitude: 102.3963105', 'active'),
(28, 1, '2024-11-21 12:53:34', 'Latitude: 3.131, Longitude: 101.5514', 'active'),
(29, 1, '2024-11-22 07:06:21', 'Latitude: 2.4615603372903054, Longitude: 102.68811095274539', 'solved'),
(30, 2, '2024-12-24 10:46:34', 'Latitude: 2.4631545, Longitude: 102.8985161', 'active'),
(31, 2, '2024-12-24 10:46:39', 'Latitude: 2.4631545, Longitude: 102.8985161', 'active'),
(32, 2, '2024-12-24 11:57:13', 'Latitude: 3.1499222, Longitude: 101.6944619', 'active'),
(33, 2, '2024-12-24 11:57:46', 'Latitude: 3.1499222, Longitude: 101.6944619', 'active'),
(34, 2, '2024-12-24 11:59:57', 'Latitude: 3.1499222, Longitude: 101.6944619', 'active'),
(35, 2, '2024-12-24 12:04:01', 'Latitude: 2.464501, Longitude: 102.900166', 'active'),
(36, 2, '2024-12-24 12:12:17', 'Latitude: 3.1499222, Longitude: 101.6944619', 'active'),
(37, 1, '2024-12-25 13:03:12', 'Latitude: 2.1528576, Longitude: 102.3475712', 'active'),
(38, 2, '2024-12-25 13:03:55', 'Latitude: 2.5330293, Longitude: 102.3958649', 'active'),
(39, 2, '2024-12-25 13:04:03', 'Latitude: 2.5330293, Longitude: 102.3958649', 'active'),
(40, 1, '2024-12-25 14:09:59', 'Latitude: 2.5330215, Longitude: 102.3958625', 'active'),
(41, 2, '2024-12-31 20:58:57', 'Latitude: 2.4685038, Longitude: 102.8991282', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `trip`
--

CREATE TABLE `trip` (
  `tripID` int(11) NOT NULL,
  `driverID` int(11) DEFAULT NULL,
  `startLocation` varchar(100) NOT NULL,
  `endLocation` varchar(100) NOT NULL,
  `startDateTime` datetime NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `availableSeat` int(11) NOT NULL,
  `pickupLocation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trip`
--

INSERT INTO `trip` (`tripID`, `driverID`, `startLocation`, `endLocation`, `startDateTime`, `status`, `amount`, `availableSeat`, `pickupLocation`) VALUES
(1, 1, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'MUAR', '2023-10-01 09:00:00', 'completed', '15.00', 3, 'ICT Carpark'),
(2, 1, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'JOHOR BAHRU', '2023-09-15 14:00:00', 'canceled', '30.00', 2, 'Block F'),
(3, 1, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'KUALA LUMPUR', '2024-12-31 21:53:00', 'completed', '30.00', 4, 'Carpark behind canteen'),
(9, 1, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'PEKAN NANAS', '2024-12-30 21:53:00', 'completed', '30.00', 5, 'Carpark Site Gate'),
(26, 1, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'JOHOR BAHRU', '2024-12-18 23:14:00', 'canceled', '15.00', 3, 'ICT Carpark'),
(50, 2, 'Muar', 'Tunku Abdul Rahman University of Management and Technology Johor Branch', '2024-12-24 17:45:00', 'completed', '6.00', 3, 'Bus Stop SMK Jementah'),
(51, 2, 'KUALA LUMPUR', 'Tunku Abdul Rahman University of Management and Technology Johor Branch', '2024-12-16 18:00:00', 'completed', '30.00', 3, 'Bus Stop SMK KL'),
(52, 2, 'Muar', 'Tunku Abdul Rahman University of Management and Technology Johor Branch', '2024-12-30 00:16:00', 'completed', '3.00', 4, 'Ho Chak Food Court'),
(53, 1, 'PAGOH', 'Tunku Abdul Rahman University of Management and Technology Johor Branch', '2024-12-29 21:44:00', 'completed', '15.00', 2, 'Bus Stop Sekolah Agama Pekan Pagoh'),
(54, 1, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'SEGAMAT Ho Chak Food Court', '2024-12-22 21:48:00', 'completed', '3.00', 2, 'ICT Carpark'),
(55, 1, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'SEGAMAT Bukit Siput', '2024-12-23 21:48:00', 'completed', '3.00', 2, 'Carpark Site Gate'),
(56, 2, 'Tunku Abdul Rahman University of Management and Technology Johor Branch Campus', 'PAGOH', '2024-12-31 21:53:00', 'completed', '15.00', 2, 'ICT Carpark'),
(57, 2, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'JOHOR BAHRU', '2024-12-30 21:53:00', 'completed', '30.00', 2, 'Carpark Site Gate'),
(58, 2, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'MUAR', '2024-12-22 21:48:00', 'completed', '15.00', 2, 'ICT Carpark'),
(59, 6, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'Segamat Central Shopping Mall', '2024-11-28 06:40:00', 'completed', '6.00', 2, 'Carpark behind canteen'),
(60, 6, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'U Sentral Segamat', '2024-11-28 07:18:00', 'completed', '6.00', 4, 'Carpark Site Gate'),
(61, 2, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'Muar', '2024-12-01 08:06:00', 'completed', '6.00', 4, 'ICT Carpark'),
(62, 1, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'JOHOR BAHRU', '2024-12-25 20:45:00', 'completed', '15.00', 3, 'DSA Carpark'),
(63, 1, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'Muar', '2025-01-11 01:41:00', 'ongoing', '15.00', 5, 'ICT Carpark'),
(64, 1, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'Muar', '2025-01-12 01:41:00', 'ongoing', '15.00', 2, 'ICT Carpark'),
(65, 1, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'Kuala Lumpur', '2025-01-17 01:47:00', 'ongoing', '30.00', 2, 'ICT Carpark'),
(66, 1, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'Kuala Lumpur', '2025-01-18 01:47:00', 'ongoing', '30.00', 2, 'ICT Carpark'),
(67, 1, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'Johor Bahru', '2025-01-20 01:47:00', 'ongoing', '30.00', 2, 'ICT Carpark'),
(68, 1, 'Johor Bahru', 'Tunku Abdul Rahman University of Management and Technology Johor Branch', '2025-01-22 01:47:00', 'ongoing', '30.00', 2, 'ICT Carpark'),
(69, 1, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'Muar', '2025-01-25 01:48:00', 'ongoing', '15.00', 2, 'ICT Carpark'),
(70, 1, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'Muar', '2025-01-27 01:48:00', 'ongoing', '15.00', 2, 'ICT Carpark'),
(71, 1, 'Johor Bahru', 'Tunku Abdul Rahman University of Management and Technology Johor Branch', '2025-01-30 01:51:00', 'ongoing', '15.00', 2, 'ICT Carpark'),
(72, 2, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'Muar', '2025-01-04 04:06:00', 'completed', '9.00', 2, 'ICT Carpark'),
(73, 1, 'Johor Bahru', 'Tunku Abdul Rahman University of Management and Technology Johor Branch', '2025-01-09 02:08:00', 'ongoing', '30.00', 2, 'ICT Carpark'),
(74, 2, 'Johor Bahru', 'Tunku Abdul Rahman University of Management and Technology Johor Branch', '2025-01-03 05:04:00', 'completed', '30.00', 2, 'ICT Carpark'),
(75, 2, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'Johor Bahru', '2025-01-04 05:05:00', 'completed', '30.00', 2, 'ICT Carpark'),
(76, 2, 'Johor Bahru', 'Tunku Abdul Rahman University of Management and Technology Johor Branch', '2025-01-07 05:05:00', 'ongoing', '30.00', 2, 'ICT Carpark'),
(77, 2, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'Kuala Lumpur', '2025-01-08 05:05:00', 'ongoing', '30.00', 2, 'ICT Carpark'),
(78, 2, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'Kuala Lumpur', '2025-01-09 05:06:00', 'ongoing', '30.00', 2, 'ICT Carpark'),
(79, 2, 'Tunku Abdul Rahman University of Management and Technology Johor Branch', 'Ho Chak Food Court', '2025-01-03 05:06:00', 'completed', '3.00', 2, 'ICT Carpark');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `studentID` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `status` varchar(20) DEFAULT 'active',
  `gender` varchar(10) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `login_attempts` int(11) DEFAULT 0,
  `last_attempt` timestamp NULL DEFAULT NULL,
  `unlock_time` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(32) DEFAULT NULL,
  `userImg` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `studentID`, `username`, `email`, `password`, `phoneNumber`, `dateOfBirth`, `status`, `gender`, `otp`, `login_attempts`, `last_attempt`, `unlock_time`, `remember_token`, `userImg`) VALUES
(1, '23JMR08036', 'Test1 Tee', 'youpenn2003@gmail.com', '$2y$10$cDhCTsGkmZK3LyMGWBEOEOmcLocgx14BRVctJuqWbb0DEbTZeE2te', '011-11122223', '2011-11-11', 'active', 'Male', 'SYO54nh5YY26hX2YCtsfI1jO9IQcoozIV/quqzaUf8dvoXxcmFlhCWop2fQm5NkYcE8gkWsbqFA5xO9uevJplA==', 0, NULL, NULL, '7821b05fd5ce8f2acdf6c56a582416a7', '../uploads/1_profile_ezgif.com-crop.gif'),
(2, '23JMR08037', 'Test2 YP', 'ypenn39@gmail.com', '$2y$10$cDhCTsGkmZK3LyMGWBEOEOmcLocgx14BRVctJuqWbb0DEbTZeE2te', '011-10721617', '2003-03-21', 'active', 'Male', NULL, 0, NULL, NULL, '4f08394be12489aee79ba36f0a4e1c53', '../uploads/3_profile_pic1.jpg'),
(3, '23JMR08029', 'Soo Yong Kang', 'sooyk-jm21@student.tarc.edu.my', '$2y$10$cDhCTsGkmZK3LyMGWBEOEOmcLocgx14BRVctJuqWbb0DEbTZeE2te', '019-1111111', '2003-03-26', 'active', 'Female', NULL, 0, NULL, NULL, '733451629d5e31ecffb7596bd196639e', '../uploads/3_profile_pic1.jpg'),
(4, '11AAA11111', 'Student 1', 'test1@gmail.com', '$2y$10$hK3CE0dwXnuIgNKrb4xzpu3XUovxu8wm.rF6KkYE/zebB0l43pze6', '01110721619', '2222-02-03', 'active', 'Female', NULL, 0, NULL, NULL, NULL, NULL),
(6, '23JMR08035', 'Student 2', 'test2@gmail.com', '$2y$10$WQRLF9UIejqzPTjEG/RqNe2CrYP7Rjx6HNcjyKojqpBwrRxztncX6', '011-11122223', '2024-11-13', 'banned', 'Female', NULL, 0, NULL, NULL, NULL, NULL),
(7, '23JMR08036', 'Student 3', 'test3@gmail.com', '$2y$10$1IHmwV96L0JhgOZ5uQWBru6yVPoQPgWJ5nYOujgN4JX53mPwad9sS', NULL, NULL, 'banned', NULL, NULL, 0, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`announcementID`),
  ADD KEY `adminID` (`adminID`);

--
-- Indexes for table `anonymous_report`
--
ALTER TABLE `anonymous_report`
  ADD PRIMARY KEY (`reportingID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`blacklistID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `blacklistedID` (`blacklistedID`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`bookingID`),
  ADD KEY `passengerID` (`passengerID`),
  ADD KEY `tripID` (`tripID`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driverID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedbackID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `guideline`
--
ALTER TABLE `guideline`
  ADD PRIMARY KEY (`guidelineID`),
  ADD KEY `adminID` (`adminID`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`passengerID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentID`),
  ADD KEY `bookingID` (`bookingID`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`ratingID`),
  ADD KEY `passengerID` (`passengerID`),
  ADD KEY `tripID` (`tripID`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`reportID`),
  ADD KEY `adminID` (`adminID`);

--
-- Indexes for table `sos`
--
ALTER TABLE `sos`
  ADD PRIMARY KEY (`sosID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`tripID`),
  ADD KEY `driverID` (`driverID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `announcementID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `anonymous_report`
--
ALTER TABLE `anonymous_report`
  MODIFY `reportingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blacklist`
--
ALTER TABLE `blacklist`
  MODIFY `blacklistID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `bookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driverID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedbackID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `guideline`
--
ALTER TABLE `guideline`
  MODIFY `guidelineID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `passengerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `ratingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `reportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `sos`
--
ALTER TABLE `sos`
  MODIFY `sosID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `trip`
--
ALTER TABLE `trip`
  MODIFY `tripID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcement`
--
ALTER TABLE `announcement`
  ADD CONSTRAINT `announcement_ibfk_1` FOREIGN KEY (`adminID`) REFERENCES `admin` (`adminID`) ON DELETE SET NULL;

--
-- Constraints for table `anonymous_report`
--
ALTER TABLE `anonymous_report`
  ADD CONSTRAINT `anonymous_report_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE SET NULL;

--
-- Constraints for table `blacklist`
--
ALTER TABLE `blacklist`
  ADD CONSTRAINT `blacklist_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  ADD CONSTRAINT `blacklist_ibfk_2` FOREIGN KEY (`blacklistedID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`passengerID`) REFERENCES `passenger` (`passengerID`) ON DELETE SET NULL,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`tripID`) REFERENCES `trip` (`tripID`) ON DELETE CASCADE;

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE SET NULL;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE SET NULL;

--
-- Constraints for table `guideline`
--
ALTER TABLE `guideline`
  ADD CONSTRAINT `guideline_ibfk_1` FOREIGN KEY (`adminID`) REFERENCES `admin` (`adminID`) ON DELETE SET NULL;

--
-- Constraints for table `passenger`
--
ALTER TABLE `passenger`
  ADD CONSTRAINT `passenger_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE SET NULL;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`bookingID`) REFERENCES `booking` (`bookingID`) ON DELETE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`passengerID`) REFERENCES `passenger` (`passengerID`) ON DELETE SET NULL,
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`tripID`) REFERENCES `trip` (`tripID`) ON DELETE CASCADE;

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`adminID`) REFERENCES `admin` (`adminID`) ON DELETE SET NULL;

--
-- Constraints for table `sos`
--
ALTER TABLE `sos`
  ADD CONSTRAINT `sos_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE SET NULL;

--
-- Constraints for table `trip`
--
ALTER TABLE `trip`
  ADD CONSTRAINT `trip_ibfk_1` FOREIGN KEY (`driverID`) REFERENCES `driver` (`driverID`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
