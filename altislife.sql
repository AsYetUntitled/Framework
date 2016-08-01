SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
--
-- Compatible with newer MySQL versions. (After MySQL-5.5)
-- This SQL uses utf8mb4 and has CURRENT_TIMESTAMP function.
--


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `altislife`
-- Default Schema
--
CREATE DATABASE IF NOT EXISTS `altislife` DEFAULT CHARACTER SET utf8mb4;
USE `altislife`;

--
-- Drop procedures to ensure no conflicts
--
DROP PROCEDURE IF EXISTS `resetLifeVehicles`;
DROP PROCEDURE IF EXISTS `deleteDeadVehicles`;
DROP PROCEDURE IF EXISTS `deleteOldHouses`;
DROP PROCEDURE IF EXISTS `deleteOldGangs`;
DROP PROCEDURE IF EXISTS `deleteOldContainers`;

DELIMITER $$
--
-- Procedures
-- Edit arma3 to match a user in MySQL
-- For external databases: Edit localhost to match arma3server IP
--

CREATE DEFINER=`arma3`@`localhost` PROCEDURE `resetLifeVehicles`()
BEGIN
  UPDATE `vehicles` SET `active`= 0;
END$$

CREATE DEFINER=`arma3`@`localhost` PROCEDURE `deleteDeadVehicles`()
BEGIN
  DELETE FROM `vehicles` WHERE `alive` = 0;
END$$

CREATE DEFINER=`arma3`@`localhost` PROCEDURE `deleteOldHouses`()
BEGIN
  DELETE FROM `houses` WHERE `owned` = 0;
END$$

CREATE DEFINER=`arma3`@`localhost` PROCEDURE `deleteOldGangs`()
BEGIN
  DELETE FROM `gangs` WHERE `active` = 0;
END$$

CREATE DEFINER=`arma3`@`localhost` PROCEDURE `deleteOldContainers`()
BEGIN
  DELETE FROM `containers` WHERE `owned` = 0;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `aliases` text NOT NULL,
  `playerid` varchar(64) NOT NULL,
  `cash` int(100) NOT NULL DEFAULT '0',
  `bankacc` int(100) NOT NULL DEFAULT '0',
  `coplevel` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
  `mediclevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `civ_licenses` text NOT NULL,
  `cop_licenses` text NOT NULL,
  `med_licenses` text NOT NULL,
  `civ_gear` text NOT NULL,
  `cop_gear` text NOT NULL,
  `med_gear` text NOT NULL,
  `civ_stats` varchar(32) NOT NULL DEFAULT '"[100,100,0]"',
  `cop_stats` varchar(32) NOT NULL DEFAULT '"[100,100,0]"',
  `med_stats` varchar(32) NOT NULL DEFAULT '"[100,100,0]"',
  `arrested` tinyint(1) NOT NULL DEFAULT '0',
  `adminlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `donorlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `civ_alive` tinyint(1) NOT NULL DEFAULT '0',
  `civ_position` varchar(64) NOT NULL DEFAULT '"[]"',
  `playtime` varchar(32) NOT NULL DEFAULT '"[0,0,0]"',
  `insert_time` timestamp DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `playerid` (`playerid`),
  KEY `name` (`name`),
  KEY `blacklist` (`blacklist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `side` varchar(16) NOT NULL,
  `classname` varchar(64) NOT NULL,
  `type` varchar(16) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `plate` int(20) NOT NULL,
  `color` int(20) NOT NULL,
  `inventory` text NOT NULL,
  `gear` text NOT NULL,
  `fuel` double NOT NULL DEFAULT '1',
  `damage` varchar(256) NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `side` (`side`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `houses`
-- Needed for extDB latest update on git
--

CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `owned` tinyint(1) DEFAULT '0',
  `garage` tinyint(1) NOT NULL DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `gangs`
-- Needed for extDB latest update on git
--

CREATE TABLE IF NOT EXISTS `gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `members` text,
  `maxmembers` int(3) DEFAULT '8',
  `bank` int(100) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `containers`
-- Needed for extDB latest update on git
--

CREATE TABLE IF NOT EXISTS `containers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(32) NOT NULL,
  `classname` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text NOT NULL,
  `gear` text NOT NULL,
  `dir` varchar(128) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `owned` tinyint(1) DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4;

-- --------------------------------------------------------

--
-- Table structure for table `wanted`
-- Needed for extDB latest update on git
--

CREATE TABLE IF NOT EXISTS `wanted` (
  `wantedID` varchar(64) NOT NULL,
  `wantedName` varchar(32) NOT NULL,
  `wantedCrimes` text NOT NULL,
  `wantedBounty` int(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`wantedID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `economy`
-- Needed for extDB latest update on git
--

CREATE TABLE IF NOT EXISTS `economy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource` varchar(50) NOT NULL,
  `buyprice` int(12) NOT NULL DEFAULT '1',
  `sellprice` int(12) NOT NULL DEFAULT '1',
  `varprice` int(12) NOT NULL DEFAULT '1',
  `maxprice` int(12) NOT NULL DEFAULT '1',
  `minprice` int(12) NOT NULL DEFAULT '1',
  `factor` int(12) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`, `resource`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1;

INSERT INTO `economy` VALUES (1,'pickaxe',750,350,1,350,350,0);
INSERT INTO `economy` VALUES (2,'defibrillator',900,450,1,450,450,0);
INSERT INTO `economy` VALUES (3,'toolkit',350,100,1,100,100,0);
INSERT INTO `economy` VALUES (4,'fuelEmpty',-1,10,1,10,10,0);
INSERT INTO `economy` VALUES (5,'fuelFull',850,500,1,500,500,0);
INSERT INTO `economy` VALUES (6,'spikeStrip',2500,1200,1,1200,1200,0);
INSERT INTO `economy` VALUES (7,'lockpick',150,75,1,75,75,0);
INSERT INTO `economy` VALUES (8,'goldbar',-1,95000,95,114000,47500,1);
INSERT INTO `economy` VALUES (9,'blastingcharge',35000,10000,1,10000,10000,0);
INSERT INTO `economy` VALUES (10,'boltcutter',7500,1000,1,1000,1000,0);
INSERT INTO `economy` VALUES (11,'defusekit',2500,2000,1,2000,2000,0);
INSERT INTO `economy` VALUES (12,'storagesmall',75000,50000,1,50000,50000,0);
INSERT INTO `economy` VALUES (13,'storagebig',150000,125000,1,125000,125000,0);
INSERT INTO `economy` VALUES (14,'oil_unprocessed',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (15,'oil_processed',-1,3200,3,3840,1600,2);
INSERT INTO `economy` VALUES (16,'copper_unrefined',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (17,'copper_refined',-1,1500,2,1800,750,2);
INSERT INTO `economy` VALUES (18,'iron_unrefined',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (19,'iron_refined',-1,3200,3,3840,1600,2);
INSERT INTO `economy` VALUES (20,'salt_unrefined',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (21,'salt_refined',-1,1450,1,1740,725,2);
INSERT INTO `economy` VALUES (22,'sand',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (23,'glass',-1,1450,2,1740,725,2);
INSERT INTO `economy` VALUES (24,'diamond_uncut',-1,750,1,750,750,0);
INSERT INTO `economy` VALUES (25,'diamond_cut',-1,2000,2,2400,1000,2);
INSERT INTO `economy` VALUES (26,'rock',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (27,'cement',-1,1950,2,2340,975,2);
INSERT INTO `economy` VALUES (28,'heroin_unprocessed',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (29,'heroin_processed',3500,2560,2,3072,1280,1);
INSERT INTO `economy` VALUES (30,'cannabis',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (31,'marijuana',2800,2350,2,2820,1175,1);
INSERT INTO `economy` VALUES (32,'cocaine_unprocessed',-1,-1,1,-1,-1,0);
INSERT INTO `economy` VALUES (33,'cocaine_processed',7000,5000,4,6000,2500,1);
INSERT INTO `economy` VALUES (34,'redgull',1500,200,1,200,200,0);
INSERT INTO `economy` VALUES (35,'coffee',10,5,1,5,5,0);
INSERT INTO `economy` VALUES (36,'waterBottle',10,5,1,5,5,0);
INSERT INTO `economy` VALUES (37,'apple',65,50,1,60,25,2);
INSERT INTO `economy` VALUES (38,'peach',68,55,1,66,27,2);
INSERT INTO `economy` VALUES (39,'tbacon',75,25,1,25,25,0);
INSERT INTO `economy` VALUES (40,'donuts',120,60,1,60,60,0);
INSERT INTO `economy` VALUES (41,'rabbit_raw',-1,95,1,114,47,3);
INSERT INTO `economy` VALUES (42,'rabbit',150,115,1,115,115,0);
INSERT INTO `economy` VALUES (43,'salema_raw',-1,45,1,54,23,3);
INSERT INTO `economy` VALUES (44,'salema',75,55,1,55,55,0);
INSERT INTO `economy` VALUES (45,'ornate_raw',-1,40,1,48,20,3);
INSERT INTO `economy` VALUES (46,'ornate',175,150,1,150,150,0);
INSERT INTO `economy` VALUES (47,'mackerel_raw',-1,175,1,210,88,3);
INSERT INTO `economy` VALUES (48,'mackerel',250,200,1,200,200,0);
INSERT INTO `economy` VALUES (49,'tuna_raw',-1,700,1,840,350,3);
INSERT INTO `economy` VALUES (50,'tuna',1250,1000,1,1000,1000,0);
INSERT INTO `economy` VALUES (51,'mullet_raw',-1,250,1,300,125,3);
INSERT INTO `economy` VALUES (52,'mullet',600,400,1,400,400,0);
INSERT INTO `economy` VALUES (53,'catshark_raw',-1,300,1,360,150,3);
INSERT INTO `economy` VALUES (54,'catshark',750,500,1,500,500,0);
INSERT INTO `economy` VALUES (55,'turtle_raw',-1,3000,6,3600,1500,1);
INSERT INTO `economy` VALUES (56,'turtle_soup',1000,750,1,750,750,0);
INSERT INTO `economy` VALUES (57,'hen_raw',-1,65,1,78,33,3);
INSERT INTO `economy` VALUES (58,'hen',115,85,1,85,85,0);
INSERT INTO `economy` VALUES (59,'rooster_raw',-1,65,1,78,33,3);
INSERT INTO `economy` VALUES (60,'rooster',90,85,1,85,85,0);
INSERT INTO `economy` VALUES (61,'sheep_raw',-1,95,1,114,48,3);
INSERT INTO `economy` VALUES (62,'sheep',155,115,1,115,115,0);
INSERT INTO `economy` VALUES (63,'goat_raw',-1,115,1,138,58,3);
INSERT INTO `economy` VALUES (64,'goat',175,135,1,135,135,0);

-- --------------------------------------------------------

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
