-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 24, 2022 at 03:01 PM
-- Server version: 10.3.29-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `tbl_paypal`
--

CREATE TABLE `tbl_paypal` (
  `price` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_paypal`
--

INSERT INTO `tbl_paypal` (`price`) VALUES
(25);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_racers`
--

CREATE TABLE `tbl_racers` (
  `id` int(11) NOT NULL,
  `type` varchar(11) DEFAULT NULL,
  `belongsTo` int(11) DEFAULT NULL,
  `plateNum` int(4) DEFAULT NULL,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `category` varchar(25) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `postalCode` varchar(50) NOT NULL,
  `phoneNum` varchar(15) NOT NULL,
  `attended` varchar(3) NOT NULL,
  `paid` varchar(3) DEFAULT NULL,
  `attendedCount` int(11) DEFAULT NULL,
  `totalPoints` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_racers`
--

INSERT INTO `tbl_racers` (`id`, `type`, `belongsTo`, `plateNum`, `firstName`, `lastName`, `sex`, `category`, `address`, `city`, `postalCode`, `phoneNum`, `attended`, `paid`, `attendedCount`, `totalPoints`) VALUES
(30, 'Parent', NULL, 981, 'William', 'Redmond', 'Male', 'Grade 2-3', '195 Burnyeat St.', 'Truro', 'B2N 4R1', '9029869389', 'no', 'yes', 3, 11),
(31, 'Child', 30, 982, 'Weston', 'Redmond', 'Male', 'Grade 1-Under', '195 Burnyeat St.', 'Truro', 'B2N 4R1', '9029869389', 'no', 'yes', 3, 16),
(40, 'Parent', NULL, 588, 'Kaydence', 'Burke', 'Female', 'Jr. High', '124 glenabbey drive', 'murray siding', 'B6L 3L2', '9028978850', 'yes', 'yes', 4, 3),
(41, 'Parent', NULL, 64, 'David', 'Richardson', 'Male', 'Adult', '121  Brunswick Street  Apt A', 'Truro   Nova Scotia ', 'B2n2h5 ', '9029562859', 'yes', 'yes', 3, 1),
(42, 'Parent', NULL, 896, 'Liam', 'MacDonald ', 'Male', 'Run-Bike', '1865 Highfield Rd ', 'Doctors Brook ', 'B2G 2L1', '1-780-897-0895', 'no', 'no', 0, 0),
(43, 'Parent', NULL, 26, 'Lucas ', 'Doucet', 'Male', 'Grade 1-Under', '98 MacElmon Road', 'Lower Onslow', 'B0M 1C0', '9028995465', 'yes', 'yes', 4, 15),
(44, 'Parent', NULL, 897, 'Walker', 'Macaulay', 'Male', 'Grade 2-3', '60 Tamarack Drive', 'Valley', 'B6L2V9', '902-956-0441', 'no', 'yes', 1, 0),
(45, 'Parent', NULL, 645, 'Gerry', 'Zwicker', 'Male', 'Adult', '138 Old Court House Branch Rd', 'Valley', 'B6L3Y1', '9029860124', 'no', 'yes', 2, 0),
(49, 'Parent', NULL, 818, 'Evan', 'Sullivan', 'Male', 'Jr. High', '104 Harmony Road', 'Truro', 'B2N 4X8', '902-893-1411', 'no', 'no', 0, 0),
(50, 'Parent', NULL, 752, 'Rejean', 'Comeau', 'Male', 'Adult', '99 retson de', 'bible hill', 'b2n 7a4', '9023058745', 'no', 'yes', 0, 0),
(51, 'Parent', NULL, 862, 'Cameron', 'Zappia', 'Male', 'Run-Bike', '41 highland drive ', 'Truro ', 'B2N 1B8', '5063783400', 'no', 'no', 0, 0),
(52, 'Parent', NULL, 902, 'Fulton', 'Moore', 'Male', 'Run-Bike', '11 Old Mill Road', 'Old Barns', 'B6L 1N6', '902-986-0120', 'no', 'no', 0, 0),
(53, 'Parent', NULL, 749, 'Neela ', 'Stratton', 'Female', 'Run-Bike', '22 Samson Road ', 'Greenfield', 'B6L 4E9', '902-890-3383', 'no', 'no', 0, 0),
(54, 'Parent', NULL, 430, 'Roderick ', 'MacKinnon', 'Male', 'Adult', '60 Mount Pleasant Blvd', 'Truro', 'B2N 3N7', '902-324-2094', 'no', 'no', 0, 0),
(55, 'Child', 54, 903, 'Kerry ', 'Chisholm', 'Female', 'Adult', '60 Mount Pleasant Blvd', 'Truro', 'B2N 3N7', '902-324-2094', 'no', 'no', 0, 0),
(56, 'Parent', NULL, 422, 'Luke', 'Ritcey', 'Male', 'Grade 2-3', '43 Robin Road', 'Valley', 'B6L2S4', '9028994853', 'yes', 'yes', 4, 20),
(57, 'Child', 56, 17, 'Kyle', 'Ritcey', 'Male', 'Grade 1-Under', '43 Robin Road', 'Valley', 'B6L2S4', '9028994853', 'yes', 'yes', 4, 0),
(58, 'Parent', NULL, 581, 'Jillian ', 'Yorke', 'Female', 'Grade 4-6', '148 McLean Street', 'Truro', 'B2N 4W3', '902-890-1874', 'yes', 'yes', 4, 5),
(59, 'Child', 58, 743, 'Emily', 'Yorke', 'Female', 'Grade 1-Under', '148 McLean Street', 'Truro', 'B2N 4W3', '902-890-1874', 'yes', 'yes', 4, 1),
(60, 'Parent', NULL, 803, 'Max', 'Touesnard', 'Male', 'Grade 4-6', '37 Saxonhurst Dr.', 'Bible Hill', 'B6L 4G5', '9028053489', 'yes', 'yes', 4, 0),
(61, 'Child', 60, 802, 'Eric', 'Touesndard', 'Male', 'Grade 2-3', '37 Saxonhurst Dr.', 'Bible Hill', 'B6L 4G5', '9028053489', 'yes', 'yes', 4, 0),
(62, 'Parent', NULL, 905, 'Lydia', 'Hunt', 'Female', 'Grade 2-3', '200 Salmon River Rd', 'Valley', 'B6L2S7', '902-324-1243', 'no', 'no', 0, 0),
(63, 'Child', 62, 906, 'Troy', 'Hunt', 'Male', 'Grade 4-6', '200 Salmon River Rd', 'Valley', 'B6L2S7', '902-324-1243', 'no', 'no', 0, 0),
(64, 'Parent', NULL, 907, 'Eli ', 'Backman', 'Male', 'Run-Bike', '76 Forest Hill Drive', 'Bible Hill', 'B2N 6J9', '902-220-1055', 'no', 'no', 0, 0),
(65, 'Parent', NULL, 789, 'Jewell', 'Burris', 'Female', 'Grade 1-Under', '164 Upham Dr. ', 'Truro', 'B2N0E3 ', '(902)986-8189', 'no', 'no', 0, 0),
(66, 'Child', 65, 598, 'Finn', 'Burris', 'Male', 'Run-Bike', '164 Upham Dr. ', 'Truro', 'B2N0E3 ', '(902)986-8189', 'no', 'no', 0, 0),
(67, 'Parent', NULL, 908, 'Brett', 'Blaauwendraat', 'Female', 'Run-Bike', '228 Princeport Road', 'Princeport ', 'B6L 1P9', '902-890-6923', 'no', 'no', 0, 0),
(68, 'Parent', NULL, 909, 'Rory ', 'MacDonald', 'Male', 'Grade 4-6', '30 Eaton Drive', 'Valley', 'B6L 3J9', '9028902566', 'no', 'no', 0, 0),
(69, 'Child', 68, 397, 'Bree', 'MacDonald', 'Female', 'Grade 2-3', '30 Eaton Drive', 'Valley', 'B6L 3J9', '9028902566', 'no', 'no', 0, 0),
(70, 'Parent', NULL, 62, 'Ezra', 'Maloney', 'Male', 'Grade 1-Under', '10 Birch Bark Rd', 'Millbrook', 'B6L0E1', '9027501007', 'no', 'yes', 1, 0),
(71, 'Parent', NULL, 926, 'PAUL', 'BOUDREAU', 'Male', 'Adult', '12 DAHLIA PLACE', 'TRURO', 'B2N5X3', '902-895-7797', 'no', 'no', 0, 0),
(72, 'Child', 71, 714, 'OWEN', 'BOUDREAU', 'Male', 'Grade 4-6', '12 DAHLIA PLACE', 'TRURO', 'B2N5X3', '902-895-7797', 'no', 'no', 0, 0),
(73, 'Parent', NULL, 849, 'Dash ', 'Bower', 'Male', 'Run-Bike', '64 Bonavista Ave', 'Hilden', 'B0N 1C0', '902-957-2105', 'no', 'no', 0, 0),
(74, 'Child', 73, 850, 'Vintage', 'Bower', 'Female', 'Run-Bike', '64 Bonavista Ave', 'Hilden', 'B0N 1C0', '902-957-2105', 'no', 'no', 0, 0),
(75, 'Parent', NULL, 450, 'Nicholas', 'Sexton', 'Male', 'Grade 1-Under', '103 retson dr', 'Truro', 'B2n7a4', '9028432755', 'no', 'no', 0, 0),
(76, 'Child', 75, 801, 'Owen', 'Sexton', 'Male', 'Grade 4-6', '103 retson dr', 'Truro', 'B2n7a4', '9028432755', 'no', 'no', 0, 0),
(78, 'Parent', NULL, 746, 'Porter', 'Myette', 'Male', 'Grade 4-6', '105 Springwaters Place', 'Valley', 'B6L 2V4', '902-750-0906', 'no', 'no', 0, 0),
(79, 'Parent', NULL, 912, 'Jonah', 'McIntyre', 'Male', 'Grade 4-6', '201 Howe Ave ', 'Fall River ', 'B2T 1H7', '902.221.8621', 'no', 'no', 0, 0),
(80, 'Child', 79, 913, 'Eric', 'McIntyre', 'Male', 'Adult', '201 Howe Ave ', 'Fall River ', 'B2T 1H7', '902.221.8621', 'no', 'no', 0, 0),
(81, 'Parent', NULL, 694, 'Andrew', 'Carter', 'Male', 'Run-Bike', '759 Crowes Mills Rd', 'Belmont', 'B0M1C0', '9029561606', 'no', 'no', 0, 0),
(82, 'Parent', NULL, 914, 'Lachlan', 'Lamont ', 'Male', 'Grade 4-6', '184 Upham Drive ', 'Truro ', 'B2N 0E3', '(902) 890-9582', 'no', 'no', 0, 0),
(83, 'Parent', NULL, 924, 'Ashton', 'Elser', 'Male', 'Grade 2-3', '30 Burris Drive', 'Valley', 'B6L 3B6', '9027547811', 'yes', 'yes', 4, 0),
(84, 'Child', 83, 925, 'Oliver', 'Elser', 'Male', 'Grade 1-Under', '30 Burris Drive', 'Valley', 'B6L 3B6', '9027547811', 'yes', 'yes', 4, 0),
(85, 'Parent', NULL, 755, 'Tate', 'Nelson', 'Male', 'Grade 2-3', '508 Hwy 236', 'Green Oaks', 'B6L 1H8', '9028991155', 'no', 'no', 0, 0),
(86, 'Child', 85, 756, 'Kase', 'Nelson', 'Male', 'Grade 1-Under', '508 Hwy 236', 'Green Oaks', 'B6L 1H8', '9028991155', 'no', 'no', 0, 0),
(87, 'Parent', NULL, 620, 'Ellie', 'Tully', 'Female', 'Grade 4-6', '39 Douglas Street', 'TRURO', 'B2N 2E8', '9028994501', 'no', 'no', 0, 0),
(88, 'Parent', NULL, 915, 'Mitchell', 'Mason', 'Male', 'Jr. High', '56 Retson Drive', 'Bible Hill', 'B2N 6H4', '9028974608', 'no', 'no', 0, 0),
(89, 'Parent', NULL, 990, 'Rylee', 'Macleod', 'Male', 'Grade 4-6', '115 Fern dr', 'Truro', 'B2N6Y7', '9029572651', 'yes', 'yes', 4, 0),
(90, 'Child', 89, 991, 'Wyatt', 'Macleod', 'Male', 'Grade 1-Under', '115 Fern dr', 'Truro', 'B2N6Y7', '9029572651', 'yes', 'yes', 4, 12),
(91, 'Parent', NULL, 774, 'Erica', 'Gordon', 'Female', 'Grade 2-3', '300 king street', 'Truro', 'B2N 3l6', '9029560470', 'no', 'no', 0, 0),
(92, 'Child', 91, 773, 'Isaac', 'Gordon', 'Male', 'Grade 1-Under', '300 king street', 'Truro', 'B2N 3l6', '9029560470', 'no', 'no', 0, 0),
(93, 'Child', 91, 916, 'Maya', 'Gordon', 'Female', 'Run-Bike', '300 king street', 'Truro', 'B2N 3l6', '9029560470', 'no', 'no', 0, 0),
(94, 'Parent', NULL, 705, 'Millie', 'Medaglia ', 'Female', 'Grade 2-3', 'Pobox 327', 'Brookfield ', 'B0N1C0 ', '9028993220', 'yes', 'yes', 3, 24),
(95, 'Child', 94, 105, 'Talon', 'Medaglia ', 'Male', 'Grade 4-6', 'Pobox 327', 'Brookfield ', 'B0N1C0 ', '9028993220', 'yes', 'yes', 4, 23),
(96, 'Child', 94, 704, 'Poppy', 'Medaglia', 'Female', 'Run-Bike', 'Pobox 327', 'Brookfield ', 'B0N1C0 ', '9028993220', 'yes', 'yes', 4, 25),
(97, 'Child', 94, 703, 'Tyler', 'Medaglia ', 'Male', 'Adult', 'Pobox 327', 'Brookfield ', 'B0N1C0 ', '9028993220', 'no', 'yes', 0, 0),
(98, 'Parent', NULL, 864, 'Cole', 'Gorman', 'Male', 'Run-Bike', '67 Patricia Ave ', 'Onslow Mountain', 'B6L 6R9', '9029572255', 'no', 'no', 0, 0),
(99, 'Parent', NULL, 70, 'Adley', 'Shearer', 'Female', 'Grade 1-Under', '2681 Hwy 311', 'Upper North River', 'B6L 6J6', '902-899-6788', 'yes', 'yes', 4, 13),
(100, 'Parent', NULL, 574, 'Bruce', 'Roberts', 'Male', 'Adult', '33 Inglis Place', 'Truro', 'B2N 4B5', '9028972482', 'yes', 'yes', 4, 16),
(101, 'Parent', NULL, 554, 'Owen', 'MacLean', 'Male', 'Grade 1-Under', '67 Russell Cross Rd.', 'Hilden', 'B0N1C0', '902-843-2860', 'no', 'no', 0, 0),
(102, 'Child', 101, 556, 'Mairi', 'MacLean', 'Female', 'Grade 1-Under', '67 Russell Cross Rd.', 'Hilden', 'B0N1C0', '902-843-2860', 'no', 'no', 0, 0),
(103, 'Child', 101, 930, 'Sybil', 'MacLean', 'Female', 'Run-Bike', '67 Russell Cross Rd.', 'Hilden', 'B0N1C0', '902-843-2860', 'no', 'no', 0, 0),
(104, 'Parent', NULL, 931, 'Kyle', 'Sinton', 'Male', 'Jr. High', ' 32 James St ', 'Truro', 'B2N 3A1', '', 'no', 'no', 0, 0),
(105, 'Parent', NULL, 287, 'Janelle', 'Cumming', 'Female', 'Grade 1-Under', '71 Roosevelt Ave.', 'Truro', 'B2N 1B7', '902-843-0952', 'no', 'yes', 3, 18),
(107, 'Parent', NULL, 35, 'Hayden', 'Leopold', 'Female', 'Grade 1-Under', '166 Brunswick St', 'Truro', 'B2n2h8', '19029570263', 'yes', 'yes', 4, 0),
(108, 'Parent', NULL, 892, 'robbie', 'Macgregor', 'Male', 'Adult', '1264 salmon river road', 'salmon river', 'b6l4e2', '9029574330', 'no', 'no', 0, 0),
(111, 'Parent', NULL, 639, 'Jack', 'MacKinnon', 'Male', 'Grade 2-3', '110, Young St', 'Truro', 'B2N3X1', '9029862225', 'no', 'no', 0, 0),
(112, 'Child', 111, 813, 'Jeff', 'MacKinnon', 'Male', 'Adult', '110, Young St', 'Truro', 'B2N3X1', '9029862225', 'no', 'no', 0, 0),
(113, 'Parent', NULL, 867, 'Henry', 'Elliott', 'Male', 'Run-Bike', '406 Onslow Rd', 'Upper Onslow', 'B6L 5K9', '9027500558', 'no', 'no', 0, 0),
(114, 'Parent', NULL, 46, 'Kate', 'Ward', 'Female', 'Grade 1-Under', '133 Onslow Road', 'Upper Onslow', 'B6L 5K8', '9023053185', 'no', 'no', 1, 0),
(115, 'Parent', NULL, 9, 'Marcus', 'McCully', 'Male', 'Grade 4-6', '39 Crystal Lake Dr', 'Brookfield', 'B0N1C0', '902-324-2426', 'yes', 'yes', 4, 7),
(116, 'Child', 115, 509, 'Mac', 'Kierstead', 'Male', 'Jr. High', '39 Crystal Lake Dr', 'Brookfield', 'B0N1C0', '902-324-242)', 'yes', 'yes', 4, 6),
(117, 'Child', 115, 508, 'Jake', 'Kierstead', 'Male', 'Grade 4-6', '39 Crystal Lake Dr', 'Brookfield', 'B0N1C0', '902-324-242)', 'yes', 'yes', 4, 10),
(118, 'Parent', NULL, 550, 'Henry', 'Jamieson', 'Male', 'Grade 2-3', '401 Highway 289', 'Brookfield', 'B0N1C0', '9026732707', 'no', 'no', 0, 0),
(119, 'Parent', NULL, 932, 'Randal ', 'Gray ', 'Male', 'Adult', '1289 route 6', 'River John ', 'B0k1n0', '902 229 7073 ', 'no', 'no', 0, 0),
(120, 'Parent', NULL, 933, 'Gabe', 'Gates-Manuel', 'Male', 'Grade 1-Under', '132 Pleasant St', 'Truro', 'B2N3S4', '9028900783', 'no', 'no', 0, 0),
(121, 'Child', 120, 934, 'Sam', 'Gates-Manuel', 'Male', 'Run-Bike', '132 Pleasant St', 'Truro', 'B2N3S4', '9028900783', 'no', 'no', 0, 0),
(122, 'Parent', NULL, 240, 'Jesse', 'Cameron', 'Male', 'Adult', '72 Fairview Drive', 'Truro', 'B2N1S4', '9028955859', 'no', 'no', 0, 0),
(123, 'Parent', NULL, 979, 'Ella', 'Gorman', 'Female', 'Grade 1-Under', '1808  Onslow Mountain Road', 'North River', 'B6L 6P5', '902-986-3678', 'yes', 'yes', 4, 6),
(124, 'Child', 123, 935, 'Dana', 'Gorman', 'Male', 'Adult', '1808  Onslow Mountain Road', 'North River', 'B6L 6P5', '902-986-3678', 'no', 'yes', 0, 0),
(125, 'Parent', NULL, 936, 'Rory', 'Clark', 'Male', 'Grade 2-3', '68 Lexington Drive', 'Valley', 'B6L 3T7', '902-940-7590', 'no', 'no', 0, 0),
(126, 'Parent', NULL, 782, 'Greg', 'Barr', 'Male', 'Adult', '47 Blakewood Lane', 'East Stewiacke', 'B0N2J0 ', '9027585272', 'no', 'no', 0, 0),
(127, 'Parent', NULL, 937, 'Carter', 'Robertson', 'Male', 'Grade 4-6', '95 Smith Avenue', 'Truro', 'B2N 1C6', '9028148383', 'no', 'no', 0, 0),
(128, 'Child', 127, 938, 'Emmett', 'Robertson', 'Male', 'Grade 2-3', '95 Smith Avenue', 'Truro', 'B2N 1C6', '9028148383', 'no', 'no', 0, 0),
(129, 'Child', 127, 939, 'James', 'Robertson', 'Male', 'Grade 1-Under', '95 Smith Avenue', 'Truro', 'B2N 1C6', '9028148383', 'no', 'no', 0, 0),
(130, 'Child', 127, 940, 'Lily', 'Robertson', 'Female', 'Run-Bike', '95 Smith Avenue', 'Truro', 'B2N 1C6', '9028148383', 'no', 'no', 0, 0),
(132, 'Parent', NULL, 996, 'Maebea', 'Taylor', 'Female', 'Grade 1-Under', '256 Marney Road', 'Hilden', 'B0N 1C0', '9029572724', 'yes', 'yes', 4, 14),
(133, 'Parent', NULL, 186, 'Cohen', 'MacNeil', 'Male', 'Jr. High', '186 Fairway Ave', 'Shubenacadie East', 'B0N2H0', '902-751-0899', 'yes', 'yes', 4, 4),
(134, 'Parent', NULL, 294, 'Rylan ', 'Sutherland', 'Male', 'Grade 4-6', '615 Carter Road ', 'Brookfield ', 'B0N1C0 ', '9029862832', 'no', 'no', 0, 0),
(135, 'Child', 134, 795, 'Meah', 'Sutherland', 'Female', 'Grade 1-Under', '615 Carter Road ', 'Brookfield ', 'B0N1C0 ', '9029862832', 'no', 'no', 0, 0),
(136, 'Parent', NULL, 706, 'Brett', 'Doiron', 'Male', 'Adult', '40 Pleasant Hill, Stewiacke, Stewiacke', 'Stewiacke', 'B0N2J0', '9028901833', 'no', 'yes', 0, 0),
(137, 'Child', 136, 108, 'Lain', 'Doiron', 'Male', 'Adult', '40 Pleasant Hill, Stewiacke, Stewiacke', 'Stewiacke', 'B0N2J0', '9028901833', 'yes', 'yes', 4, 0),
(138, 'Child', 136, 538, 'Tucker', 'Doiron', 'Male', 'Jr. High', '40 Pleasant Hill, Stewiacke, Stewiacke', 'Stewiacke', 'B0N2J0', '9028901833', 'yes', 'yes', 4, 3),
(139, 'Parent', NULL, 942, 'Jaxon', 'Leil', 'Male', 'Grade 1-Under', '1465 Pleasant Valley Rd', 'Brookfield', 'B0N1C0', '19029863600', 'no', 'no', 0, 0),
(140, 'Parent', NULL, 943, 'Keeley', 'Shipley', 'Female', 'Adult', '784 Sylvester Road', 'Durham', 'B0K 2A0', '902-759-8666', 'no', 'no', 0, 0),
(141, 'Parent', NULL, 814, 'Alex', 'Douglas', 'Male', 'Grade 4-6', '940 SOUTHSIDE ROAD', 'UPPER STEWIACKE', 'B0N 2P0', '9023941657', 'no', 'no', 0, 0),
(142, 'Child', 141, 815, 'Jordan ', 'Douglas', 'Male', 'Grade 4-6', '940 SOUTHSIDE ROAD', 'UPPER STEWIACKE', 'B0N 2P0', '9023941657', 'no', 'no', 0, 0),
(143, 'Parent', NULL, 877, 'Ethan ', 'Young', 'Male', 'Grade 4-6', '139 Masstown Rd ', 'Debert', 'B0M1G0', '9029572715', 'no', 'no', 0, 0),
(144, 'Child', 143, 944, 'Daniel', 'Melanson', 'Male', 'Adult', '139 Masstown Rd ', 'Debert', 'B0M1G0', '9029572715', 'no', 'no', 0, 0),
(145, 'Parent', NULL, 277, 'Belle', 'Henderson', 'Female', 'Adult', '44 Longworth Ave', 'Truro', 'B2N 3E8', '902 890 1098', 'no', 'no', 0, 0),
(146, 'Parent', NULL, 584, 'Drew', 'Richard', 'Male', 'Adult', '210 old court house branch road ', 'Truro ', 'B6l3x4', '9029867424', 'yes', 'yes', 4, 10),
(147, 'Parent', NULL, 437, 'Melka', 'Foster', 'Male', 'Grade 2-3', '13 Belgrave Terrace', 'Truro', 'B2N 2G3', '9028436085', 'no', 'no', 0, 0),
(148, 'Parent', NULL, 945, 'Daniel', 'Harrington', 'Male', 'Adult', '12 Birchdale ave', 'Dartmouth', 'B2X1E5', '9028148840', 'no', 'no', 0, 0),
(149, 'Parent', NULL, 23, 'Llewellyn', 'Purves-Smith', 'Male', 'Grade 1-Under', '150 George Weatherby Rd', 'Debert', 'B0M1G0', '902-324-2171', 'yes', 'yes', 4, 0),
(150, 'Parent', NULL, 828, 'Rylie', 'Pinkney', 'Female', 'Run-Bike', '50 Whitman Court', 'Truro', 'B2N 3G3', '902-324-2212', 'no', 'no', 0, 0),
(151, 'Parent', NULL, 845, 'Emmett ', 'Bonnell', 'Male', 'Run-Bike', '93 Dorset drive', 'Bible hill ', 'B6l 3h9', '9029864165', 'no', 'no', 0, 0),
(152, 'Child', 151, 946, 'Norah ', 'Bonnell', 'Female', 'Run-Bike', '93 Dorset drive', 'Bible hill ', 'B6l 3h9', '9029864165', 'no', 'no', 0, 0),
(153, 'Parent', NULL, 947, 'Arlo', 'Blois', 'Male', 'Grade 2-3', '3214 hwy 236', 'Old barns', 'B6L1K4', '9029569564', 'no', 'no', 0, 0),
(154, 'Child', 153, 948, 'Isaac', 'Blois', 'Male', 'Grade 4-6', '3214 hwy 236', 'Old barns', 'B6L1K4', '9029569564', 'no', 'no', 0, 0),
(155, 'Parent', NULL, 747, 'Bruce', 'MacPherson', 'Male', 'Adult', '70 Edgehill Drive', 'Valley', 'B6L 3K3', '9028926160', 'no', 'no', 0, 0),
(156, 'Child', 155, 748, 'Kim', 'MacDonald', 'Female', 'Adult', '70 Edgehill Drive', 'Valley', 'B6L 3K3', '9028926160', 'no', 'no', 0, 0),
(157, 'Child', 155, 863, 'Spencer', 'MacDonald', 'Male', 'Jr. High', '70 Edgehill Drive', 'Valley', 'B6L 3K3', '9028926160', 'no', 'no', 0, 0),
(158, 'Parent', NULL, 949, 'Samantha', 'MacCallum', 'Female', 'Jr. High', '91 Hidden Valley Drive', 'Valley', 'B6L3R7', '9029573577', 'no', 'no', 0, 0),
(159, 'Child', 158, 950, 'Alexa', 'MacCallum', 'Female', 'Grade 2-3', '91 Hidden Valley Drive', 'Valley', 'B6L3R7', '9029573577', 'no', 'no', 0, 0),
(160, 'Parent', NULL, 874, 'Rory', 'Albert', 'Male', 'Run-Bike', '19 Centennial Dr.', 'Truro', 'B2N 2L3', '902-324-2449', 'no', 'no', 0, 0),
(161, 'Parent', NULL, 951, 'Aidan ', 'Hahn', 'Male', 'Adult', '4795 River John Road', 'Pictou', 'B0K1H0', '902-616-1072', 'no', 'no', 0, 0),
(162, 'Child', 161, 952, 'Natasha', 'Hahn', 'Female', 'Jr. High', '4795 River John Road', 'Pictou', 'B0K1H0', '902-616-1072', 'no', 'no', 0, 0),
(163, 'Parent', NULL, 871, 'Noah', 'MacDonald', 'Male', 'Grade 2-3', '155 Lakeshore Rd ', 'Brookfield', 'B0N 1C0', '9029568799', 'no', 'no', 0, 0),
(164, 'Parent', NULL, 106, 'Alder', 'Hill', 'Male', 'Grade 1-Under', '44 Crystal Lake Drive', 'Brookfield', 'B0N 1C0', '902-650-2771', 'no', 'yes', 1, 2),
(165, 'Parent', NULL, 593, 'Parker ', 'Davison', 'Male', 'Grade 4-6', '31 Shannon Drive', 'Truro ', 'b2n 3v5', '8142228', 'no', 'no', 0, 0),
(166, 'Child', 165, 595, 'Shawn', 'Davison', 'Male', 'Adult', '31 Shannon Drive', 'Truro ', 'b2n 3v5', '8142228', 'no', 'no', 0, 0),
(167, 'Parent', NULL, 678, 'David ', 'Arenburg', 'Male', 'Grade 4-6', '100 Old Pictou Road ', 'Valley ', 'B6L 2M2', '902 8977880', 'no', 'no', 0, 0),
(168, 'Child', 167, 679, 'Murray ', 'Arenburg', 'Male', 'Grade 2-3', '100 Old Pictou Road ', 'Valley ', 'B6L 2M2', '902 8977880', 'no', 'no', 0, 0),
(169, 'Child', 167, 878, 'Anne Margaret ', 'Arenburg', 'Female', 'Grade 1-Under', '100 Old Pictou Road ', 'Valley ', 'B6L 2M2', '902 8977880', 'no', 'no', 0, 0),
(170, 'Child', 167, 685, 'Mabel ', 'Arenburg', 'Female', 'Run-Bike', '100 Old Pictou Road ', 'Valley ', 'B6L 2M2', '902 8977880', 'no', 'no', 0, 0),
(171, 'Parent', NULL, 658, 'Zac', 'Boone', 'Male', 'Grade 1-Under', '7 Coburg Crescent', 'Truro', 'B2N 7J5', '9028431182', 'no', 'no', 0, 0),
(172, 'Child', 171, 659, 'Sam', 'Boone', 'Male', 'Grade 1-Under', '7 Coburg Crescent', 'Truro', 'B2N 7J5', '9028431182', 'no', 'no', 0, 0),
(173, 'Parent', NULL, 954, 'Alexander', 'Smith', 'Male', 'Grade 4-6', '52 Tamarack ', 'Valley ', 'B6L 2V9', '9022972481', 'no', 'no', 0, 0),
(174, 'Parent', NULL, 955, 'Kaden', 'Cormier', 'Male', 'Jr. High', '776 prince street', 'Truro', 'B2N1G9', '902-957-2245', 'no', 'no', 2, 0),
(175, 'Child', 174, 841, 'Kaden', 'Cormier', 'Male', 'Grade 4-6', '776 prince street', 'Truro', 'B2N1G9', '902-957-2245', 'no', 'no', 0, 0),
(176, 'Child', 171, 615, 'Ethan', 'Boone', 'Male', 'Grade 4-6', '7 Coburg Crescent', 'Truro', 'B2N7J5', '9028431182', 'no', 'no', 0, 0),
(177, 'Parent', NULL, 868, 'Kalen', 'Watson ', 'Male', 'Jr. High', '46 Bigney Avenue', 'Bible Hill', 'B2N4L9 ', '9029863755', 'no', 'no', 0, 0),
(178, 'Child', 177, 869, 'Kole ', 'Watson', 'Male', 'Grade 4-6', '46 Bigney Avenue', 'Bible Hill', 'B2N4L9 ', '9029863755', 'no', 'no', 0, 0),
(179, 'Parent', NULL, 975, 'David', 'Beaver', 'Male', 'Adult', '33 elmbel', 'Elmsdale', 'B2s2m4', '+19024780269', 'no', 'no', 0, 0),
(180, 'Parent', NULL, 766, 'Maclean', 'Baillie', 'Male', 'Grade 2-3', '42 Eaton Drive', 'Valley', 'B6L3J9', '902-892-2117', 'no', 'no', 0, 0),
(181, 'Child', 180, 765, 'Owen', 'Baillie', 'Male', 'Grade 1-Under', '42 Eaton Drive', 'Valley', 'B6L3J9', '902-892-2117', 'no', 'no', 0, 0),
(182, 'Parent', NULL, 527, 'Amelia', 'Goulet', 'Female', 'Adult', '172 South Branch Road', 'Middle Stewiacke', 'B0N1C0', '9029770108', 'no', 'no', 0, 0),
(183, 'Parent', NULL, 957, 'Jeffrey', 'Rau', 'Male', 'Grade 2-3', '121 hidden valley drive', 'Valley', 'B6l 3r8', '9023054791', 'no', 'no', 0, 0),
(184, 'Parent', NULL, 434, 'Noah', 'Benvie', 'Male', 'Jr. High', '2712 , Riverside', 'Brookfield', 'B0N 1C0', '9028990046', 'no', 'no', 0, 0),
(185, 'Child', 184, 614, 'Isaac', 'Benvie', 'Male', 'Adult', '2712 , Riverside', 'Brookfield', 'B0N 1C0', '9028990046', 'no', 'no', 0, 0),
(186, 'Parent', NULL, 901, 'Joshua', 'Bateman', 'Male', 'Adult', '1005 Pleasant Valley Road', 'Brookfield', 'B0N1C0', '902-397-2453', 'no', 'no', 0, 0),
(187, 'Parent', NULL, 20, 'Peaka ', 'Simms ', 'Female', 'Grade 4-6', 'Truro ', 'Truro ', 'B2n1k6 ', '902956-2474', 'no', 'yes', 2, 6),
(188, 'Child', 187, 21, 'Max', 'Simms ', 'Male', 'Grade 2-3', 'Truro ', 'Truro ', 'B2n1k6 ', '902956-2474', 'no', 'yes', 3, 7),
(189, 'Parent', NULL, 689, 'Jack', 'White', 'Male', 'Grade 4-6', '20 little brook road', 'Hilden', 'B0N 1C0', '902-759-6733', 'no', 'no', 0, 0),
(190, 'Child', 189, 745, 'Matt', 'White', 'Male', 'Adult', '20 little brook road', 'Hilden', 'B0N 1C0', '902-759-6733', 'no', 'no', 0, 0),
(191, 'Parent', NULL, 693, 'Leo', 'Gordon', 'Male', 'Run-Bike', '99 Charmac Rd', 'Greenfield', 'B6L 3E3', '902-956-1888', 'no', 'no', 0, 0),
(192, 'Parent', NULL, 958, 'Mike', 'Hanes', 'Male', 'Adult', '30 Hampstead Ct. ', 'Truro', 'B2n 3e6', '9028906143', 'no', 'no', 0, 0),
(193, 'Parent', NULL, 835, 'Malcolm', 'Farris', 'Male', 'Jr. High', '1402 North Salem Rd', 'Shubenacadie ', 'B0N 2H0', '9024883460', 'no', 'no', 0, 0),
(194, 'Child', 193, 959, 'Bella', 'Farris', 'Female', 'Grade 4-6', '1402 North Salem Rd', 'Shubenacadie ', 'B0N 2H0', '9024883460', 'no', 'no', 0, 0),
(195, 'Child', 193, 837, 'Ryan', 'Farris', 'Male', 'Adult', '1402 North Salem Rd', 'Shubenacadie ', 'B0N 2H0', '9024883460', 'no', 'no', 0, 0),
(196, 'Parent', NULL, 960, 'Dan', 'MacLean', 'Male', 'Grade 4-6', '26 Hillcrest Street', 'Truro ', 'B2N3M3 ', '9028993849', 'no', 'no', 0, 0),
(197, 'Parent', NULL, 833, 'Abel', 'MacDonald', 'Male', 'Run-Bike', '55 Edgehill Dr ', 'Valley ', 'B6L3K4', '9023013527', 'no', 'no', 0, 0),
(198, 'Parent', NULL, 73, 'Lauchlin', 'Dorey', 'Male', 'Grade 4-6', '881 Wittenburg rd.', 'Wittenburg ', 'b0n2j0', '902-639-1260', 'yes', 'yes', 4, 9),
(199, 'Parent', NULL, 961, 'Parker ', 'Clyke ', 'Male', 'Grade 1-Under', '143 Ryland Ave unit 12', 'Bible hill ', 'B2n6l4', '9028905845', 'no', 'no', 0, 0),
(200, 'Parent', NULL, 453, 'Matthew ', 'Coulter ', 'Male', 'Adult', '9 Yorke st ', 'Truro ', 'B2N2N1 ', '9029576141', 'no', 'no', 0, 0),
(201, 'Parent', NULL, 962, 'Carrie', 'MacLaughlin', 'Female', 'Grade 4-6', '100 Lexington dr', 'Valley', 'B6L 3T7', '902-986-0477', 'no', 'no', 0, 0),
(202, 'Parent', NULL, 963, 'Austin', 'MacKenzie', 'Male', 'Adult', '295 college rd apt 4', 'Truro', 'B2N2P6 ', '19029866024', 'no', 'no', 0, 0),
(203, 'Parent', NULL, 964, 'Cooper ', 'Croft', 'Male', 'Grade 4-6', '34 clifton court', 'Truro', 'B2N 6H7', '902-324-2731', 'no', 'no', 0, 0),
(204, 'Child', 203, 965, 'Owen', 'Croft', 'Male', 'Grade 4-6', '34 clifton court', 'Truro', 'B2N 6H7', '902-324-2731', 'no', 'no', 0, 0),
(205, 'Child', 203, 966, 'Cash ', 'Croft', 'Male', 'Grade 1-Under', '34 clifton court', 'Truro', 'B2N 6H7', '902-324-2731', 'no', 'no', 0, 0),
(206, 'Parent', NULL, 967, 'Theo', 'Fields', 'Male', 'Run-Bike', '158 kaulback st', 'TRURO', 'B2n3m6', '+1 09029570634', 'no', 'no', 0, 0),
(207, 'Parent', NULL, 968, 'Richard', 'Faber', 'Male', 'Adult', '340 lower Truro rd.  Apartment 12', 'Truro', 'B2N 1B1', '19023242149', 'no', 'no', 0, 0),
(208, 'Parent', NULL, 764, 'Gavin', 'Pratt', 'Male', 'Grade 2-3', '446 West North River Rd', 'North River', 'B6L 6X6', '902-957-0505', 'no', 'no', 0, 0),
(209, 'Child', 208, 763, 'Kyle', 'Pratt', 'Male', 'Grade 4-6', '446 West North River Rd', 'North River', 'B6L 6X6', '902-957-0505', 'no', 'no', 0, 0),
(210, 'Parent', NULL, 786, 'Gwen', 'Peterson', 'Female', 'Grade 1-Under', '1607 Highway 289', 'Brookfield', 'B0N1C0', '9028998986', 'no', 'no', 0, 0),
(211, 'Child', 210, 787, 'Brady', 'Peterson', 'Male', 'Run-Bike', '1607 Highway 289', 'Brookfield', 'B0N1C0', '9028998986', 'no', 'no', 0, 0),
(212, 'Parent', NULL, 969, 'Elliot', 'Parker', 'Male', 'Grade 2-3', '216 Upham Dr ', 'Truro', 'B2N0E3', '9028970737', 'no', 'no', 0, 0),
(213, 'Child', 212, 970, 'Oliver', 'Parker', 'Male', 'Grade 1-Under', '216 Upham Dr ', 'Truro', 'B2N0E3', '9028970737', 'no', 'no', 0, 0),
(214, 'Parent', NULL, 792, 'Vander', 'Nettleton', 'Male', 'Grade 2-3', '13 Coburg Crea', 'Truro', 'B2N7J5', '9024889057', 'no', 'no', 0, 0),
(215, 'Child', 214, 793, 'Xavier ', 'Nettleton', 'Male', 'Grade 2-3', '13 Coburg Crea', 'Truro', 'B2N7J5', '9024889057', 'no', 'no', 0, 0),
(216, 'Parent', NULL, 971, 'Silas', 'MacKinnon', 'Male', 'Run-Bike', '27 Cambey Ave PO Box 1551', 'Stellarton NS', 'B0K1S0 ', '902-301-0374', 'no', 'no', 0, 0),
(217, 'Parent', NULL, 976, 'Roman', 'Martynenko', 'Male', 'Grade 1-Under', '116 Burnyeat st', 'Truro', 'B2N 4R1', '902 895 8693', 'no', 'no', 0, 0),
(218, 'Parent', NULL, 543, 'Jamie', 'Dillman', 'Male', 'Adult', '4 schirraclose', 'Truro', 'B2n5x8', '902-956-2635', 'no', 'no', 0, 0),
(219, 'Parent', NULL, 489, 'Logan', 'Sampson', 'Male', 'Grade 1-Under', '379 , Pictou Rd', 'Truro', 'B2N2T6', '9029865869', 'no', 'no', 0, 0),
(220, 'Parent', NULL, 972, 'Félix', 'Sonier', 'Male', 'Grade 1-Under', '148 St Nicholas Rd', 'Miscouche', 'C0B1T0', '(902) 303-0252', 'no', 'yes', 1, 5),
(221, 'Parent', NULL, 977, 'Chris', 'O’Connell', 'Male', 'Adult', '2371 old Guysborough road ', 'Goffs', 'B2t 1B9, ', '902 456 1332', 'no', 'no', 0, 0),
(222, 'Parent', NULL, 406, 'Rowan', 'Durning ', 'Male', 'Adult', '56 Spencer point rd', 'Great Village', 'B0M 1L0', '9028909901', 'no', 'yes', 2, 2),
(223, 'Child', 222, 405, 'Ryker', 'Durning', 'Male', 'Jr. High', '56 Spencer point rd', 'Great Village', 'B0M 1L0', '9028909901', 'yes', 'yes', 4, 13),
(224, 'Child', 222, 670, 'Rylie', 'Durning', 'Female', 'Grade 4-6', '56 Spencer point rd', 'Great Village', 'B0M 1L0', '9028909901', 'yes', 'yes', 4, 13),
(225, 'Parent', NULL, 59, 'Michael', 'Irving', 'Male', 'Jr. High', '101 Aspen street', 'Stellarton', 'B0k 1s0', '9023016377', 'yes', 'yes', 3, 2),
(226, 'Parent', NULL, 77, 'Xavier', 'Morris', 'Male', 'Jr. High', '12 chestnut ct', 'Truro', 'B2n5r8', '9028140990', 'yes', 'yes', 4, 14),
(227, 'Child', 226, 78, 'Montgomery', 'Morris', 'Male', 'Grade 4-6', '12 chestnut ct', 'Truro', 'B2n5r8', '9028140990', 'yes', 'yes', 4, 16),
(228, 'Parent', NULL, 41, 'Theodore ', 'Keddy', 'Male', 'Run-Bike', '45 Armstrong Avenue ', 'Bible Hill ', 'B2N4N1', '9029577224', 'yes', 'yes', 4, 0),
(229, 'Child', 228, 42, 'Vincent', 'Keddy', 'Male', 'Run-Bike', '45 Armstrong Avenue ', 'Bible Hill ', 'B2N4N1', '9029577224', 'yes', 'yes', 4, 0),
(230, 'Parent', NULL, 1, 'William', 'Huybers', 'Male', 'Run-Bike', '11 Evergreen Drive', 'Salmon River', 'B2N 5J2', '902-986-2411', 'no', 'yes', 3, 1),
(231, 'Parent', NULL, 34, 'Nolan', 'Schooten', 'Male', 'Run-Bike', '80 Ryland Avenue Apt B', 'Biblehill', 'B2n2v4', '9029577497', 'no', 'yes', 3, 0),
(232, 'Parent', NULL, 54, 'Joshua', 'Mikail', 'Male', 'Grade 1-Under', '258 Lesley street ', 'Hilden', 'B0n1c0', '6138506589', 'no', 'yes', 3, 4),
(233, 'Child', 232, 47, 'Quinn', 'Mikail', 'Female', 'Run-Bike', '258 Lesley street ', 'Hilden', 'B0n1c0', '6138506589', 'no', 'yes', 3, 0),
(234, 'Parent', NULL, 83, 'Mav', 'McCarthy', 'Male', 'Run-Bike', '740 shore road', 'Masstown', 'B0m1g0 ', '9023012450', 'yes', 'yes', 3, 8),
(235, 'Parent', NULL, 29, 'Max', 'Beazley', 'Male', 'Grade 2-3', '5 Brighton Way', 'Truro', 'B2N0E1 ', '902-890-0513 ', 'yes', 'yes', 4, 7),
(236, 'Parent', NULL, 987, 'Jonah', 'Matthews', 'Male', 'Grade 2-3', '115 Macdonald Street', 'Truro', 'B2N 1T8', '9029571188', 'yes', 'yes', 4, 0),
(237, 'Parent', NULL, 989, 'Bo', 'Neaves', 'Male', 'Grade 1-Under', '4808 HWY 316', 'Lower South River', 'B2G2L4', '9023180365', 'yes', 'yes', 4, 0),
(238, 'Parent', NULL, 31, 'Ira ', 'Baird', 'Male', 'Grade 1-Under', '93 Loch Haven Lane', 'Old Barns', 'B6l 1L8', '9028903797', 'yes', 'yes', 4, 0),
(239, 'Child', 238, 30, 'Marla', 'Baird', 'Female', 'Grade 2-3', '93 Loch Haven Lane', 'Old Barns', 'B6l 1L8', '9028903797', 'yes', 'yes', 4, 25),
(240, 'Parent', NULL, 75, 'Dane', 'Henderson', 'Male', 'Adult', '405 Young St', 'Truro', 'B2N3Y7', '9028905816', 'no', 'yes', 3, 1),
(241, 'Child', 240, 76, 'Xavi', 'Henderson', 'Male', 'Grade 2-3', '405 Young St', 'Truro', 'B2N3Y7', '9028905816', 'yes', 'yes', 4, 0),
(242, 'Parent', NULL, 997, 'Edmund', 'MacIsaac', 'Male', 'Grade 2-3', '66 smith ', 'Truro ', 'B2N 1C4', '902 222 0732', 'no', 'yes', 3, 11),
(243, 'Parent', NULL, 84, 'Seth', 'McLaughlin', 'Male', 'Grade 2-3', '3361 Hwy 2', 'Economy', 'B0M1J0', '9029564399', 'no', 'yes', 0, 0),
(244, 'Parent', NULL, 28, 'Austin', 'MacPhee', 'Male', 'Grade 4-6', '340 Upper Brookfield Rd.', 'Brookfield', 'B0N1C0', '4035931273', 'yes', 'yes', 4, 0),
(245, 'Parent', NULL, 80, 'Lindsey', 'Chisholm', 'Female', 'Adult', '158 pleasant st', 'Truro', 'B2N 3S6', '19028705766', 'yes', 'yes', 4, 15),
(246, 'Parent', NULL, 992, 'Cooper', 'Johnston ', 'Male', 'Run-Bike', '350 Upper Brookfield road ', 'Brookfield ', 'B0N 1C0', '9023243404', 'yes', 'yes', 3, 0),
(247, 'Parent', NULL, 115, 'Ben', 'Johnston ', 'Male', 'Grade 1-Under', '350 Upper Brookfield road ', 'Brookfield ', 'B0N 1C0', '9023243404', 'yes', 'yes', 3, 0),
(248, 'Parent', NULL, 50, 'Gavin', 'Fisher', 'Male', 'Grade 4-6', '1635 Truro Road ', 'Hilden ', 'B0N1C0 ', '902-957-2676', 'yes', 'yes', 4, 0),
(249, 'Parent', NULL, 12, 'Johnny ', 'Blaauwendraat ', 'Male', 'Grade 4-6', '371 Old tatamagouche rd', 'Onslow Mountain ', 'B6L6N5', '9028907922', 'yes', 'yes', 3, 0),
(250, 'Child', 249, 13, 'Hendrik', 'Blaauwendraat', 'Male', 'Grade 1-Under', '371 Old tatamagouche rd', 'Onslow Mountain ', 'B6L6N5', '9028907922', 'yes', 'yes', 4, 0),
(251, 'Child', 249, 14, 'Nora', 'Blaauwendraat', 'Female', 'Grade 2-3', '371 Old tatamagouche rd', 'Onslow Mountain ', 'B6L6N5', '9028907922', 'yes', 'yes', 4, 8),
(252, 'Child', 249, 15, 'John', 'Blaauwendraat ', 'Male', 'Adult', '371 Old tatamagouche rd', 'Onslow Mountain ', 'B6L6N5', '9028907922', 'no', 'yes', 2, 0),
(253, 'Parent', NULL, 116, 'Levi', 'Harbers', 'Male', 'Grade 4-6', '2965 Alton Road ', 'MacKay Siding', 'B0N 2J0', '902-899-8229', 'yes', 'yes', 4, 4),
(254, 'Parent', NULL, 984, 'EMERSON ', 'Brooks', 'Male', 'Grade 4-6', '267 Old East Mountain Road', 'East Mountain', 'B6L 2L3', '09028952391', 'no', 'yes', 3, 5),
(255, 'Parent', NULL, 63, 'Mitchell', 'Cooke', 'Male', 'Adult', '664 hwy 2', 'Brookfield ', 'B0n 1c0 ', '9029570376', 'no', 'yes', 2, 19),
(256, 'Parent', NULL, 2, 'Kennedy', 'Grant', 'Female', 'Run-Bike', '297 Lesley Street ', 'Hilden', 'B0N 1C0', '9024499752', 'yes', 'yes', 4, 10),
(257, 'Child', 256, 3, 'Lane', 'Grant', 'Male', 'Grade 1-Under', '297 Lesley Street ', 'Hilden', 'B0N 1C0', '9024499752', 'yes', 'yes', 4, 1),
(258, 'Parent', NULL, 627, 'Meisha', 'Scothorn', 'Female', 'Adult', '24 Pleasant Valley road ', 'Brookfield', 'B0N 1C0', '(902) 986-3308', 'yes', 'yes', 3, 9),
(259, 'Parent', NULL, 56, 'Jakob ', 'Hoehne ', 'Male', 'Grade 4-6', '137 Old East Mountain rd', 'East Mountain ', 'B6L2L3 ', '9023051715', 'yes', 'yes', 4, 0),
(260, 'Child', 259, 55, 'Jane', 'Hoehne', 'Female', 'Grade 1-Under', '137 Old East Mountain rd', 'East Mountain ', 'B6L2L3 ', '9023051715', 'yes', 'yes', 4, 1),
(261, 'Child', 259, 68, 'Nic', 'Hoehne', 'Male', 'Adult', '137 Old East Mountain rd', 'East Mountain ', 'B6L2L3 ', '9023051715', 'yes', 'yes', 4, 0),
(262, 'Parent', NULL, 74, 'Nixon', 'Bower', 'Male', 'Grade 1-Under', '35 Martha Ave', 'Truro', 'B2n 4v7', '9029860596', 'no', 'yes', 3, 12),
(263, 'Parent', NULL, 11, 'Sadie', 'Frew', 'Female', 'Run-Bike', '94 Smith Ave', 'Truro', 'B2N1C4', '6132187372', 'yes', 'yes', 4, 9),
(264, 'Parent', NULL, 60, 'Cooper', 'Sipos', 'Male', 'Grade 2-3', '193 Burnyeat Street', 'Truro', 'B2N4R3', '902-870-5613', 'no', 'yes', 3, 3),
(265, 'Child', 264, 61, 'Addison', 'Sipos', 'Female', 'Run-Bike', '193 Burnyeat Street', 'Truro', 'B2N4R3', '902-870-5613', 'no', 'yes', 3, 1),
(266, 'Parent', NULL, 82, 'Carolyn', 'Benvie', 'Female', 'Adult', '2712 Riverside Rd', 'Green Creek', 'B0N1C0', '(902) 751-1318', 'yes', 'yes', 2, 15),
(267, 'Child', 266, 45, 'Jasper ', 'Benvie ', 'Male', 'Run-Bike', '2712 Riverside Rd', 'Green Creek', 'B0N1C0', '(902) 751-1318', 'yes', 'yes', 3, 9),
(268, 'Parent', NULL, 65, 'Emmet', 'Fisher', 'Male', 'Grade 4-6', '3 Heritage Place', 'Truro', 'B2N 6J4', '902-814-7607', 'yes', 'yes', 3, 0),
(269, 'Child', 30, 983, 'Willow', 'Redmond', 'Female', 'Run-Bike', '195 Burnyeat St.', 'Truro', 'B2N 4R1', '9029869389', 'no', 'yes', 3, 0),
(270, 'Child', 99, 71, 'Jovie', 'Shearer', 'Female', 'Run-Bike', '2681 Hwy 311', 'Upper North River', 'B6L 6J6', '902-899-6788', 'yes', 'yes', 4, 3),
(271, 'Child', 43, 27, 'Gavin', 'Doucet', 'Male', 'Run-Bike', '98 MacElmon Road', 'Lower Onslow', 'B0M 1C0', '9028995465', 'no', 'yes', 3, 0),
(272, 'Child', 107, 36, 'Jade', 'Leopold', 'Female', 'Run-Bike', '166 Brunswick St', 'Truro', 'B2n2h8', '19029570263', 'yes', 'yes', 4, 9),
(273, 'Parent', NULL, 24, 'King ', 'Hodgkinson ', 'Male', 'Grade 2-3', '7 Carleton court ', 'Valley ', 'B6l 3c7', '9029861515', 'no', 'yes', 3, 4),
(274, 'Child', 273, 25, 'Lennox ', 'Hodgkinson ', 'Male', 'Run-Bike', '7 Carleton court ', 'Valley ', 'B6l 3c7', '9029861515', 'no', 'yes', 3, 8),
(275, 'Parent', NULL, 994, 'Thomas', 'Kayter', 'Male', 'Grade 2-3', '9 Weir Ave ', 'Bible Hill ', 'B2N2Y6 ', '9029569931', 'yes', 'yes', 4, 0),
(276, 'Parent', NULL, 43, 'Carson', 'Palmer', 'Male', 'Jr. High', '446 St Andrews River Road', 'Shubenacadie East', 'B0N 2H0', '9028775575', 'no', 'yes', 1, 0),
(277, 'Parent', NULL, 49, 'Jaxon', 'Leil', 'Male', 'Grade 1-Under', '1465 Pleasant Valley Road', 'Brookfield', 'B0N 1C0', '9029863600', 'no', 'yes', 2, 0),
(278, 'Child', 277, 48, 'Honor', 'Leil', 'Female', 'Run-Bike', '1465 Pleasant Valley Road', 'Brookfield', 'B0N 1C0', '9029863600', 'no', 'yes', 2, 12),
(279, 'Parent', NULL, 730, 'Blake', 'Malay', 'Male', 'Grade 2-3', '12 Salter Ave', 'Truro', 'B2N1A5', '902-986-2096', 'no', 'yes', 3, 0),
(280, 'Parent', NULL, 79, 'Kerry', 'Chisholm', 'Female', 'Adult', '60 mount pleasant blvd ', 'Truro', 'B2N3N7 ', '9028996609', 'yes', 'yes', 4, 20),
(281, 'Parent', NULL, 37, 'Emily', 'Vandenburg', 'Female', 'Grade 2-3', '9594 Hwy 2', 'Great Village', 'B0M 1M0', '902-890-3525', 'yes', 'yes', 4, 10),
(282, 'Child', 281, 38, 'Sarah ', 'Vandenburg', 'Female', 'Grade 1-Under', '9594 Hwy 2', 'Great Village', 'B0M 1M0', '902-890-3525', 'no', 'yes', 3, 7),
(283, 'Parent', NULL, 39, 'Isaac', 'MacGillivary', 'Male', 'Grade 2-3', '399 Station Road', 'Great Village', 'B0M 1L0', '902-814-2071', 'yes', 'yes', 3, 0),
(284, 'Parent', NULL, 67, 'Sophia', 'MacDonald', 'Female', 'Adult', '155 Lakeshore Rd', 'Brookfiels', 'B0N1C0', '9029568799', 'no', 'yes', 1, 3),
(285, 'Parent', NULL, 81, 'Noah', 'MacDonald', 'Male', 'Grade 4-6', '155 Lakeshore Rd', 'Brookfield', 'B0N1C0', '9029568799', 'yes', 'yes', 4, 0),
(286, 'Parent', NULL, 986, 'Cameron', 'Putnam', 'Male', 'Grade 1-Under', '1650 highway 4', 'Londonderry ', 'B0M1M0 ', '9029862975', 'yes', 'yes', 4, 7),
(287, 'Child', 286, 985, 'Riley', 'Putnam', 'Male', 'Grade 1-Under', '1650 highway 4', 'Londonderry ', 'B0M1M0 ', '9029862975', 'yes', 'yes', 4, 0),
(288, 'Child', 132, 995, 'Layke', 'Taylor', 'Male', 'Run-Bike', '256 Marney Road', 'Hilden', 'B0N 1C0', '9029572724', 'yes', 'yes', 4, 10),
(289, 'Child', 220, 19, 'Gabrielle', 'Sonier', 'Female', 'Run-Bike', '148 St Nicholas Rd', 'Miscouche', 'C0B1T0', '(902) 303-0252', 'no', 'yes', 1, 6),
(290, 'Parent', NULL, 10, 'Hunter ', 'Elliott ', 'Male', 'Jr. High', '628 Brentwood road ', 'Brookfield ', 'B0N 1C0', '9027511169', 'no', 'yes', 3, 3),
(291, 'Parent', NULL, 58, 'William ', 'Nolter', 'Male', 'Grade 2-3', '37 Claremont Ave', 'Stellarton', 'B0K 1S0', '9027592836', 'yes', 'yes', 4, 20),
(292, 'Child', 291, 57, 'Charlie', 'Nolter', 'Male', 'Grade 2-3', '37 Claremont Ave', 'Stellarton', 'B0K 1S0', '9027592836', 'yes', 'yes', 4, 11),
(293, 'Child', 123, 980, 'Lily', 'Gorman', 'Female', 'Grade 2-3', '1808  Onslow Mountain Road', 'North River', 'B6L 6P5', '902-986-3678', 'yes', 'yes', 4, 17),
(294, 'Parent', NULL, 18, 'Spencer', 'MacDonald', 'Male', 'Adult', '70 edgehill dr', 'Valley', 'B6l3k3 ', '9028904935', 'yes', 'yes', 4, 22),
(295, 'Child', 149, 22, 'Solomon', 'Purves-Smith', 'Male', 'Run-Bike', '150 George Weatherby Rd', 'Debert', 'B0M1G0', '902-324-2171', 'yes', 'yes', 4, 0),
(296, 'Parent', NULL, 40, 'Lennox', 'Millen', 'Male', 'Grade 1-Under', '20 Little Dyke Road ', 'Great Village ', 'B0M 1L0', '9029564129', 'no', 'yes', 3, 0),
(297, 'Parent', NULL, 51, 'Madeleine', 'Irving', 'Female', 'Grade 1-Under', '101 Aspen Street', 'Stellarton', 'B0k 1s0', '9023018377', 'yes', 'yes', 4, 15),
(298, 'Child', 297, 52, 'Marielle', 'Irving', 'Female', 'Grade 1-Under', '101 Aspen Street', 'Stellarton', 'B0k 1s0', '9023018377', 'yes', 'yes', 4, 0),
(299, 'Parent', NULL, 44, 'Dustin', 'Butler', 'Male', 'Jr. High', '599 Brentwood Road', 'Brookfield', 'B0N 1C0', '1-902-483-6461', 'no', 'yes', 2, 0),
(300, 'Parent', NULL, 72, 'Brantley', 'Benoit', 'Male', 'Run-Bike', '200 Johnson Road', 'Harmony', 'B6L3S4', '902-789-2714', 'no', 'yes', 3, 10),
(301, 'Parent', NULL, 66, 'Kris', 'Phillips', 'Male', 'Adult', '165 Burris Drive', 'Valley', 'B6L0B9', '9028907057', 'no', 'yes', 3, 4),
(302, 'Parent', NULL, 33, 'Gerrit', 'Simms', 'Male', 'Run-Bike', '87 Sandy Place', 'Truro', 'B6L 4G4', '9029561440', 'yes', 'yes', 4, 11),
(303, 'Child', 302, 32, 'Harrison ', 'Simms', 'Male', 'Grade 1-Under', '87 Sandy Place', 'Truro', 'B6L 4G4', '9029561440', 'yes', 'yes', 4, 0),
(304, 'Parent', NULL, 6, 'Charlie', 'Fitzgerald', 'Female', 'Grade 4-6', '380 Old Greenfield Road', 'Valley', 'B6L 3Z3', '19023242429', 'no', 'yes', 2, 0),
(305, 'Child', 304, 7, 'Kate', 'Fitzgerald', 'Female', 'Grade 2-3', '380 Old Greenfield Road', 'Valley', 'B6L 3Z3', '19023242429', 'yes', 'yes', 3, 1),
(306, 'Child', 304, 8, 'Mac', 'Fitzgerald', 'Male', 'Grade 1-Under', '380 Old Greenfield Road', 'Valley', 'B6L 3Z3', '19023242429', 'yes', 'yes', 3, 0),
(307, 'Parent', NULL, 85, 'Leroy', 'Crowe', 'Male', 'Grade 4-6', '79 Conrad Road', 'Lawrencetown', 'B2Z 1S1', '(902) 488-9607', 'no', 'yes', 2, 1),
(308, 'Chile', 291, 53, 'Maria', 'Nolter', 'Female', 'Grade 1-Under', '37 Claremont Ave.', 'Stellarton', 'B0K 1S0', '9027592836', 'yes', 'yes', 4, 0),
(309, 'Parent', NULL, 988, 'Malcolm ', 'Farris ', 'Male', 'Adult', '9 Hingley Ave ', 'Truro', 'B2N3B9 ', '9024488093', 'no', 'yes', 1, 0),
(310, 'Parent', NULL, 998, 'Keel', 'Blacklock', 'Male', 'Run-Bike', '98 Pleasant St', 'Truro', 'B2N 3S3', '9028973338', 'no', 'yes', 2, 14),
(311, 'Parent', NULL, 4, 'Sylvie', 'Burgess', 'Female', 'Run-Bike', '11 Greenfield Road', 'Murray Siding', 'B6L 3M5', '902-956-1465', 'yes', 'yes', 2, 0),
(312, 'Parent', NULL, 86, 'Silas', 'Fiene', 'Male', 'Grade 1-Under', '101 Arthur St', 'Truro', 'B2N 1X9', '+1 9022939618', 'no', 'yes', 2, 0),
(313, 'Child', 312, 87, 'Darwin', 'Fiene', 'Male', 'Run-Bike', '101 Arthur St', 'Truro', 'B2N 1X9', '+1 9022939618', 'no', 'yes', 2, 0),
(314, 'Parent', NULL, 88, 'Myla ', 'Wile ', 'Female', 'Grade 2-3', '505 old greenfield road', 'Valley', 'B6L3Z1 ', '9028907456', 'yes', 'yes', 3, 1),
(315, 'Child', 314, 89, 'Jett ', 'Wile', 'Male', 'Grade 1-Under', '505 old greenfield road', 'Valley', 'B6L3Z1 ', '9028907456', 'yes', 'yes', 3, 0),
(316, 'Parent', NULL, 90, 'Maci', 'McNutt', 'Female', 'Grade 1-Under', '12 bridgeview drive ', 'Murray siding', 'B6L 3B5', '902-890-7846', 'yes', 'yes', 3, 0),
(317, 'Parent', NULL, 619, 'Thomas', 'Oleary', 'Male', 'Grade 4-6', '77 Laurie Rath Rd', 'Camden', 'B6L 3T6', '+1 9023241019', 'yes', 'yes', 2, 0),
(318, 'Parent', NULL, 91, 'Jesse', 'Wilkie', 'Male', 'Grade 1-Under', '2640 indian rd', 'MacPhees corner', 'B0N2H0', '+19028807358', 'no', 'yes', 2, 0),
(319, 'Parent', NULL, 92, 'Beau', 'Blois', 'Male', 'Adult', '3214 Nova Scotia 236, hwy 236', 'OLD BARNS', 'B6L 1K4', '9029569564', 'no', 'yes', 1, 0),
(320, 'Child', 319, 93, 'Isaac', 'Blois', 'Male', 'Jr. High', '3214 Nova Scotia 236, hwy 236', 'OLD BARNS', 'B6L 1K4', '9029569564', 'no', 'yes', 1, 0),
(321, 'Child', 319, 94, 'Arlo', 'Blois', 'Male', 'Grade 4-6', '3214 Nova Scotia 236, hwy 236', 'OLD BARNS', 'B6L 1K4', '9029569564', 'no', 'yes', 1, 0),
(322, 'Parent', NULL, 95, 'JD', 'Patterson', 'Male', 'Adult', '160 Causeway Road', 'Seaforth', 'BOJ 1N0', '9024767421', 'no', 'yes', 0, 0),
(323, 'Child', 322, 96, 'JR', 'Patterson', 'Male', 'Grade 4-6', '160 Causeway Road', 'Seaforth', 'BOJ 1N0', '9024767421', 'no', 'yes', 1, 0),
(324, 'Parent', NULL, 97, 'Jase', 'Keddy-Volans', 'Male', 'Grade 2-3', '15 Tower View Dr', 'Valley', 'B6L4L5', '9024303721', 'yes', 'yes', 2, 0),
(325, 'Parent', NULL, 98, 'Ben ', 'Bugden', 'Male', 'Grade 4-6', '1 Trillium Terrace', 'Halifax', 'B3M3P5', '9022291995', 'no', 'yes', 2, 0),
(326, 'Parent', NULL, 99, 'Weston', 'Mingo', 'Male', 'Grade 1-Under', '739 Tattrie Settlement Rd ', 'Tatamagouche', 'B0K 1V0', '902-397-2212', 'yes', 'yes', 3, 0),
(327, 'child', 301, 100, 'Lucas', 'Phillips', 'male', 'Grade 4-6', '165 Burris Drive', 'Valley', 'B6L0B9', '9028907057', 'no', 'yes', 2, 0),
(328, 'child', 307, 101, 'Nathalie', 'Green', 'Female', 'Adult', '79 Conrad Road', 'Lawrencetown', 'B2Z 1S1', '(902) 488-9607', 'no', 'no', 3, 2),
(329, 'Parent', NULL, 102, 'Gustavo', 'Green', 'Male', 'Grade 2-3', '97 Conrad Rd', 'Lawrencetown', 'B2Z 1S1', '9028027407', 'no', 'yes', 2, 0),
(330, 'Parent', NULL, 103, 'Josephine ', 'MacIsaac', 'Female', 'Grade 1-Under', '66 Smith ', 'Truro ', 'B2N 1L8', '9027190179', 'no', 'yes', 2, 0),
(331, 'Parent', NULL, 104, 'samuek', 'geddes', 'Male', 'Grade 2-3', '14 glooscap drive', 'millbrook', 'b6l 1g5', '902 957 0823', 'no', 'yes', 2, 0),
(332, 'Parent', NULL, 109, 'Hunter', 'Barnhill ', 'Male', 'Grade 2-3', '145 East Mountain Road ', 'Truro', 'B6L2E3 ', '9027546611', 'yes', 'yes', 2, 0),
(333, 'Parent', NULL, 107, 'Ben', 'Tree', 'Male', 'Grade 2-3', '189 Glenwood Drive ', 'Truro', 'B2N1P5', '9028991312', 'yes', 'yes', 3, 0),
(334, 'Parent', NULL, 110, 'Owen', 'Hamilton ', 'Male', 'Run-Bike', '2468 hwy 236', 'Beaver brook ', 'B6l1h4 ', '9028773074 ', 'no', 'yes', 1, 0),
(335, 'Parent', NULL, 111, 'Maddex', 'Marshall', 'Male', 'Run-Bike', '59 E Court Rd', 'Biblehill', 'B2N 4M7', '9029869322', 'no', 'yes', 2, 0),
(336, 'Parent', NULL, 112, 'Maddox', 'McNeil', 'Male', 'Grade 4-6', '21 Bayberry Drive', 'Milford', 'B0N1Y0', '902 456 9376', 'no', 'yes', 1, 0),
(337, 'Child', 336, 113, 'Luca ', 'McNeil', 'Male', 'Grade 1-Under', '21 Bayberry Drive', 'Milford', 'B0N1Y0', '902 456 9376', 'no', 'yes', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_results`
--

CREATE TABLE `tbl_results` (
  `id` int(11) UNSIGNED NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `results` longtext DEFAULT NULL,
  `season` varchar(11) DEFAULT NULL,
  `category` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_results`
--

INSERT INTO `tbl_results` (`id`, `created_at`, `updated_at`, `results`, `season`, `category`) VALUES
(3, '2019-05-08', '2019-05-08', '863.3, 406.3, 835.3, 931.3, 973.3, 509.3, 915.3, 868.3, 206.2, 949.1 :3', 'Spring', 'Jr. High'),
(5, '2019-05-08', '2019-05-08', '508.4, 404.4, 927.4, 917.4, 898.4, 947.3, 437.3, 550.3, 871.3, 679.3, 581.3, 403.3, 639.3, 755.2, 766.2, 957.2, 397.2, 905.2, 938.2, 936.2, 950.1, 774.1 :4', 'Spring', 'Grade 2-3'),
(6, '2019-05-08', '2019-05-08', '285.5, 554.5, 572.5, 802.5, 974.5, 659.4, 556.4, 658.4, 560.4, 897.4, 545.4, 789.4, 773.4, 756.4, 933.4, 803.4, 765.4, 795.3, 878.3, 961.3, 939.2, 900.1, 450.1 :5', 'Spring', 'Grade 1-Under'),
(8, '2019-05-08', '2019-05-08', '901.5, 574.5, 752.5, 782.5, 975.5, 670.5, 747.5, 913.5, 453.5, 430.5, 918.5, 584.5, 527.5, 958.4, 837.4, 892.4, 614.4, 293.4, 903.4, 645.4, 945.4, 943.4, 595.4, 210.4, 748.4, 813.3 :5', 'Spring', 'Adult'),
(9, '2019-05-08', '2019-05-08', '874.6, 867.6, 693.5, 864.5, 694.5, 920.5, 709.5, 845.5, 911.4, 894.4, 805.4, 598.4, 861.4, 929.4, 717.4, 685.4, 833.4, 589.4, 287.4, 924.4, 737.4, 916.4, 934.3, 749.3, 910.3, 921.3, 942.3, 743.3, 925.3, 798.3, 907.3, 715.3, 896.3, 930.3, 908.2, 884.2, 904.1, 940.1 :6', 'Spring', 'Run-Bike'),
(13, '2019-05-08', '2019-05-09', '405.4, 294.3, 746.3, 538.3, 960.3, 941.3, 588.3, 914.3, 620.3, 906.3, 801.2, 869.2, 678.2, 959.2, 948.2, 814.2, 909.2, 615.2, 912.2, 954.2, 815.1, 714.1, 937.1 :4', 'Spring', 'Grade 4-6'),
(16, '2019-05-29', '2019-05-29', '874.5, 709.5, 693.5, 920.5, 864.5, 911.5, 694.5, 287.5, 787.5, 805.4, 845.4, 894.4, 833.4, 828.4, 921.4, 925.4, 685.4, 929.4, 717.4, 861.4, 940.4, 737.4, 798.4, 934.4, 916.4, 749.3, 953.3, 967.3, 924.3, 907.3, 904.3, 589.3, 715.3, 896.3, 598.2, 743.2, 908.2, 930.2, 884.1 :5', 'Spring', 'Run-Bike'),
(17, '2019-05-29', '2019-05-29', '508.4, 898.4, 404.4, 927.3, 917.3, 437.3, 550.3, 871.3, 679.3, 581.3, 793.3, 969.3, 403.3, 397.3, 905.3, 639.2, 792.2, 936.2, 938.2, 755.1, 774.1, 957.1 :4', 'Spring', 'Grade 2-3'),
(18, '2019-05-29', '2019-05-29', '863.3, 406.3, 952.3, 973.3, 931.3, 206.3, 868.3, 509.3, 915.2 :3', 'Spring', 'Jr. High'),
(19, '2019-05-29', '2019-05-29', '285.5, 572.4, 802.4, 554.4, 922.4, 897.4, 556.4, 658.4, 545.4, 756.4, 560.4, 659.4, 773.3, 933.3, 803.3, 765.3, 789.3, 450.3, 489.3, 974.3, 795.3, 970.3, 878.3, 939.3, 966.3, 972.3, 961.3, 900.3, 976.2 :5', 'Spring', 'Grade 1-Under'),
(20, '2019-05-29', '2019-05-31', '405.3, 294.3, 746.3, 689.3, 941.3, 960.3, 964.3, 841.3, 914.3, 588.3, 965.3, 538.2, 620.2, 906.2, 801.2, 877.2, 869.2, 814.2, 948.2, 678.2, 909.2, 962.2, 937.2, 815.1, 912.1 :3', 'Spring', 'Grade 4-6'),
(22, '2019-05-29', '2019-06-02', '901.5, 574.5, 752.5, 951.5, 543.5, 782.5, 975.5, 240.5, 430.5, 584.5, 453.5, 706.5, 614.5, 527.5, 747.4, 832.4, 892.4, 903.4, 645.4, 899.4, 944.1 :5', 'Spring', 'Adult'),
(23, '2019-06-04', '2019-06-04', '405.4, 746.4, 294.4, 689.4, 964.4, 941.4, 960.4, 914.3, 588.3, 620.3, 965.3, 906.3, 801.3, 678.3, 814.3, 869.2, 877.2, 909.2, 912.2, 714.2, 815.2, 937.1 :4', 'Spring', 'Grade 4-6'),
(24, '2019-06-04', '2019-06-05', '901.6, 574.5, 752.5, 951.5, 782.5, 932.5, 430.5, 975.5, 240.5, 913.5, 614.5, 453.5, 747.5, 584.5, 527.5, 892.4, 832.4, 968.4, 903.4, 645.4, 944.4, 945.4, 977.3 :6', 'Spring', 'Adult'),
(25, '2019-06-04', '2019-06-05', '508.4, 927.4, 898.4, 404.4, 917.4, 437.3, 639.3, 793.3, 581.3, 679.3, 764.3, 969.3, 792.2, 755.2, 403.2, 936.2, 905.2, 397.2, 957.1 :4', 'Spring', 'Grade 2-3'),
(26, '2019-06-04', '2019-06-05', '920.6, 874.5, 867.5, 694.5, 864.5, 693.5, 833.5, 287.5, 925.4, 787.4, 685.4, 717.4, 894.4, 911.4, 924.4, 828.4, 805.4, 861.4, 737.4, 967.4, 910.3, 749.3, 907.3, 715.3, 589.3, 798.3, 896.3, 904.3, 930.3, 743.2, 908.2, 598.1, 940.1 :6', 'Spring', 'Run-Bike'),
(27, '2019-06-04', '2019-06-05', '863.3, 406.3, 434.3, 952.3, 973.3, 931.3, 509.3, 206.3, 868.2, 915.2 :3', 'Spring', 'Jr. High'),
(28, '2019-06-04', '2019-06-05', '285.5, 966.5, 572.5, 556.4, 897.4, 756.4, 974.4, 560.4, 802.4, 933.4, 789.3, 795.3, 765.3, 900.3, 803.3, 961.3, 450.3, 545.3, 489.3, 939.3, 878.3, 970.2, 786.1, 554.1 :5', 'Spring', 'Grade 1-Under'),
(30, '2019-06-11', '2019-06-11', '598.6, 874.6, 693.5, 920.5, 864.5, 867.5, 845.5, 833.5, 287.5, 787.5, 925.4, 921.4, 715.4, 717.4, 924.4, 805.4, 894.4, 828.4, 861.4, 929.4, 737.4, 910.3, 907.3, 967.3, 904.3, 930.3, 589.3, 940.3, 743.2, 749.2, 942.2, 908.2, 798.2, 884.1 :6', 'Spring', 'Run-Bike'),
(31, '2019-06-11', '2019-06-11', '863.3, 406.3, 952.3, 973.3, 206.3, 868.3, 434.1 :3', 'Spring', 'Jr. High'),
(32, '2019-06-11', '2019-06-11', '574.5, 752.5, 543.5, 951.5, 614.5, 430.5, 913.5, 747.5, 584.5, 453.5, 240.5, 832.5, 892.5, 903.4, 944.4, 748.4 :5', 'Spring', 'Adult'),
(33, '2019-06-12', '2019-06-12', '966.5, 285.5, 802.5, 572.5, 897.4, 974.4, 556.4, 560.4, 450.4, 765.4, 803.4, 756.4, 900.4, 933.4, 789.4, 795.4, 545.4, 554.4, 970.3, 939.3, 961.3, 489.2 :5', 'Spring', 'Grade 1-Under'),
(34, '2019-06-12', '2019-06-12', '508.4, 898.4, 927.4, 404.4, 917.4, 793.3, 437.3, 639.3, 550.3, 581.3, 969.3, 936.3, 792.3, 755.3, 957.3, 397.3, 403.2 :4', 'Spring', 'Grade 2-3'),
(35, '2019-06-13', '2019-06-13', '405.4, 294.4, 746.4, 689.4, 538.4, 964.4, 941.4, 960.3, 914.3, 588.3, 620.3, 965.3, 801.3, 814.3, 877.3, 869.2, 909.2, 912.2, 937.2, 815.1 :4', 'Spring', 'Grade 4-6'),
(36, '2021-09-14', '2021-09-15', '51.5, 982.4, 26.4, 991.4, 972.4, 996.4, 953.4, 54.4, 287.4, 31.4, 986.4, 979.4, 38.4, 40.4, 35.4, 55.4, 743.4, 49.3, 17.3, 3.3, 23.3, 52.3, 993.3, 74.3, 989.3, 13.3, 53.3, 70.3, 8.3, 46.3, 925.3, 32.2, 985.2, 62.2 :5', 'Fall', 'Grade 1-Under'),
(38, '2021-09-14', '2021-09-15', '63.8, 18.7, 574.7, 584.6, 82.6, 66.6, 75.6, 406.6, 79.6, 64.6, 988.5, 80.5, 15.5, 68.5, 645.5, 627.4, 67.4 :8', 'Fall', 'Adult'),
(43, '2021-09-14', '2021-09-16', '77.4, 405.4, 538.4, 59.4, 10.4, 509.4, 186.4, 588.4, 44.3, 43.1 :4', 'Fall', 'Jr. High'),
(44, '2021-09-14', '2021-09-17', '998.4, 704.4, 25.4, 48.4, 995.4, 45.4, 33.4, 72.4, 36.4, 19.4, 2.3, 71.3, 11.3, 41.3, 22.2, 42.2, 61.2, 4.2, 1.1, 992.1, 983.1, 27.1, 34.1 :4', 'Fall', 'Run-Bike'),
(46, '2021-09-14', '2021-09-17', '415.5, 78.5, 9.5, 670.5, 16.5, 73.5, 984.5, 508.5, 56.5, 20.5, 81.5, 28.4, 803.4, 581.4, 65.4, 12.4, 990.3, 50.3 :5', 'Fall', 'Grade 4-6'),
(47, '2021-09-14', '2021-09-17', '422.4, 997.4, 21.4, 58.4, 57.4, 981.4, 60.4, 705.4, 24.3, 29.3, 987.3, 802.3, 994.3, 30.3, 76.3, 39.3, 980.3, 924.3, 14.3, 730.2, 37.2, 7.1 :4', 'Fall', 'Grade 2-3'),
(48, '2021-09-22', '2021-09-22', '63.8, 18.7, 574.7, 406.7, 584.7, 75.6, 66.6, 79.6, 64.6, 92.6, 15.6, 68.6, 80.5, 645.5, 108.5, 627.4, 101.4 :8', 'Fall', 'Adult'),
(49, '2021-09-22', '2021-09-22', '422.4, 57.4, 58.4, 981.4, 29.4, 997.4, 30.4, 987.4, 102.4, 21.4, 24.4, 104.3, 994.3, 802.3, 60.3, 924.3, 76.3, 39.3, 97.3, 37.3, 14.3, 980.3, 730.2, 107.2 :4', 'Fall', 'Grade 2-3'),
(50, '2021-09-22', '2021-09-22', '991.5, 51.4, 26.4, 74.4, 982.4, 287.4, 54.4, 70.4, 986.4, 31.4, 38.4, 40.4, 55.4, 979.4, 91.4, 89.4, 996.4, 52.4, 99.3, 13.3, 993.3, 743.3, 989.3, 86.3, 925.3, 49.3, 53.3, 35.3, 17.3, 23.3, 3.2, 103.2, 90.2, 985.2, 32.2, 46.2 :5', 'Fall', 'Grade 1-Under'),
(51, '2021-09-23', '2021-09-23', '105.5, 508.5, 78.5, 73.5, 85.5, 984.5, 9.5, 98.5, 670.5, 16.5, 94.5, 81.5, 20.5, 803.5, 56.5, 619.5, 28.5, 100.5, 96.5, 65.4, 581.4, 990.4, 12.4, 50.4 :5', 'Fall', 'Grade 4-6'),
(52, '2021-09-24', '2021-09-24', '405.4, 77.4, 509.4, 186.4, 10.4, 59.4, 44.4, 588.4, 955.3, 538.3, 93.1 :4', 'Fall', 'Jr. High'),
(53, '2021-09-26', '2021-09-26', '704.5, 995.4, 48.4, 998.4, 25.4, 36.4, 33.4, 72.4, 11.4, 83.4, 45.4, 2.3, 1.3, 42.3, 41.3, 992.3, 61.3, 71.3, 34.3, 22.1, 983.1 :5', 'Fall', 'Run-Bike'),
(54, '2021-10-05', '2021-10-05', '74.5, 982.5, 54.4, 986.4, 70.4, 287.4, 113.4, 40.4, 996.4, 979.4, 38.4, 26.4, 91.4, 3.4, 991.4, 31.4, 86.4, 17.4, 993.4, 743.4, 52.3, 51.3, 99.3, 13.3, 989.3, 925.3, 103.3, 89.3, 8.3, 35.3, 53.3, 23.3, 985.2, 90.2, 55.2, 32.1 :5', 'Fall', 'Grade 1-Under'),
(55, '2021-10-06', '2021-10-06', '422.4, 58.4, 981.4, 997.4, 57.4, 102.4, 29.4, 987.4, 60.4, 21.4, 97.4, 705.4, 994.4, 802.3, 109.3, 30.3, 76.3, 980.3, 37.3, 104.2, 924.2, 730.2, 88.2, 107.2, 7.2, 14.2 :4', 'Fall', 'Grade 2-3'),
(56, '2021-10-06', '2021-10-06', '18.8, 63.8, 574.7, 584.6, 75.6, 79.6, 64.6, 68.5, 80.5, 108.5, 627.4, 101.4 :8', 'Fall', 'Adult'),
(57, '2021-10-07', '2021-10-07', '77.4, 405.4, 509.4, 186.4, 10.4, 588.4, 538.3 :4', 'Fall', 'Jr. High'),
(58, '2021-10-09', '2021-10-09', '704.5, 11.4, 72.4, 33.4, 83.4, 2.4, 995.4, 36.3, 1.3, 41.3, 42.3, 110.3, 27.3, 992.3, 22.3, 25.2, 111.2, 61.1, 983.1, 71.1 :5', 'Fall', 'Run-Bike'),
(59, '2021-10-12', '2021-10-12', '986.4, 70.4, 74.4, 287.4, 26.4, 991.4, 3.4, 89.4, 996.4, 40.4, 31.4, 115.4, 38.4, 743.4, 86.4, 113.4, 17.4, 979.4, 982.4, 35.4, 55.4, 51.4, 23.3, 53.3, 99.3, 989.3, 8.3, 925.3, 103.3, 13.3, 32.3, 985.3, 90.2 :4', 'Fall', 'Grade 1-Under'),
(60, '2021-10-13', '2021-10-13', '422.4, 58.4, 981.4, 60.4, 29.4, 997.4, 109.4, 987.4, 705.3, 97.3, 30.3, 57.3, 994.3, 980.3, 39.3, 924.3, 730.3, 24.3, 76.3, 802.3, 37.3, 107.2, 7.2, 88.2, 14.2 :4', 'Fall', 'Grade 2-3'),
(61, '2021-10-13', '2021-10-13', '18.5, 574.5, 584.5, 66.4, 82.4, 64.4, 79.4, 108.4, 68.4, 80.4, 422.4, 58.4, 981.4, 60.4, 29.4, 997.4, 109.4, 987.4, 627.3, 705.3, 97.3, 30.3, 57.3, 994.3, 980.3, 39.3, 924.3, 730.3, 24.3, 76.3, 802.3, 37.3, 107.2, 7.2, 88.2, 14.2 :5', 'Fall', 'Adult'),
(62, '2021-10-14', '2021-10-14', '704.7, 36.6, 83.6, 24.5, 11.5, 2.5, 45.5, 72.5, 33.5, 1.4, 71.4, 42.4, 995.4, 61.4, 992.4, 41.4, 983.2, 22.2, 4.2 :7', 'Fall', 'Run-Bike'),
(63, '2021-10-15', '2021-10-15', '77.4, 405.4, 509.4, 10.4, 59.4, 588.4, 538.3, 186.3 :4', 'Fall', 'Jr. High'),
(64, '2021-10-15', '2021-10-15', '78.6, 105.5, 508.5, 984.5, 670.5, 73.5, 98.5, 9.5, 116.5, 990.5, 100.5, 81.5, 56.5, 581.4, 112.4, 803.4, 50.3, 28.2 :6', 'Fall', 'Grade 4-6'),
(65, '2021-10-20', '2021-10-20', '105.6, 78.5, 508.5, 984.5, 670.5, 9.5, 990.5, 116.5, 619.5, 73.5, 81.5, 65.5, 56.5, 803.5, 100.5, 28.4, 581.4, 112.4, 12.4, 50.4 :6', 'Fall', 'Grade 4-6');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `racerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`username`, `password`, `type`, `racerID`) VALUES
('Aaron.neaves@gmail.com', '$2b$10$wkBHgEBL8sPBpMHl0jWfPODBvnI7RoIE5L2A9mBPZTaPmQPo8qJky', 'Racer', 237),
('Ajferguson31@gmail.com', '$2b$10$dSF2p1.JsQLW7Lh5OONJmuyAag0nL.av1QkIE5H5Mz1t9TtJQebNa', 'Racer', 180),
('Alison.montena@gmail.com', '$2b$10$LBOw5kzsD.pAAdEU7JRnLOlS9IlkQuVrhxaPuoK7Pm.bMLrq4eEt.', 'Racer', 256),
('AmeliaB', '$2b$10$WLQINLGvBrPiDs9SuD3g7.a2ZbkvQJ9cxjWAhspl7RsH7ASlPkM5q', 'Volunteer', NULL),
('amillett@hotmail.com ', '$2b$10$fv6uoMsO16x8Ltr6mc.SqOFkUQbpbSsVjiz5M7ivjlIzZnLTCDuR6', 'Racer', 235),
('amyvano@dal.ca', '$2b$10$TgHoTDjw0jYN34ur1aNb2e1.0nnBL1SY2H8oH1pZgFO4RLknXoZie', 'Racer', 123),
('amy_topshee@hotmail.com', '$2b$10$z9dTX8sfAOs5a5b51Eh60u9PUNTY0zzomsnaRrLYJlGG7TNf9i3QK', 'Racer', 191),
('anayeligordon247@gmail.com', '$2b$10$V/U/PX6rVy0jU3Vcjb4jFOqaFLOmyRQHwe7Whb5IuzW3RKHcZWmX6', 'Racer', 91),
('andrewhboone@icloud.com', '$2b$10$JC0jaMOU6u9wOb5RZEwAn.v5sLWs/vQeUutZTIq3KXvNTX9qO0m.O', 'Racer', 171),
('anne@annejanelle.com', '$2b$10$ZbYht7VVRNSLI74.YQ.0WuyXtLX1wcVfXtfIcaSK3.9njC4X/NGai', 'Racer', 164),
('arrowsandrubies@gmail.com', '$2b$10$AZmyG492k/WAi9/oVa6bV.9vh1QL5YXRohBzpa0rUzDJyxgapXFDC', 'Racer', 277),
('asexton028@gmail.com', '$2b$10$Y37VlGhzzQolfHk33X6yqe54GQIxVsLYNgRI9yNesA2UP5LMjKLPW', 'Racer', 75),
('ashleighbonnell@gmail.com', '$2b$10$wnnvT2T3Dytxt6CnyMsMAOqjhq8rzXdCb7GvDSoyGr8NXvjT66ZZe', 'Racer', 151),
('ashleyahunt@hotmail.com', '$2b$10$Cbef9SGPWMSmD1.nGi0YyOfLYw/0OE5SsK5tpY4jgnBCpm5Etdti2', 'Racer', 62),
('ashleyessimms@hotmail.com', '$2b$10$AhWwutVlja9C90ZeoKAzTOMnAMSdG1.DlAGVfUTOGHXU5MZskzD3.', 'Racer', 302),
('Austin.mackenzie4@gmail.com', '$2b$10$W0cSPs32Ai6WGFh4jtWC9e5PGhMB..EtrsZ47rNFSk.AcNPpuBrCO', 'Racer', 202),
('bairdem86@gmail.com', '$2b$10$RHzNNBFvoZxaXyltc7qBF.mK/4JJaQQLAK/OYlx4SHac9FRj5nDc6', 'Racer', 238),
('beau.blois@gmail.com', '$2b$10$h3oLDuWqy/PmuQUPc7Q98u34aLH0H9XaU59RhloZ/mu40y8RRx5py', 'Racer', 319),
('Beaublois@gmsil.com', '$2b$10$sRX9fKl.53BseB83T0poEOWWMnQUTcS.LaquwxN9u0luPYx0jMjOW', 'Racer', 153),
('bertha.maclean@hotmail.com', '$2b$10$VKhD7shUWjWVZyXkboq3pubxzgkPqcCIQ1Q01WCNo6FJlHsJYeSBu', 'Racer', 333),
('Bikerdave2222@hotmail.com', '$2b$10$QjS0QVoyxWHH4yBaaYZxj.fdtdVWWAz2eRDDbmclj27rIzQktKhDa', 'Racer', 41),
('bmharbers@outlook.com', '$2b$10$R0.Kgqh.4BOnpDKlUePsDOwJ9AeD56nsEoWeyKkzEp6LD7XANk0fS', 'Racer', 253),
('boones@gnspes.ca', '$2b$10$2zetFiijrCGKgev3oT2FH.vE3Bq9ZmJZLyAGJjerfrLgQbLZJtXpu', 'Racer', 176),
('boupaul@hotmail.com', '$2b$10$edy0Q9dfXARJ4GLDnvLy/ehy2fONQLVeCyLdXPzCQ2fKP6QI6dkKe', 'Racer', 71),
('brennaconrad@yahoo.ca', '$2b$10$DZh4fbGmPkiKi.5awPKXXevcSumHzS4sG8aBUBXZTbbJ5h/4evJwq', 'Racer', 197),
('Bretteugene@hotmail.com', '$2b$10$x3/nyIJTtyiLwQ31pKsJsOfCJysVfYtRv4iNtYOx3HsggJ5C.KocW', 'Racer', 136),
('briannalaine@hotmail.com', '$2b$10$h84iUb5N5fRZEpd9r.Of9uawClFYwyPDT0CSPx7BDhINzN2VGfNQS', 'Racer', 67),
('Brittanie_macphee@hotmail.com', '$2b$10$kEhMo.CWo.AN4lDZ/A5Xt.yVOfgJYrn8iTOJ8NiH6qrktah/RaWw.', 'Racer', 244),
('Brittany-mackenzie@hotmail.com', '$2b$10$K.DHVxtgs37Cij5fty54oe5tloHilxKuYbYn3cpB3groThA..uB7a', 'Racer', 70),
('bromlynr@gmail.com', '$2b$10$N5242mWeF/dl6MXtjuzlRu6ZgR6Fo7xabjaK.1ZPP4nGST8B3BkgW', 'Racer', 51),
('brydonmacdonald1@gmail.com', '$2b$10$3geC6nuq8d.JNKHCIRN8E.IwAe84d..3PS.qUumkMPAFUZUu/Neru', 'Racer', 42),
('C.towell@hotmail.com', '$2b$10$AqBIJV0dCAeE3i92zXPuh.gKN0S8GDQlk4uEBX/s86NW9wtKxs2Qe', 'Racer', 184),
('campbelljl@gnspes.ca', '$2b$10$6e7GSdrP.pPY0CVZXm5aSuILHd5jOi47NT5V4276FE.kuz1nxaIEa', 'Racer', 85),
('carlalittle88@hotmail.com', '$2b$10$TnnmbJT8/DQclcPf/8wkuO1w94ulsvcBGmDWKSRqtpHRYVo019vU6', 'Racer', 334),
('carolyn.b.marshall@gmail.com', '$2b$10$vxFT2ogxptVLA6ntvAgiH.RwwqGYFqykr4t6UzITBM/kXxhtlFmrG', 'Racer', 60),
('Carolyn.Benvie@novascotia.ca', '$2b$10$GQFakUTrovJpDNS99iIbl.B1VDeIpkIiDe9LCZuxtJ8oMdIDOBRim', 'Racer', 266),
('Carolynrau33@gmail.com', '$2b$10$zPbEsWJUESt.i/PpkvRH6ubTdkeBo6UJeAOco6Rc73.Tvpd9IhQ26', 'Racer', 183),
('cdnjeepin@gmail.com', '$2b$10$rxJLNPXa0rtSv7/ZmZTiIuNAdFPnhzsi0UlIoCORrkShPM0ZDPsz.', 'Racer', 40),
('chicky_08@hotmail.com', '$2b$10$oWH.aoaHFIbPCzporJrAOulEj4ZeswUPXIMY7wViDElzFNDF6f44G', 'Racer', 118),
('chisholmslindsey396@gmail.com', '$2b$10$xqYtkMHVCHnKFh7XVcEvbe20YcjbOXOWzfjstmlT5KK7l980LxPJ.', 'Racer', 245),
('clarissa@millenfarms.com', '$2b$10$FrXOIzjCvla6nfy3gvAK/OzoFhLjjrWM5A/13aGvqrv8HoIuwfFaO', 'Racer', 296),
('Cmartin99@hotmail.com ', '$2b$10$xAPJfUM3bFvwsYUsnNPt6eAjgDvhr/hAyDjA8bbXEXbOYP/NjT9Ei', 'Racer', 225),
('colene.chisholm@gmail.com', '$2b$10$IjjiUmg3SBTU3anEMRA4WOy6RJtP0lG9tYnNw.U1gi/XPE4o/jelK', 'Racer', 263),
('Cookehaf@gmail.com', '$2b$10$Kc8jI76yzscf.QVlfOwRp.lgfNhcFGTMwMtqjnJjQsFxG/CoSfQAK', 'Racer', 255),
('cookeheidi@hotmail.com', '$2b$10$YqYbJy2c9UVoLfZy4qXI0ud9OMpjCOAiRR9dKmTRe4vXrcTYivAa.', 'Racer', 94),
('cory_mackinnon@hotmail.com', '$2b$10$60uxZ/pUQCtPj/wtXnedseOMNPaC8.atJUN2VtTv1rlnMjd826IA.', 'Racer', 216),
('Courtneymarie01@hotmail.com', '$2b$10$QbDGgClsCLX16oLBhTLvTOfXsJOACkU87VF4PxNsQBgXLEUF26EWa', 'Racer', 262),
('CST-2-3-2019', '$2b$10$N/MetK4visRTyaKRPy2ebeUA32/nymCh1gd/AJ2uc28.x759U/vNa', NULL, NULL),
('CST-4-6-2019', '$2b$10$HgANUfTm9YTyg4lqg8NN3e/wNxkyFP.ENMsj1d59x1OEm33Cifw8C', NULL, NULL),
('CST-Adult-2019', '$2b$10$nKQ9ZnaoJFOd0xMKNAwDluYDQ9ITLF7g1yp/vwTPL2LE2qBbIKASa', 'Volunteer', NULL),
('CST-JrHigh-2019', '$2b$10$dz16Ad/Wv0JG0uMvyX8CxuOuOAbtp3FVrNMCkm99ZijA72Vc/j.Vi', NULL, NULL),
('CST-Run-2019', '$2b$10$FpS3QxMR1VClsTKmPofIBO6bFmv5LJ27Y3DaYruZ3wYn7SZxlyspm', 'Volunteer', NULL),
('CST-U1-2019', '$2b$10$9kpqDASL5cHlvaJQIYjzl.DQkgZZo4rvKoQALpej224MvCaLa.a8G', NULL, NULL),
('csullivan457@gmail.com', '$2b$10$3aIY8K.vd/nm0x2E65oELuoE9Jv.oDQ6usrUgQjIl/2YgnxCZOOOm', 'Racer', 49),
('cyndimaclean91@gmail.com', '$2b$10$x76BdtHtbpAfIIA5dJh17uFL21EefBF2hY3YKuoFzKwfsATAMhW4G', 'Racer', 196),
('Dane__henderson@hotmail.com', '$2b$10$UwzWYSs8QyqIkFVsoH.kfOHGLs41SfewXbGmf7gO7za6zO6E/RcXG', 'Racer', 240),
('daniellepinkney@hotmail.com', '$2b$10$1CqeMSFq/EZk.JXEOPjNq.v5EXrvyze9BQvlLWMOxvmYtgm43zCIy', 'Racer', 150),
('dankharrington@gmail.com', '$2b$10$Ofsoo7c.F1UGw1evcwboSuAjmyxft2IMjJkCI2KQRt2dGBJvBq43W', 'Racer', 148),
('Danyelle.clark@hotmail.com', '$2b$10$CIMRzMWA/YpdnS84Rs0USeiXtm4IouEEZckjBng49XkIINXNjbiI6', 'Racer', 316),
('Darrin_Admin', '$2b$10$.2I0/oXGuaTl8FH/mFNQVeg8HmR1UcsK3ahHgyfLicKgugp7GAATO', 'Admin', NULL),
('David.w.leopold@gmail.com', '$2b$10$wLfFUI9ADIOXRtgHh6ttTuS/00AQKOPw4gTazUxtx4dlylzqyfJMu', 'Racer', 107),
('davidcharlesbeaver@hotmail.com', '$2b$10$D9XhCb9HGYAcIKpfQasto.cGjHM4IW92sgI1ULQrXFh/5zsTxfyOq', 'Racer', 179),
('davisons@ccrce.ca', '$2b$10$2MZ05PKjOQ.KRI2phNLeiumcr2hKLYxb2FXAlMiShx495HniDYcAS', 'Racer', 165),
('DawnDArcy', '$2b$10$bLW47cQWkqvbufH/9ol86.Nr1WfLliASR8MD12akn/Qy/UBrcm9ha', 'Volunteer', NULL),
('dianamatthews00@hotmail.com', '$2b$10$bpFq2JLeNimYSXbSTJyx9uS/PWqJK7rhd.1ADi87Sp0wRmDJNICQS', 'Racer', 236),
('dkinsman@hotmail.com', '$2b$10$O.wEZNJi050/Ueqsi7WhFOdF4p2ycoZyw/oZHtd1r0TI1ussNv9ha', 'Racer', 230),
('Drew', '$2b$10$u1SwZMF1esu28Ov58Qadg.mdcdTEvt35r2x.qHrV5k38JKG48SwtW', NULL, NULL),
('DrewD', '$2b$10$XBNgnqFmeNAHHaBklAlR0ezr1Admoj14CttLjMcpOkeqZeatVL3Eu', 'Volunteer', NULL),
('DrewDouglas', '$2b$10$fLmAOogPHKYWGrfQZ4vBpeTSgQ8EtzJKtUF2dZ.88jr869V9x9HTe', 'Volunteer', NULL),
('Drewrichard19@gmail.com', '$2b$10$18xZtNH/cjmGs1YHCqiwueMz9E7dBZUfNqnFUS63Ce008nL.6e1l6', 'Racer', 146),
('durningkellie@gmail.com', '$2b$10$zneKUCCmSYWXsuR1rUcVj.pR/03RLRUEeU1aTipplC.nh8q02fDQq', 'Racer', 222),
('easterntidesacu@gmail.com', '$2b$10$MASn9wW3FtJ/2vjY8MUaSu/sHPrxwz5.GpM3gVM74IkBYyj.PdUrK', 'Racer', 310),
('ed76cormier@hotmail.com', '$2b$10$f5eVryZ1/NUmy5FCB.zHY.Cvt1V/oWniWklkx0vQKDn2CCTdsGjkK', 'Racer', 174),
('ericjalbert@yahoo.com', '$2b$10$ZW/SMSpX6O.JFkZMeOi8DOvseHpeNoXBlJ.57U.DzgUo/EQ01aZNq', 'Racer', 160),
('ericrobertmcintyre@gmail.com', '$2b$10$Ge9v.PqR4WiDBOvJw9DkXuEjxJR8C8CS0EAhYINwl1l97obAxTUFy', 'Racer', 79),
('fitzgeraldjessica@hotmail.com', '$2b$10$6krB3KadcE17uiPo3oHh6uBmvjNu1VuvGJuG0V2r2tBJEB2pmIB1W', 'Racer', 304),
('Fraser.clark@dal.ca', '$2b$10$hvb24OxH.PJgcdIw77phZuJ3lh5f9/jS/WgubigRCRJAFKxdbLj5u', 'Racer', 125),
('Gailmacf@icloud.com', '$2b$10$0BbayD5xP.mZCNsHg5zdeOit/9BbmY3bWDWv3a3xPq.K8yl3yea.C', 'Racer', 115),
('General_Admin', '$2b$10$vwF88a2DTxLpUaRXjya6CuO0i66a9JWHu4b93ixlcO4S9.n01zgLW', 'Admin', NULL),
('ghislainsony@hotmail.com', '$2b$10$2s2TZ2L2dCC.t1E./hFO0etXryp8SQ18R27bHR3D/Of3d6J3DNE3e', 'Racer', 220),
('gouletar@gmail.com', '$2b$10$fuHVEj1p1a.R26KEuRAuvOCF7q2S8Zy.jnYGP7QVQBLlfciI4yjL2', 'Racer', 182),
('GraceSimms', '$2b$10$49fRzgHccFR71CWSNoOHV.eGqU/OuA8ruGwzvKNTs9lrLbcMrIpZW', 'Volunteer', NULL),
('greenerl@gnspes.ca', '$2b$10$rkwJQJ2ZlsehnbYNdazUmuFAMoBvoaDo3Nl1lGmO7/3NKsSVgeaae', 'Racer', 87),
('gregbarr@hotmail.com', '$2b$10$L/KdsC/YmzbzbWD794ABce9b.nGSzJHMytn4FC9i92297k2srs5fy', 'Racer', 126),
('gwzwicker@hotmail.com', '$2b$10$9qlKt3ILlrgMTtkVGfeuyOVzLxWyNvGO2BdsDegfdhFkU9DD/qgIi', 'Racer', 45),
('Heathermpeterson@hotmail.com', '$2b$10$3Psooj8rzDuw6TxNLS53PeMFR/6FcWcmZTC3X9j8uNi7GUhOuM0Xu', 'Racer', 210),
('Hodgkinsonneil@hotmail.com', '$2b$10$NW.v3TJlnAI1zwCitsFYc.nSnOSXziqsfWXU9Uq7jrsDPjttQjz2C', 'Racer', 273),
('hollyscothorn@hotmail.com', '$2b$10$nxDst2lwbZjPomRX0absO.G.9sa/exaY0cIevI3hoI5qx2PDeGdNq', 'Racer', 258),
('hubcycle@ns.aliantzinc.ca', '$2b$10$B2PCl3xanWbofmQ5Rltn.emCBvSY9WheJSdo7kpKutkPu1QhhfBtq', 'Racer', 100),
('Huntershaneelliott@gmail.com ', '$2b$10$wubnmCE7ZLfrW.BLk1/Z3uumrimQEdq1j9FKOxYEz0GnTpj2BMz1G', 'Racer', 290),
('igbhenderson@gmail.com', '$2b$10$0JE.P48iv.BH6tuAUDNiEu4zPwoUZiCFADfwZNXAIpK6.RzkHzfC2', 'Racer', 145),
('infosalon881@gmail.com', '$2b$10$M/HIKc/qKYxdTnsJzNfrbOkmhBAgPW18c1Z8jMIGXlxT105p.ihm2', 'Racer', 198),
('Irvingmichael82@gmail.com', '$2b$10$53Jau0kZ7xh6Bz9o6auj6./4OsGwRtNVhrbKD0dZhloFJx2aAx4mG', 'Racer', 297),
('Jackieanddonnie@gmail.com', '$2b$10$vI7UFmkE.99ePTnaWS87kOuSJF18MQ7/lk7stpnlYFrnrnyg8iVXS', 'Racer', 247),
('Jaclynijohnston@gmail.com', '$2b$10$bK2tWPAZgrlJagu4085ZLO08.LXXlzHm35IoYpHRN9HeX3qZU4pDm', 'Racer', 246),
('jayne6611@gmail.com', '$2b$10$goowb1JRUKm/rEKYVSJwie.1dntHvwBjJVHah5anFbV72UNJnlkl2', 'Racer', 332),
('jcottend@dal.ca', '$2b$10$TowRGNpXjWu4KBkYsePSqu/KCbdNLH6V0NGJhmfALtSw5d0rL412e', 'Racer', 242),
('Jdillman@eastlink.ca', '$2b$10$QwsgskjzUQ6fdvBoaLDk2OoM6fwa2FjaP7koqqVblY0Tyg7b74w3e', 'Racer', 218),
('jeff@bikemonkey.ca', '$2b$10$avOc5nHUTl4S8PSSDTnp..JQ52VuHwV/0Rc1bVz3oXrzsaQpMijGm', 'Racer', 187),
('jeffmackinnon2015@gmail.com', '$2b$10$MXFyM6gkcxJyUdsKisGpPOPuldlDiJ9KuWqoQWrKJQwTIOWU6v0MG', 'Racer', 111),
('jennturnbull@hotmail.com', '$2b$10$vCkA6X7bnEF48Zz/nEq1pu.R/i/cSe6V7a/zkWu4MDR6Elaxhg5rS', 'Racer', 264),
('jen_bartlett19@hotmail.com', '$2b$10$Jq5IU01T3D8VDMH3pgX.3.vZlYJIlvd9DxGrBTd8iIaUDEX.M5IVe', 'Racer', 44),
('jjbmoto@hotmail.com', '$2b$10$NJpEklxgK1nzARmdZ8WqGO2bkB0eX60T4Zfky2WZUwCLm0ki0wtnm', 'Racer', 186),
('joanna.macgillivary07@gmail.com', '$2b$10$6XLUYL8SC4LHvtut8y10aetuRYUmeCBQKL.QZenv2DKE9iSnDFyQa', 'Racer', 283),
('Jocelynlcox@hotmail.com', '$2b$10$p2h5K15n5b9Ep27WvwKkG.jlib7rQTjlo8RlEWFHamhXP4OwxM9DG', 'Racer', 226),
('jodybower@hotmail.com', '$2b$10$tMGp4.cK16uMKSxQgN4x9O83hAYwLsBLcLtD/yFePUYrw3BDVlfTW', 'Racer', 73),
('jonathanalanjulien@gmail.com', '$2b$10$fIjhDi1nzz9tUxipGvPrEO69Xj2F7kaMCsnFrc8gcDd/qWSaOeKHi', 'Racer', 331),
('josh.arenburg@nbpcd.com', '$2b$10$DwWsaxIiO4tnsQHHJ3KJk.MNTF40fwflaTyAKUKZY/cBtTcLdpzQe', 'Racer', 167),
('joshsampson1986@gmail.com', '$2b$10$Yv71snhe0ntsMYWg1Vsmgusr3/gx5ucLqYOZZQPxsJBFRvvG9QeeG', 'Racer', 219),
('j_bugden@hotmail.com', '$2b$10$/UiS8CFBBV/rklMV7u7/7Oa6tHAngESgrxQZ/.ICC0L6Ps42d.WY2', 'Racer', 325),
('karamacneil@gmail.com', '$2b$10$YP.GKrlP0ztg32Se2jWrI.FRqJhxQSnuvIL1v3yLYpys12x2dumD2', 'Racer', 78),
('Katie@kmfathletictherapy.com', '$2b$10$VZdF2bXYLkTFvPC1DPW/6uELot7KBuHnX6PLOQpoY/ZyQYuG3kmpO', 'Racer', 193),
('kelleyleil@gmail.com', '$2b$10$A5yw7UBvYPVuGag9ERGxYuyvtbSW3Y8xdWEYTyUvAe0Q6n3d864zS', 'Racer', 139),
('Kellie_Admin', '$2b$10$qA6Uce.0pt1uApWO/OGhmeSBlXFypl8pzRm81yOMbu/xB1xG5p/xu', 'Admin', NULL),
('Kerry_chisholm@hotmail.com', '$2b$10$XAxnVTr5uBLr5H.3yPct2.RmRHutp0RIkyItG/7sl.hGsixr7xdH2', 'Racer', 280),
('Kim', '$2b$10$Ay43HI3Wd0aDSiTOYjRt5O7NwaY9wHgjpEYmGrOIgllJkxG/bAWjG', 'Volunteer', NULL),
('kim.maccallum@outlook.com', '$2b$10$lQRiGVXEWlPnFIjtQ7uW0.Xc/aUBx8b2WYQZi4RYSIaHRizHprpJS', 'Racer', 158),
('kmacdonald7880@gmail.com', '$2b$10$UjOhJXszwyv8mv2X9XISXu.vS/U9WKlMsL2zQecEUBizbGGzLEl6i', 'Racer', 163),
('kpmacintosh@rogers.com', '$2b$10$di9c7eXni70.7/Y3g1sXAOtR2ide13fzXJmiwz3ezVW2FLQkuodq.', 'Racer', 64),
('Krista.mikail@nshealth.ca', '$2b$10$G367I/YsDR8YPTpOUT/UmOkLiSCEIU42af54TKu7SePcqJWR6RKZ2', 'Racer', 232),
('Krystleclyke@gmail.com', '$2b$10$ksCL3Zhm/o9FrKhFIBrXMebcy/tw35AFVuVmHhfcPkYYq8QeUjEOe', 'Racer', 199),
('ktmacneil@live.ca', '$2b$10$I9NvP2.iQ/2VuMiucZ8.6eUVQC54ZQsbxDv900p.gz4rLIs1UXnmq', 'Racer', 133),
('kymber07@hotmail.com', '$2b$10$oBxJTqv/46Jpn7rhIIXroO3fIzZQENZqjgInKRoi7J679pOvmvKoW', 'Racer', 284),
('kymber1980@icloud.com', '$2b$10$ngadGsa/8kx4xIn/mBexjucgF8dmjZv8K96pz5uHUTEKHXir1oqwC', 'Racer', 285),
('laurajmacl1@gmail.com', '$2b$10$WTJmzUVFXy7XZhPCKLekBer8rc7IPQSXRqwVlEdg1iEjEsgSwjN.K', 'Racer', 201),
('leahbenoit27@gmail.com', '$2b$10$WxXYsYrVD5lPWPleAr6yD.Yw37C3H9.LcvEdimdHFIoDnEX2mWVY2', 'Racer', 300),
('lexmclaughlin7@gmail.com', '$2b$10$lkTKOS8GYs0wmLxKerib6.BZx3.1anZmtIsqHJHs9R3Z9GKGW4p9.', 'Racer', 243),
('LindsayC', '$2b$10$Ph9Nrh4AsxQYhXVcBhaxFu7/ZhWGXEgmWlXYwV0ebMM32QQFWkGfW', 'Volunteer', NULL),
('LindsayCummings', '$2b$10$38Za//H1c1OTSxmbj8GXsOKJl5bEE5l3QTMgLhpC4ZMp2XSKCdqNO', 'Volunteer', NULL),
('lindsaymcumming@gmail.com', '$2b$10$FrXOIzjCvla6nfy3gvAK/OzoFhLjjrWM5A/13aGvqrv8HoIuwfFaO', 'Racer', 105),
('lindsaymountain@gmail.com', '$2b$10$fXVGjtFQ50cpEBDxj4tyb.Tr/SY5GE02RYcrCcp7nrwWjFDGEhDk2', 'Racer', 83),
('lisa74gavin11@gmail.com', '$2b$10$QPC2G61q25bu.4L4zu/wAO1xlmFCGoMC9EOfJHhutSE.1hdGpQAiO', 'Racer', 248),
('Locheada@mcft.ca', '$2b$10$xY2xU9V3TXXamoxsiAfQlODpaVZFM7IGOVG83BJL0Ar4M7T.79fpi', 'Racer', 326),
('lubasy@gmail.com', '$2b$10$ALWtgoh7qOnkXEv1UYaqZuFrRq04/VbhfWzDWIsQ4wsYS9IvkgW3e', 'Racer', 217),
('Macdonki625@gmail.com', '$2b$10$NyV/lBwmhota3Jx3rC7lX.Co8/aRMjXlVnt00Dzi/JVrMhs8c7J3K', 'Racer', 294),
('mackinnon_393@hotmail.com', '$2b$10$59nlUyStS1VwtBvFE9R1geaZserng4iWHQO2IKcw0ZBw3qqqkVtUC', 'Racer', 54),
('mandyraye19@hotmail.com', '$2b$10$eDvuoV.SDYBjzCsFh.rkhOCS9vtfjXzm2nXU.Dv8GEgq6RQB9nRyK', 'Racer', 53),
('marissa_peers@hotmail.com', '$2b$10$ILcf5T0pHgdWfJhmxFnlauvNEvWHVhpuMWMrqB3xBsYm7ZFH8xHK.', 'Racer', 99),
('Mark.e.macisaac@gmail.com', '$2b$10$Ll1cMefkkzTkvZ8BPEA21uCh6ytCV1Oxhi7YHUvZ76YInsIWd9lLy', 'Racer', 330),
('mason.trucking@ns.sympatico.ca', '$2b$10$GMyh4.Hg7qv54vNaMDF6rOWwTHUsLL1xAGnz1fZVVS8/YSrRqfSvi', 'Racer', 88),
('Matthew.white@northernpulp.com', '$2b$10$1cQkXmeC8KwH52lRbsOK.ucvZ7MlubDKmTuHFjLzbR7dMCXUs2pju', 'Racer', 189),
('matthewcoulter271@gmail.com', '$2b$10$hE4B89IA.KeU3cGfnxuyFec2b2e4VqMKR1CttdNdJgldXgQiJUvkO', 'Racer', 200),
('Matt_Admin', '$2b$10$9sbn3QOs.0694XqqAt/0p./7xB5oP8d4AwtaZku/WMgoUT3b1Q0RG', 'Admin', NULL),
('Mayamhoehne@gmail.com', '$2b$10$NQs0wjfyp5uun5z3SiqhT.9M4YlrCKgJOVMQpn9lgbi62fDNZSjMm', 'Racer', 259),
('mcschooten@gmail.com', '$2b$10$FrXOIzjCvla6nfy3gvAK/OzoFhLjjrWM5A/13aGvqrv8HoIuwfFaO', 'Racer', 231),
('meagandoucet@outlook.com', '$2b$10$ZTdKOnzVboIOfmMs8wGqleg4GjYrsPXrI75m/.eZfD2KZ/8iEiOZ6', 'Racer', 43),
('Mechanic7@hotmail.com', '$2b$10$0R/SJ5DXgOFaQmSkC/Hu.u9ef/teL9s69EwY5V0DIqzIV6/HFECh.', 'Racer', 301),
('megansfitz@gmail.com', '$2b$10$M5T3OEaNygPvZS5gsL6YxuAbjsQtkDU4AVnjDqBI/3gr0CYHQQ5HS', 'Racer', 311),
('melnettleton@gmail.com', '$2b$10$kdOL0O2ifIz89N2TpuqTzed1gblzH8sCZZZ1if3BTHUOkjnUKUWLS', 'Racer', 214),
('mhanes@pvlmoving.com', '$2b$10$xM0lmGmvFG4Q6nWb5s2.iu.ubGumviAo0Lx8hXVl3bMnpPf0MwoVq', 'Racer', 192),
('michelle_dillman@outlook.com', '$2b$10$lenmd1kq7pAvEm7RkCl1KelfHA7Cy2bM7JGum/oKkR3euA/uiOcdm', 'Racer', 279),
('MikeK', '$2b$10$1PHZ91Q5WMM079nvquzJS.5Fd40dLPrkpzyt0AEsySJy0AaloVyNm', 'Volunteer', NULL),
('misti.lamont@bellmedia.ca', '$2b$10$8h5Eo.hYZlApG/Y09XlzEue2wxGJFgETMwIwB3Kl0hGpRRY4f0NcO', 'Racer', 82),
('mjsutherland7@icloud.com ', '$2b$10$obxlNUJswUK.880SwLZzwOyQKeqiVp0uC5ITIxaTn6W98NlJ8gdUa', 'Racer', 134),
('mtparkerhouse@hotmail.com', '$2b$10$bVKzw3QeB0eqydeVkTwszeDP6YzB6iIaJ7NBhwwUa/IBY.Yr/5ZXu', 'Racer', 212),
('myorke72@hotmail.com', '$2b$10$j1ks/8OQgpnBVepv68es6.oPxx2pfwCqt/0V3eYMG1AZ57nrJ9B/G', 'Racer', 58),
('nancy_chestnut@hotmail.com ', '$2b$10$kes8oXw0LwPaAxH77c8c/.rs8z.tcp6cm8QXsi/yqO6.YRxxoQHga', 'Racer', 177),
('ncrowe99@gmail.com', '$2b$10$YYRytxp8B8B91UBXsB9CduZevwn69r881Dc3jtg6GVsz8ZgG4Gj1C', 'Racer', 81),
('ndouglas@dfpei.pe.ca', '$2b$10$kzaaNLx0h6IzXqB5CcG38uZaXyhOfJlr93G0GFOwRKxjdhKhDIs/u', 'Racer', 141),
('nickfisher@eastlink.ca', '$2b$10$rQKXw.XatqZ0P3Yh3YjR1.Ov4eRlll2itrMEqP4LZt30pVuiDSg.q', 'Racer', 268),
('nicole.ryan.xo@hotmail.com', '$2b$10$tY0rpdZYvy7zFVfbBuhfI.i0R69/aVwA3.XVFNz1xtac4aCDHBvgK', 'Racer', 286),
('nigebrooks@yahoo.com', '$2b$10$gMd0SllBTxKaq2c70NEmS.USDfDLpKRnR77TSXtYa6xu9Q.t3muWm', 'Racer', 254),
('NigelB', '$2b$10$CDGO2WoiPppu5pWJ4HYHy.pJXWkgBrJEWSuRNHVzQkoE.gQBb4QI6', 'Volunteer', NULL),
('njess21@hotmail.com', '$2b$10$DZZrbUINwAfhVzPP5.9bG..IQ2l..jT4Re7kT97fGYk00NpvoYyYK', 'Racer', 312),
('noah@ursudio.com', '$2b$10$CbBFIZDk8rGPXaNd7DBBqO2Fa0mVbBh6rz5hg9JBSW/ygPbzqKAP6', 'Racer', 149),
('Nolterkj@ccrce.ca', '$2b$10$Q8kSDVrA0.3M6FNXbXov/.pdaP2kFFglmbk4SR9rtUBMg7bk20Ud2', 'Racer', 291),
('november_23@hotmail.com', '$2b$10$rrVA1fyMwjMscmflobzG5.8V8z9bXoI2hPDX63N7bT4k2zK/qAo5y', 'Racer', 113),
('nupatterson@gmail.com', '$2b$10$fpLE7bLx9J7nI.f1MYD3c.MWuMc5zBnOmyt2Gn9FKRJnPLPe2RHju', 'Racer', 322),
('Oconnellchris102@gmail.com', '$2b$10$7M66aZ0dn0UBDh0j254MOOG1S1qhHDvAlSBnK1e56T2CaU7ewcD/K', 'Racer', 221),
('pattyfoster@hotmail.com', '$2b$10$JU7YrwHZBDsN.IrLj946dOph7Jfyrn7ZWcAY8vetDEg3QgR8.r0Zi', 'Racer', 147),
('PeteH', '$2b$10$3JyvMgAyr39QNk2ptfIViOKk5htBXk7sJPWRNxcnBZlfdeQoUTGGe', 'Volunteer', NULL),
('PeterHenderson', '$2b$10$sEsNuw.k4XzRCGcFnQcUaOScBslLiWvsnojtBHDidWeK2vC6JG5nC', 'Volunteer', NULL),
('ppatterson@ljpattersonsales.com', '$2b$10$/UBzIvVdBJzm8KEy4PqSCOx69RKsdQdfzLYjPwReC7gN4kgFVuFpa', 'Racer', 114),
('Pwillcott@hotmail.com', '$2b$10$.w7tUGUHYtQDC2/ZN7u5LO1VbCsiRX1Li.YrqU3yXJvv..c/V9XNO', 'Racer', 173),
('rachbeat@gmail.com', '$2b$10$t98e97uOa1F7N8IRCasJuewgvvyvIrt.HRBNrjdDHQXaBZTdpq9pG', 'Racer', 228),
('Randal.r.gray@gmail.com ', '$2b$10$b0rtzFuQ2iPQMWfKlzhXYeXLRZzv8JS.N7fJzhANdfd5GhLdNlzpm', 'Racer', 119),
('rcheverie@perennia.ca', '$2b$10$4c4FvDZ012k70IO3B2Fub.O0sQTQkO7hUMnu7OqE42oj36tkuFK7y', 'Racer', 68),
('rebecca_worthington@hotmail.ca', '$2b$10$NYHnCz/nEVskfi/jzUCVQOQcINmOt4T./fEfyOpV70iqbS1cgl/2q', 'Racer', 314),
('redmondmj@gmail.com', '$2b$10$FrXOIzjCvla6nfy3gvAK/OzoFhLjjrWM5A/13aGvqrv8HoIuwfFaO', 'Racer', 30),
('redmondo', '$2b$10$KR7NqajSzxdD0vgYq0qmxuHAdkSpOCmdWleq7rE2D0cEzC5AcSgiy', 'Volunteer', NULL),
('rejean.comeau@nshealth.ca', '$2b$10$N2n0JP1L.7bn4H3EBlHMPOzJzf8vTFl7WQOrolZcm5609JL9xiRvK', 'Racer', 50),
('rf_1970@hotmail.com', '$2b$10$YIDkIThuP71F48fSok0vF.4Xmhbb8FeJxDWHX5x8COlm3v62PscYa', 'Racer', 207),
('rmacgregor9@gmail.com', '$2b$10$YqZErFbZoKHVj93p.e01FeGAS5LmoSTD3Rni8KkOqfSSbu2cr/pSu', 'Racer', 108),
('robins676@hotmail.com', '$2b$10$3SAT2.OgsQWjBCu9B7b1V.w6B38fZpA6SxMmor49kOo2DQ30Ib/e.', 'Racer', 104),
('roddie.maclean72@gmail.com', '$2b$10$EEv6o5ckML4FKTQAjfsZ7.tNUXeWugqH2pwoF6sqWBFckOvnv4hN.', 'Racer', 101),
('rosko54@msn.com', '$2b$10$oBsieLJQxMf7cgaUS3qIMu1AfLNl7XoOR6XEsIqNiKdg6QZCd0Pra', 'Racer', 98),
('Ryanfarris78@gmail.com', '$2b$10$gW9gL0CTeD.d/20erFcXN.8n/stIE8LHA/b4.e8ZODcRE6r0mFB2y', 'Racer', 309),
('RyanGrant', '$2b$10$ktfeU6RnMkU./yfIWDZLNO..tEoTqRdQyXFKCmRwT0LIhVeivWWbm', 'Volunteer', NULL),
('ryslobster@hotmail.com', '$2b$10$6f.RyJZFyAcG42Z3RaZQVO2tGhJlI4xNl7QlqPCRh.ju5fKV1UZeO', 'Racer', 89),
('samanthamoore8@outlook.com', '$2b$10$8AcMt0HPDzxW/R5xcBsrLerUakTDpvQO5nndiLXI8zL9jOW3yUv56', 'Racer', 52),
('sambeafarm@gmail.com', '$2b$10$pOJKFgv.soAUE7WRc4idC.QuQxXqfh19g4E3bD9vqS1JjtUuQkDxK', 'Racer', 307),
('sarahcrossman7@hotmail.com', '$2b$10$BxPSqLFZLcDOaT6DQw7HyuRAGimYBaIhchrY2tXT0OE8HghVx1BIm', 'Racer', 56),
('sarahmeekins@gmail.com', '$2b$10$NOTIGqsF2TWJca0VSvcvke0ATf8Ag2gYW6CpQVY3kEZBRNtX22dXK', 'Racer', 132),
('shali.manuel@gmail.com', '$2b$10$H2HcRmo7SOmxUhVMIWtH8.KSpRqb5u6LQBbA3F2sk4Ji1x5P1oFAS', 'Racer', 120),
('shannonraerobertson@gmail.com', '$2b$10$LfJTJEOcoj/AoLW./LOhOuqz7Dzq/hq0lPz/Aa334.m3/Enbwz8im', 'Racer', 127),
('sheina.young@gmail.com', '$2b$10$WqNcNp7eYtBZhz4knnkXH.GnpBOcv7M/fxi/jMExjPJDTzSiToQ7m', 'Racer', 143),
('shipleyc@ccrce.ca', '$2b$10$i1nCFE3WuS5b/mr2IJpvS.7AwuloxRXLwqXnvun.9maXPpgScXSgC', 'Racer', 140),
('sizzler@eastlink.ca', '$2b$10$SGpazC0BvcESlGQ5yk6zKu5dtz.NE7rgE4OEcnrtjnVJdkRZAYY7u', 'Racer', 155),
('sn.green13@gmail.com', '$2b$10$LcU12VJcMnizMt7iY2x22OadeychpBMT5lwEMRVMN/QcWAC5D.JFW', 'Racer', 329),
('stephanielpalmer@eastlink.ca', '$2b$10$zT9xXQ.4UzYKZhb.95xWsuoToiaRVkAGqidZIa0MGi4aIC68KG6y6', 'Racer', 276),
('sue-ellensheppard@hotmail.com', '$2b$10$kK7kHQV5YqvBfqr/gSye9OrU/0pqz3Kn0moTg5J9Tjou3zxOzGPKq', 'Racer', 299),
('Swim_roberts@hotmail.com', '$2b$10$76T0Ew/JPqqf0iNmRZUZmO0mgf4WCVdlE7ep3R5Cx70rln1nf8ZCu', 'Racer', 65),
('swinks@hotmail.com', '$2b$10$q5EnfUIUc/GLEBxyUOTUNu4HZZSlpc8eY37MCim7VZJRrlsrnnNnm', 'Racer', 249),
('tania_oleary@hotmail.com', '$2b$10$ezeG4zQ7K.yfxw6xWntzUerlx8G74cTlbwrjLRd1SCm4S91jFh7xi', 'Racer', 317),
('thomaskayter@gmail.com', '$2b$10$F2CNrm7RVjFC/p88uZY3Fu3YFh6WMiYG6pnY1T1EfqtOBMlDjdg/O', 'Racer', 275),
('Thor_Admin', '$2b$10$e2Yai1YhEfztFqMGW2pGyOh7mcED10aHRVUz9si/ye0B5NrbPh9Eq', 'Admin', NULL),
('Tina_Admin', '$2b$10$eXkCZW5veejLvR0.OqmD5.3Pf90pnNZ9V26qVztMADXaSW28qFFnG', 'Admin', NULL),
('tlutzcam@ns.sympatico.ca', '$2b$10$R.hEFVDmueTPfh/nbKw4POXRi2UYm.ETbanwUQ6AKxDjesws9x0lm', 'Racer', 122),
('toddcroft1@gmail.com', '$2b$10$NIFu2JeBQCJvFRdlFJeY4OFXK3DI5zAbiAV5Rpop1SoC46G6ekI1y', 'Racer', 203),
('tom.hahn@eastlink.ca', '$2b$10$NZZ/6OeDEOiAWA3ZsqcZk.LOyq3OrBl.d1DJ0wS8dQ6ZQS3Y7yfhG', 'Racer', 161),
('tom_malone_11@hotmail.com', '$2b$10$zCOTfJXRoT/VT7HhSB/oLepRLdxYh0eBZT3UIsaqhm2NptZDqCBYu', 'Racer', 324),
('Tuckera84@hotmail.com', '$2b$10$4TZSOejIDA18Jt3of4aUqumOWgfpNuV/C5qlpdZIeDyX6IELBy3hy', 'Racer', 234),
('vandenburgfamily@outlook.com', '$2b$10$M93uzXuPvvN3Ypn2cGDYfe7Qrnj7UTCMpV/ErRvOMYVN5C0JS3Chm', 'Racer', 281),
('vanessafraser26@hotmail.com', '$2b$10$22FqFXzOzpyyyjGbvQbjy.gYXy8H7tKaLrOb1bwkZu3d2rDMFea8q', 'Racer', 335),
('Vckyfields@gmail.com', '$2b$10$3GzaXB3JR3G2NBKedCdwmuwPY5Rl41HjQeYYfdMvUQSwfamTlOcvi', 'Racer', 206),
('wendypratt2008@gmail.com', '$2b$10$vUf2siY0.cDUjMl7Ua25SOD/IJkHxHPHJLX7gmYG.J1kSVrxFX8tS', 'Racer', 208),
('wesley_mcneil@yahoo.ca ', '$2b$10$BCGOmHKIHLmEVEhIdNIqdOEYz9bda0hbTOCHH9lW95VgCFhBlFJva', 'Racer', 336),
('wilkie2d@gmail.com', '$2b$10$5vm78F/s6jwdIdF20Al5S.TJGRWh9oZ90TpL81GX5EJfeO4aKoQ4.', 'Racer', 318);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_paypal`
--
ALTER TABLE `tbl_paypal`
  ADD PRIMARY KEY (`price`);

--
-- Indexes for table `tbl_racers`
--
ALTER TABLE `tbl_racers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_results`
--
ALTER TABLE `tbl_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`username`),
  ADD KEY `Racers` (`racerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_racers`
--
ALTER TABLE `tbl_racers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=338;

--
-- AUTO_INCREMENT for table `tbl_results`
--
ALTER TABLE `tbl_results`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD CONSTRAINT `Racers` FOREIGN KEY (`racerID`) REFERENCES `tbl_racers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
