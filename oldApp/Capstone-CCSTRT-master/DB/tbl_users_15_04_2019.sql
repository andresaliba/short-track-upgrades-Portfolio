# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.38)
# Database: ccstrt
# Generation Time: 2019-04-15 18:44:11 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table tbl_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_users`;

CREATE TABLE `tbl_users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `racerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `Racers` (`racerID`),
  CONSTRAINT `Racers` FOREIGN KEY (`racerID`) REFERENCES `tbl_racers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;

INSERT INTO `tbl_users` (`username`, `password`, `type`, `racerID`)
VALUES
	('Darrin_Admin','$2b$10$PZDOCgSXpyvJEmKLvvymkejIFI3.2fNAps3sjQQss2GcSiVWSE76u','Admin',NULL),
	('General_Admin','$2b$10$BjZL.CxP6jkvU4VoferCZOwXyYk8GV9IBa.WpeOQFoAE2sqLkRtjm','Admin',NULL),
	('Tina_Admin','$2b$10$1Qq5rSVC0EQqhKrO3qmRJemrT8kWRLegvGZi4iX90Ke8giK9qklRu','Admin',NULL);

/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
