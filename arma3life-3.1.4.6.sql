ALTER TABLE `players` ADD `med_gear` TEXT NOT NULL AFTER `cop_gear`;
UPDATE `players` SET `med_gear`='"[]"';