-- Ring of Law (Blackrock Depths) on Heroic and Mythic: the six arena bosses had no Heroic/Mythic templates, so
-- they fought at level 60 with Normal stats (about 100k health on Mythic). They get templates like the other
-- vanilla dungeon bosses: level 63 as in the Exiles export, the Blackrock Depths boss health (377,077 Heroic,
-- 490,200 Mythic), the median melee DamageModifier of its bosses from the log calibration and, like them, no
-- trash spell cap. Borer Beetles in the arena get ten times their health.

DELETE FROM `creature_template` WHERE `entry` IN (109027, 109028, 109029, 109030, 109031, 109032);
DROP TEMPORARY TABLE IF EXISTS `coa_dungeon_copy`;
CREATE TEMPORARY TABLE `coa_dungeon_copy` AS SELECT * FROM `creature_template` WHERE `entry` IN (9027, 9028, 9029, 9030, 9031, 9032);
UPDATE `coa_dungeon_copy` SET `entry` = `entry` + 100000, `difficulty_entry_1` = 0, `difficulty_entry_2` = 0, `difficulty_entry_3` = 0,
    `minlevel` = 63, `maxlevel` = 63, `DamageModifier` = 17.12, `AIName` = '', `ScriptName` = '';
INSERT INTO `creature_template` SELECT * FROM `coa_dungeon_copy`;
DROP TEMPORARY TABLE `coa_dungeon_copy`;

DELETE FROM `creature_template_model` WHERE `CreatureID` IN (109027, 109028, 109029, 109030, 109031, 109032);
CREATE TEMPORARY TABLE `coa_dungeon_copy` AS SELECT * FROM `creature_template_model` WHERE `CreatureID` IN (9027, 9028, 9029, 9030, 9031, 9032);
UPDATE `coa_dungeon_copy` SET `CreatureID` = `CreatureID` + 100000;
INSERT INTO `creature_template_model` SELECT * FROM `coa_dungeon_copy`;
DROP TEMPORARY TABLE `coa_dungeon_copy`;

DELETE FROM `creature_template_movement` WHERE `CreatureId` IN (109027, 109028, 109029, 109030, 109031, 109032);
CREATE TEMPORARY TABLE `coa_dungeon_copy` AS SELECT * FROM `creature_template_movement` WHERE `CreatureId` IN (9027, 9028, 9029, 9030, 9031, 9032);
UPDATE `coa_dungeon_copy` SET `CreatureId` = `CreatureId` + 100000;
INSERT INTO `creature_template_movement` SELECT * FROM `coa_dungeon_copy`;
DROP TEMPORARY TABLE `coa_dungeon_copy`;

DELETE FROM `creature_template_resistance` WHERE `CreatureID` IN (109027, 109028, 109029, 109030, 109031, 109032);
CREATE TEMPORARY TABLE `coa_dungeon_copy` AS SELECT * FROM `creature_template_resistance` WHERE `CreatureID` IN (9027, 9028, 9029, 9030, 9031, 9032);
UPDATE `coa_dungeon_copy` SET `CreatureID` = `CreatureID` + 100000;
INSERT INTO `creature_template_resistance` SELECT * FROM `coa_dungeon_copy`;
DROP TEMPORARY TABLE `coa_dungeon_copy`;

DELETE FROM `creature_template_spell` WHERE `CreatureID` IN (109027, 109028, 109029, 109030, 109031, 109032);
CREATE TEMPORARY TABLE `coa_dungeon_copy` AS SELECT * FROM `creature_template_spell` WHERE `CreatureID` IN (9027, 9028, 9029, 9030, 9031, 9032);
UPDATE `coa_dungeon_copy` SET `CreatureID` = `CreatureID` + 100000;
INSERT INTO `creature_template_spell` SELECT * FROM `coa_dungeon_copy`;
DROP TEMPORARY TABLE `coa_dungeon_copy`;

DELETE FROM `creature_template_addon` WHERE `entry` IN (109027, 109028, 109029, 109030, 109031, 109032);
CREATE TEMPORARY TABLE `coa_dungeon_copy` AS SELECT * FROM `creature_template_addon` WHERE `entry` IN (9027, 9028, 9029, 9030, 9031, 9032);
UPDATE `coa_dungeon_copy` SET `entry` = `entry` + 100000;
INSERT INTO `creature_template_addon` SELECT * FROM `coa_dungeon_copy`;
DROP TEMPORARY TABLE `coa_dungeon_copy`;

DELETE FROM `creature_template` WHERE `entry` IN (209027, 209028, 209029, 209030, 209031, 209032);
DROP TEMPORARY TABLE IF EXISTS `coa_dungeon_copy`;
CREATE TEMPORARY TABLE `coa_dungeon_copy` AS SELECT * FROM `creature_template` WHERE `entry` IN (9027, 9028, 9029, 9030, 9031, 9032);
UPDATE `coa_dungeon_copy` SET `entry` = `entry` + 200000, `difficulty_entry_1` = 0, `difficulty_entry_2` = 0, `difficulty_entry_3` = 0,
    `minlevel` = 63, `maxlevel` = 63, `DamageModifier` = 36.39, `AIName` = '', `ScriptName` = '';
INSERT INTO `creature_template` SELECT * FROM `coa_dungeon_copy`;
DROP TEMPORARY TABLE `coa_dungeon_copy`;

DELETE FROM `creature_template_model` WHERE `CreatureID` IN (209027, 209028, 209029, 209030, 209031, 209032);
CREATE TEMPORARY TABLE `coa_dungeon_copy` AS SELECT * FROM `creature_template_model` WHERE `CreatureID` IN (9027, 9028, 9029, 9030, 9031, 9032);
UPDATE `coa_dungeon_copy` SET `CreatureID` = `CreatureID` + 200000;
INSERT INTO `creature_template_model` SELECT * FROM `coa_dungeon_copy`;
DROP TEMPORARY TABLE `coa_dungeon_copy`;

DELETE FROM `creature_template_movement` WHERE `CreatureId` IN (209027, 209028, 209029, 209030, 209031, 209032);
CREATE TEMPORARY TABLE `coa_dungeon_copy` AS SELECT * FROM `creature_template_movement` WHERE `CreatureId` IN (9027, 9028, 9029, 9030, 9031, 9032);
UPDATE `coa_dungeon_copy` SET `CreatureId` = `CreatureId` + 200000;
INSERT INTO `creature_template_movement` SELECT * FROM `coa_dungeon_copy`;
DROP TEMPORARY TABLE `coa_dungeon_copy`;

DELETE FROM `creature_template_resistance` WHERE `CreatureID` IN (209027, 209028, 209029, 209030, 209031, 209032);
CREATE TEMPORARY TABLE `coa_dungeon_copy` AS SELECT * FROM `creature_template_resistance` WHERE `CreatureID` IN (9027, 9028, 9029, 9030, 9031, 9032);
UPDATE `coa_dungeon_copy` SET `CreatureID` = `CreatureID` + 200000;
INSERT INTO `creature_template_resistance` SELECT * FROM `coa_dungeon_copy`;
DROP TEMPORARY TABLE `coa_dungeon_copy`;

DELETE FROM `creature_template_spell` WHERE `CreatureID` IN (209027, 209028, 209029, 209030, 209031, 209032);
CREATE TEMPORARY TABLE `coa_dungeon_copy` AS SELECT * FROM `creature_template_spell` WHERE `CreatureID` IN (9027, 9028, 9029, 9030, 9031, 9032);
UPDATE `coa_dungeon_copy` SET `CreatureID` = `CreatureID` + 200000;
INSERT INTO `creature_template_spell` SELECT * FROM `coa_dungeon_copy`;
DROP TEMPORARY TABLE `coa_dungeon_copy`;

DELETE FROM `creature_template_addon` WHERE `entry` IN (209027, 209028, 209029, 209030, 209031, 209032);
CREATE TEMPORARY TABLE `coa_dungeon_copy` AS SELECT * FROM `creature_template_addon` WHERE `entry` IN (9027, 9028, 9029, 9030, 9031, 9032);
UPDATE `coa_dungeon_copy` SET `entry` = `entry` + 200000;
INSERT INTO `creature_template_addon` SELECT * FROM `coa_dungeon_copy`;
DROP TEMPORARY TABLE `coa_dungeon_copy`;

UPDATE `creature_template` SET `difficulty_entry_1` = `entry` + 100000, `difficulty_entry_2` = `entry` + 200000 WHERE `entry` IN (9027, 9028, 9029, 9030, 9031, 9032);

DELETE FROM `coa_dungeon_health` WHERE `map_id` = 230 AND `creature_entry` IN (8932, 9027, 9028, 9029, 9030, 9031, 9032);
INSERT INTO `coa_dungeon_health` (`map_id`, `difficulty`, `creature_entry`, `max_health`, `evidence`, `source`) VALUES
(230, 1, 9027, 377077, 'model', 'Blackrock Depths boss health; Gorosh the Dervish'),
(230, 2, 9027, 490200, 'model', 'Blackrock Depths boss health; Gorosh the Dervish'),
(230, 1, 9028, 377077, 'model', 'Blackrock Depths boss health; Grizzle'),
(230, 2, 9028, 490200, 'model', 'Blackrock Depths boss health; Grizzle'),
(230, 1, 9029, 377077, 'model', 'Blackrock Depths boss health; Eviscerator'),
(230, 2, 9029, 490200, 'model', 'Blackrock Depths boss health; Eviscerator'),
(230, 1, 9030, 377077, 'model', 'Blackrock Depths boss health; Ok''thor the Breaker'),
(230, 2, 9030, 490200, 'model', 'Blackrock Depths boss health; Ok''thor the Breaker'),
(230, 1, 9031, 377077, 'model', 'Blackrock Depths boss health; Anub''shiah'),
(230, 2, 9031, 490200, 'model', 'Blackrock Depths boss health; Anub''shiah'),
(230, 1, 9032, 377077, 'model', 'Blackrock Depths boss health; Hedrum the Creeper'),
(230, 2, 9032, 490200, 'model', 'Blackrock Depths boss health; Hedrum the Creeper'),
(230, 1, 8932, 30520, 'tuning', 'Tester feedback: ten times level 60 health; Borer Beetle'),
(230, 2, 8932, 30520, 'tuning', 'Tester feedback: ten times level 60 health; Borer Beetle');

DELETE FROM `coa_dungeon_bosses` WHERE `entry` IN (9027, 9028, 9029, 9030, 9031, 9032);
INSERT INTO `coa_dungeon_bosses` (`entry`) VALUES (9027), (9028), (9029), (9030), (9031), (9032);
