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
-- Creates database `altislife` unless it already exists and uses `altislife`
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
DROP PROCEDURE IF EXISTS `deleteOldWanted`;

DELIMITER $$
--
-- Procedures
-- CURRENT_USER function returns the name of the current user in the SQL Server database.
--

CREATE DEFINER=CURRENT_USER PROCEDURE `resetLifeVehicles`()
BEGIN
  UPDATE `vehicles` SET `active`= 0;
END$$

CREATE DEFINER=CURRENT_USER PROCEDURE `deleteDeadVehicles`()
BEGIN
  DELETE FROM `vehicles` WHERE `alive` = 0;
END$$

CREATE DEFINER=CURRENT_USER PROCEDURE `deleteOldHouses`()
BEGIN
  DELETE FROM `houses` WHERE `owned` = 0;
END$$

CREATE DEFINER=CURRENT_USER PROCEDURE `deleteOldGangs`()
BEGIN
  DELETE FROM `gangs` WHERE `active` = 0;
END$$

CREATE DEFINER=CURRENT_USER PROCEDURE `deleteOldContainers`()
BEGIN
  DELETE FROM `containers` WHERE `owned` = 0;
END$$

CREATE DEFINER=CURRENT_USER PROCEDURE `deleteOldWanted`()
BEGIN
  DELETE FROM `wanted` WHERE `active` = 0;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE IF NOT EXISTS `players` (
    `pid`          VARCHAR(17) NOT NULL,
    `uid`          INT(6) NOT NULL AUTO_INCREMENT,
    `name`         VARCHAR(32) NOT NULL,
    `aliases`      TEXT NOT NULL,
    `cash`         INT(100) NOT NULL DEFAULT 0,
    `bankacc`      INT(100) NOT NULL DEFAULT 0,
    `coplevel`     ENUM('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
    `mediclevel`   ENUM('0','1','2','3','4','5') NOT NULL DEFAULT '0',
    `civ_licenses` TEXT NOT NULL,
    `cop_licenses` TEXT NOT NULL,
    `med_licenses` TEXT NOT NULL,
    `civ_gear`     TEXT NOT NULL,
    `cop_gear`     TEXT NOT NULL,
    `med_gear`     TEXT NOT NULL,
    `civ_stats`    VARCHAR(32) NOT NULL DEFAULT '"[100,100,0]"',
    `cop_stats`    VARCHAR(32) NOT NULL DEFAULT '"[100,100,0]"',
    `med_stats`    VARCHAR(32) NOT NULL DEFAULT '"[100,100,0]"',
    `arrested`     TINYINT(1) NOT NULL DEFAULT 0,
    `adminlevel`   ENUM('0','1','2','3','4','5')  NOT NULL DEFAULT '0',
    `donorlevel`   ENUM('0','1','2','3','4','5')  NOT NULL DEFAULT '0',
    `blacklist`    TINYINT(1) NOT NULL DEFAULT 0,
    `civ_alive`    TINYINT(1) NOT NULL DEFAULT 0,
    `civ_position` VARCHAR(32) NOT NULL DEFAULT '"[]"',
    `playtime`     VARCHAR(32) NOT NULL DEFAULT '"[0,0,0]"',
    `insert_time`  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `last_seen`    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    PRIMARY KEY (`pid`),
    UNIQUE KEY `unique_uid` (`uid`),
    KEY `index_name` (`name`),
    KEY `index_blacklist` (`blacklist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=12;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE IF NOT EXISTS `vehicles` (
    `id`          INT(6) NOT NULL AUTO_INCREMENT,
    `pid`         VARCHAR(17) NOT NULL,
    `side`        VARCHAR(16) NOT NULL,
    `classname`   VARCHAR(64) NOT NULL,
    `type`        VARCHAR(16) NOT NULL,
    `alive`       TINYINT(1) NOT NULL DEFAULT 1,
    `blacklist`   TINYINT(1) NOT NULL DEFAULT 0,
    `active`      TINYINT(1) NOT NULL DEFAULT 0,
    `plate`       INT(20) NOT NULL,
    `color`       INT(20) NOT NULL,
    `inventory`   TEXT NOT NULL,
    `gear`        TEXT NOT NULL,
    `fuel`        DOUBLE NOT NULL DEFAULT 1,
    `damage`      VARCHAR(256) NOT NULL,
    `insert_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (`id`, `pid`),
    KEY `fkIdx_players_vehicles` (`pid`),
    CONSTRAINT `FK_players_vehicles` FOREIGN KEY `fkIdx_players_vehicles` (`pid`) REFERENCES `players` (`pid`),
    KEY `index_side` (`side`),
    KEY `index_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2;

-- --------------------------------------------------------

--
-- Table structure for table `houses`
-- Needed for extDB latest update on git
--

CREATE TABLE IF NOT EXISTS `houses` (
    `id`          INT(6) NOT NULL AUTO_INCREMENT,
    `pid`         VARCHAR(17) NOT NULL,
    `pos`         VARCHAR(64) DEFAULT NULL,
    `owned`       TINYINT(1) DEFAULT 0,
    `garage`      TINYINT(1) NOT NULL DEFAULT 0,
    `insert_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (`id`, `pid`),
    KEY `fkIdx_players_houses` (`pid`),
    CONSTRAINT `FK_players_houses` FOREIGN KEY `fkIdx_players_houses` (`pid`) REFERENCES `players` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4;

-- --------------------------------------------------------

--
-- Table structure for table `gangs`
-- Needed for extDB latest update on git
--

CREATE TABLE IF NOT EXISTS `gangs` (
    `id`          INT(6) NOT NULL AUTO_INCREMENT,
    `owner`       VARCHAR(17) NOT NULL,
    `name`        VARCHAR(32) DEFAULT NULL,
    `members`     TEXT,
    `maxmembers`  INT(3) DEFAULT 8,
    `bank`        INT(100) DEFAULT 0,
    `active`      TINYINT(1),
    `insert_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (`id`, `owner`),
    UNIQUE KEY `unique_name` (`name`),
    KEY `fkIdx_players_gangs` (`owner`),
    CONSTRAINT `FK_players_gangs` FOREIGN KEY `fkIdx_players_gangs` (`owner`) REFERENCES `players` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `containers`
-- Needed for extDB latest update on git
--

CREATE TABLE IF NOT EXISTS `containers` (
    `id`          INT(6) NOT NULL AUTO_INCREMENT,
    `pid`         VARCHAR(17) NOT NULL,
    `classname`   VARCHAR(32) NOT NULL,
    `pos`         VARCHAR(64) DEFAULT NULL,
    `inventory`   TEXT NOT NULL,
    `gear`        TEXT NOT NULL,
    `dir`         VARCHAR(128) DEFAULT NULL,
    `active`      TINYINT(1) NOT NULL DEFAULT 0,
    `owned`       TINYINT(1) NOT NULL DEFAULT 0,
    `insert_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (`id`, `pid`),
    KEY `fkIdx_players_containers` (`pid`),
    CONSTRAINT `FK_players_containers` FOREIGN KEY `fkIdx_players_containers` (`pid`) REFERENCES `players` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4;

-- --------------------------------------------------------

--
-- Table structure for table `wanted`
-- Needed for extDB latest update on git
--

CREATE TABLE IF NOT EXISTS `wanted` (
    `wantedID`     VARCHAR(17) NOT NULL,
    `wantedName`   VARCHAR(32) NOT NULL,
    `wantedCrimes` TEXT NOT NULL,
    `wantedBounty` INT(100) NOT NULL,
    `active`       TINYINT(1) NOT NULL DEFAULT 0,
    `insert_time`  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (`wantedID`),
    KEY `fkIdx_players_wanted` (`wantedID`),
    CONSTRAINT `FK_players_wanted` FOREIGN KEY `fkIdx_players_wanted` (`wantedID`) REFERENCES `players` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
--
-- Creates default user `arma3` with password `changeme` unless it already exists
-- Granting permissions to user `arma3`, created below
-- Reloads the privileges from the grant tables in the MySQL system database.
--

CREATE USER IF NOT EXISTS `arma3`@`localhost` IDENTIFIED BY 'changeme';
GRANT SELECT, UPDATE, INSERT, EXECUTE ON `altislife`.* TO 'arma3'@'localhost';
FLUSH PRIVILEGES;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;