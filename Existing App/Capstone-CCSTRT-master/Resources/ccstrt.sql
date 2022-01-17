-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2019 at 02:35 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ccstrt`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `username` varchar(45) NOT NULL,
  `password` varchar(200) NOT NULL,
  `salt` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_racers`
--

CREATE TABLE `tbl_racers` (
  `plateNum` int(4) NOT NULL,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `sex` varchar(1) NOT NULL,
  `grade` varchar(12) NOT NULL,
  `category` varchar(25) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `postalCode` varchar(50) NOT NULL,
  `phoneNum` varchar(15) NOT NULL,
  `attended` varchar(3) NOT NULL,
  `paid` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_racers`
--

INSERT INTO `tbl_racers` (`plateNum`, `firstName`, `lastName`, `sex`, `grade`, `category`, `address`, `city`, `postalCode`, `phoneNum`, `attended`, `paid`) VALUES
(999, 'Bobby', 'Tables', 'M', '', 'Adult', '999 Somewhere Ave.', 'Dartmouth', 'B9Z9Z9', '1(902)555-5555', 'yes', 'yes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `tbl_racers`
--
ALTER TABLE `tbl_racers`
  ADD PRIMARY KEY (`plateNum`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
