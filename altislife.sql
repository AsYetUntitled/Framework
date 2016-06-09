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
  `minprice` int(12) NOT NULL DEFAULT '1',
  `maxprice` int(12) NOT NULL DEFAULT '1',
  `factor` int(12) NOT NULL DEFAULT '1',
  `shoptype` varchar(50) NOT NULL,
  PRIMARY KEY (`id`, `resource`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1;

INSERT INTO `economy` VALUES (1, 'apple', 200, 150, 1, 50, 150, 3, 'market');
INSERT INTO `economy` VALUES (3, 'heroin_processed', 4500, 2798, 2, 1480, 4050, 2, 'drugdealer');
INSERT INTO `economy` VALUES (12, 'turtle_raw', 17000, 9918, 2, 6390, 15000, 0, 'raw');
INSERT INTO `economy` VALUES (13, 'waterBottle', 10, 10, 2, 5, 10, 0, 'market');
INSERT INTO `economy` VALUES (15, 'turtle_soup', 2500, 2500, 2, 1000, 2500, 0, 'wongs');
INSERT INTO `economy` VALUES (17, 'marijuana', 4000, 2728, 2, 1480, 3500, 2, 'drugdealer');
INSERT INTO `economy` VALUES (18, 'tbacon', 500, 25, 2, 25, 500, 0, 'market');
INSERT INTO `economy` VALUES (19, 'lockpick', 1500, 1500, 2, 75, 1500, 0, 'rebel');
INSERT INTO `economy` VALUES (20, 'redgull', 1500, 1500, 2, 200, 1500, 0, 'market');
INSERT INTO `economy` VALUES (21, 'peach', 175, 50, 2, 50, 150, 3, 'market');
INSERT INTO `economy` VALUES (29, 'glass', 3000, 3000, 2, 1000, 3000, 3, 'glass');
INSERT INTO `economy` VALUES (30, 'fuelFull', 850, 850, 2, 300, 850, 0, 'market');
INSERT INTO `economy` VALUES (31, 'spikeStrip', 2500, 2500, 2, 1200, 2500, 0, 'cop');
INSERT INTO `economy` VALUES (33, 'goldbar', 100000, 95000, 150, 35000, 95000, 2, 'gold');
INSERT INTO `economy` VALUES (34, 'blastingcharge', 35000, 24996, 2, 15000, 35000, 0, 'rebel');
INSERT INTO `economy` VALUES (35, 'boltcutter', 7500, 7500, 2, 3000, 7500, 0, 'rebel');
INSERT INTO `economy` VALUES (36, 'defusekit', 2500, 2500, 2, 1500, 2500, 0, 'cop');
INSERT INTO `economy` VALUES (37, 'storagesmall', 75000, 70878, 2, 60000, 75000, 0, 'market');
INSERT INTO `economy` VALUES (38, 'storagebig', 150000, 131172, 2, 120000, 150000, 0, 'market');
INSERT INTO `economy` VALUES (39, 'pickaxe', 750, 750, 2, 500, 750, 0, 'market');
INSERT INTO `economy` VALUES (45, 'oil_unprocessed', 3500, 1500, 2, 500, 1500, 0, 'raw');
INSERT INTO `economy` VALUES (46, 'oil_processed', 3500, 3000, 2, 1500, 3000, 3, 'oil');
INSERT INTO `economy` VALUES (47, 'copper_unrefined', 150, 150, 2, 59, 150, 0, 'raw');
INSERT INTO `economy` VALUES (48, 'copper_refined', 3000, 2500, 2, 1000, 2500, 3, 'iron');
INSERT INTO `economy` VALUES (49, 'iron_unrefined', 150, 150, 2, 57, 150, 0, 'raw');
INSERT INTO `economy` VALUES (50, 'iron_refined', 3000, 2500, 2, 1000, 2500, 3, 'iron');
INSERT INTO `economy` VALUES (51, 'salt_unrefined', 150, 150, 2, 57, 150, 0, 'raw');
INSERT INTO `economy` VALUES (52, 'salt_refined', 3000, 2200, 2, 1000, 2500, 3, 'salt');
INSERT INTO `economy` VALUES (53, 'sand', 150, 150, 2, 57, 150, 0, 'raw');
INSERT INTO `economy` VALUES (55, 'diamond_uncut', 150, 150, 2, 57, 150, 0, 'raw');
INSERT INTO `economy` VALUES (56, 'diamond_cut', 3000, 2500, 2, 1000, 2500, 3, 'diamond');
INSERT INTO `economy` VALUES (57, 'rock', 150, 150, 2, 57, 150, 0, 'raw');
INSERT INTO `economy` VALUES (58, 'cement', 3000, 2500, 2, 1000, 2500, 3, 'cement');
INSERT INTO `economy` VALUES (59, 'mushroom', 150, 150, 2, 57, 150, 0, 'raw');
INSERT INTO `economy` VALUES (60, 'heroin_unprocessed', 150, 150, 2, 57, 150, 0, 'raw');
INSERT INTO `economy` VALUES (62, 'cannabis', 4000, 3500, 2, 2500, 3500, 0, 'raw');
INSERT INTO `economy` VALUES (64, 'cocaine_unprocessed', 150, 150, 2, 57, 150, 0, 'raw');
INSERT INTO `economy` VALUES (65, 'cocaine_processed', 5000, 4574, 2, 1950, 5000, 2, 'drugdealer');
INSERT INTO `economy` VALUES (68, 'ziptie', 1500, 900, 0, 1, 1500, 0, 'vigilante');
INSERT INTO `economy` VALUES (73, 'gpstracker', 15000, 0, 0, 0, 0, 0, 'market');
INSERT INTO `economy` VALUES (74, 'speedbomb', 50000, 0, 0, 0, 0, 0, 'rebel');

-- --------------------------------------------------------

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
