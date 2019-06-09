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
    `uid`          INT NOT NULL AUTO_INCREMENT,
    `pid`          VARCHAR(17) NOT NULL,
    `name`         VARCHAR(32) NOT NULL,
    `aliases`      TEXT NOT NULL,
    `cash`         INT NOT NULL DEFAULT 0,
    `bankacc`      INT NOT NULL DEFAULT 0,
    `coplevel`     ENUM('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
    `mediclevel`   ENUM('0','1','2','3','4','5') NOT NULL DEFAULT '0',
    `civ_licenses` TEXT NOT NULL,
    `cop_licenses` TEXT NOT NULL,
    `med_licenses` TEXT NOT NULL,
    `civ_gear`     TEXT NOT NULL,
    `cop_gear`     TEXT NOT NULL,
    `med_gear`     TEXT NOT NULL,
    `civ_stats`    VARCHAR(25) NOT NULL DEFAULT '"[100,100,0]"',
    `cop_stats`    VARCHAR(25) NOT NULL DEFAULT '"[100,100,0]"',
    `med_stats`    VARCHAR(25) NOT NULL DEFAULT '"[100,100,0]"',
    `arrested`     TINYINT NOT NULL DEFAULT 0,
    `adminlevel`   ENUM('0','1','2','3','4','5')  NOT NULL DEFAULT '0',
    `donorlevel`   ENUM('0','1','2','3','4','5')  NOT NULL DEFAULT '0',
    `blacklist`    TINYINT NOT NULL DEFAULT 0,
    `civ_alive`    TINYINT NOT NULL DEFAULT 0,
    `civ_position` VARCHAR(32) NOT NULL DEFAULT '"[]"',
    `playtime`     VARCHAR(32) NOT NULL DEFAULT '"[0,0,0]"',
    `insert_time`  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `last_seen`    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    PRIMARY KEY (`pid`),
    UNIQUE KEY `unique_uid` (`uid`),
    INDEX `index_name` (`name`),
    INDEX `index_blacklist` (`blacklist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE IF NOT EXISTS `vehicles` (
    `id`          INT NOT NULL AUTO_INCREMENT,
    `pid`         VARCHAR(17) NOT NULL,
    `side`        VARCHAR(10) NOT NULL,
    `classname`   VARCHAR(64) NOT NULL,
    `type`        VARCHAR(16) NOT NULL,
    `alive`       TINYINT NOT NULL DEFAULT 1,
    `blacklist`   TINYINT NOT NULL DEFAULT 0,
    `active`      TINYINT NOT NULL DEFAULT 0,
    `plate`       MEDIUMINT NOT NULL,
    `color`       INT NOT NULL,
    `inventory`   TEXT NOT NULL,
    `gear`        TEXT NOT NULL,
    `fuel`        DOUBLE NOT NULL DEFAULT 1,
    `damage`      VARCHAR(256) NOT NULL,
    `insert_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (`id`),
    INDEX `fkIdx_players_vehicles` (`pid`),
    CONSTRAINT `FK_players_vehicles` FOREIGN KEY `fkIdx_players_vehicles` (`pid`)
      REFERENCES `players` (`pid`)
      ON UPDATE CASCADE ON DELETE CASCADE,
    INDEX `index_side` (`side`),
    INDEX `index_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `houses`
-- Needed for extDB latest update on git
--

CREATE TABLE IF NOT EXISTS `houses` (
    `id`          INT NOT NULL AUTO_INCREMENT,
    `pid`         VARCHAR(17) NOT NULL,
    `pos`         VARCHAR(32) DEFAULT NULL,
    `owned`       TINYINT DEFAULT 0,
    `garage`      TINYINT NOT NULL DEFAULT 0,
    `insert_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (`id`),
    INDEX `fkIdx_players_houses` (`pid`),
    CONSTRAINT `FK_players_houses` FOREIGN KEY `fkIdx_players_houses` (`pid`)
      REFERENCES `players` (`pid`)
      ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gangs`
-- Needed for extDB latest update on git
--

CREATE TABLE IF NOT EXISTS `gangs` (
    `id`          INT NOT NULL AUTO_INCREMENT,
    `owner`       VARCHAR(17) NOT NULL,
    `name`        VARCHAR(32) DEFAULT NULL,
    `members`     TEXT,
    `maxmembers`  INT DEFAULT 8,
    `bank`        INT DEFAULT 0,
    `active`      TINYINT NOT NULL DEFAULT 1,
    `insert_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_name` (`name`),
    INDEX `fkIdx_players_gangs` (`owner`),
    CONSTRAINT `FK_players_gangs` FOREIGN KEY `fkIdx_players_gangs` (`owner`)
      REFERENCES `players` (`pid`)
      ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `containers`
-- Needed for extDB latest update on git
--

CREATE TABLE IF NOT EXISTS `containers` (
    `id`          INT NOT NULL AUTO_INCREMENT,
    `pid`         VARCHAR(17) NOT NULL,
    `classname`   VARCHAR(32) NOT NULL,
    `pos`         VARCHAR(32) DEFAULT NULL,
    `inventory`   TEXT NOT NULL,
    `gear`        TEXT NOT NULL,
    `dir`         VARCHAR(128) DEFAULT NULL,
    `active`      TINYINT NOT NULL DEFAULT 0,
    `owned`       TINYINT NOT NULL DEFAULT 0,
    `insert_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (`id`),
    INDEX `fkIdx_players_containers` (`pid`),
    CONSTRAINT `FK_players_containers` FOREIGN KEY `fkIdx_players_containers` (`pid`)
      REFERENCES `players` (`pid`)
      ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wanted`
-- Needed for extDB latest update on git
--

CREATE TABLE IF NOT EXISTS `wanted` (
    `wantedID`     VARCHAR(17) NOT NULL,
    `wantedName`   VARCHAR(32) NOT NULL,
    `wantedCrimes` TEXT NOT NULL,
    `wantedBounty` INT NOT NULL,
    `active`       TINYINT NOT NULL DEFAULT 0,
    `insert_time`  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (`wantedID`),
    CONSTRAINT `FK_players_wanted` FOREIGN KEY `fkIdx_players_wanted` (`wantedID`)
      REFERENCES `players` (`pid`)
      ON UPDATE CASCADE ON DELETE CASCADE
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
