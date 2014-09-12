DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldGangs`()
BEGIN
	DELETE FROM `gangs` WHERE `active` = 0;
END

DELIMITER ;