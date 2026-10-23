-- Road to De Other Side (map 937): Adlazin's quests, the entrance and exit in the Sinister Lair, and health.

-- Adlazin gives and takes both quests.
UPDATE `creature_template` SET `npcflag` = `npcflag` | 3, `gossip_menu_id` = 162933 WHERE `entry` = 162933;
DELETE FROM `npc_text` WHERE `ID` = 162933;
INSERT INTO `npc_text` (`ID`, `text0_0`, `BroadcastTextID0`, `lang0`, `Probability0`) VALUES
(162933, 'Ah, it be only a matter o\' time before someone else came.$b$bDo not fear. Me name be Adlazin, Priest of Bwonsamdi. Da Loa of Death himself sent me to cut down da dangerous ambitions of Hir\'eek, Dambala, and Elortha-no-Shadra.', 0, 0, 1);
DELETE FROM `gossip_menu` WHERE `MenuID` = 162933;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`) VALUES (162933, 162933);

DELETE FROM `creature_queststarter` WHERE `quest` IN (1660083, 1660084);
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (162933, 1660084), (162933, 1660083);
DELETE FROM `creature_questender` WHERE `quest` IN (1660083, 1660084);
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (162933, 1660084), (162933, 1660083);

-- A Sinister Family: 8 hissers, 25 spiders, 5 bats. Bats and Lifedrinkers count for the bat credit 163814.
DELETE FROM `creature_template` WHERE `entry` = 163814;
INSERT INTO `creature_template` (`entry`, `name`, `minlevel`, `maxlevel`, `faction`, `unit_class`, `type`, `flags_extra`) VALUES
(163814, 'Bat of the Other Side', 15, 15, 35, 1, 1, 128);
DELETE FROM `creature_template_model` WHERE `CreatureID` = 163814;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`) VALUES
(163814, 0, 11686, 1, 1);
UPDATE `creature_template` SET `KillCredit1` = 163814 WHERE `entry` IN (162766, 162767);
UPDATE `creature_template` SET `KillCredit2` = 163814 WHERE `entry` IN (162979, 162980, 162981);

-- Entrance: the water pool in the Sinister Lair (AreaTrigger 8004) leads to the Dungeon Finder start point.
DELETE FROM `areatrigger_teleport` WHERE `ID` = 8004;
INSERT INTO `areatrigger_teleport` (`ID`, `Name`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
(8004, 'Sinister Lair - Road to De Other Side', 937, 480.61, -232.172, 173.47, 4.15317);

-- Exit: the start room's AreaTrigger 8005 leads back out of the pool.
DELETE FROM `areatrigger_teleport` WHERE `ID` = 8005;
INSERT INTO `areatrigger_teleport` (`ID`, `Name`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
(8005, 'Road to De Other Side - Sinister Lair', 1, -198.149, -4182.969, 56.760, 6.27215);

-- Road to De Other Side (map 937): health. Mythic is set to half the 2026-08-05 Mythic log for now and gets
-- tuned on feedback; Heroic is Mythic / 1.3 and Normal at level 60 is Heroic / 2.33, the core's Normal-to-Heroic
-- factor. Spawned creatures take the dungeon multiplier of 2.5 (CoA.CreatureScaling), summons do not.

UPDATE `creature_template` SET `HealthModifier` = 19.560 WHERE `entry` = 162711; -- Muzah, the Shadow Hunter, about 144.8k
UPDATE `creature_template` SET `HealthModifier` = 24.100 WHERE `entry` = 162715; -- Drak'math the Sinister King, about 142.7k
UPDATE `creature_template` SET `HealthModifier` = 48.215 WHERE `entry` = 162716; -- Chimeric Embryo, about 147.2k
UPDATE `creature_template` SET `HealthModifier` = 4.685 WHERE `entry` = 162743; -- Spider, about 14.3k
UPDATE `creature_template` SET `HealthModifier` = 4.350 WHERE `entry` = 162765; -- Interstitial Wanderer, about 32.2k
UPDATE `creature_template` SET `HealthModifier` = 2.453 WHERE `entry` = 162766; -- Bat of the Other Side, about 18.2k
UPDATE `creature_template` SET `HealthModifier` = 2.453 WHERE `entry` = 162767; -- Bat of the Other Side, about 18.2k
UPDATE `creature_template` SET `HealthModifier` = 4.351 WHERE `entry` = 162769; -- Deathweaver Matriarch, about 32.2k
UPDATE `creature_template` SET `HealthModifier` = 1.629 WHERE `entry` = 162770; -- Spider of the Other Side, about 12.1k
UPDATE `creature_template` SET `HealthModifier` = 12.388 WHERE `entry` = 162773; -- Gutdevourer, about 91.7k
UPDATE `creature_template` SET `HealthModifier` = 4.350 WHERE `entry` = 162775; -- Gutdevourer, about 32.2k
UPDATE `creature_template` SET `HealthModifier` = 4.350 WHERE `entry` = 162776; -- Interstitial Wanderer, about 32.2k
UPDATE `creature_template` SET `HealthModifier` = 15.483 WHERE `entry` = 162780; -- Risen Cultist, about 91.7k
UPDATE `creature_template` SET `HealthModifier` = 5.437 WHERE `entry` = 162782; -- Hisser of the Other Side, about 32.2k
UPDATE `creature_template` SET `HealthModifier` = 5.437 WHERE `entry` = 162783; -- Interstitial Wanderer, about 32.2k
UPDATE `creature_template` SET `HealthModifier` = 1.629 WHERE `entry` = 162784; -- Violent Swarm, about 12.1k
UPDATE `creature_template` SET `HealthModifier` = 7.340 WHERE `entry` = 162785; -- Watcher of the Path, about 43.5k
UPDATE `creature_template` SET `HealthModifier` = 1.629 WHERE `entry` = 162979; -- Lifedrinker, about 12.1k
UPDATE `creature_template` SET `HealthModifier` = 1.629 WHERE `entry` = 162980; -- Lifedrinker, about 12.1k
UPDATE `creature_template` SET `HealthModifier` = 1.087 WHERE `entry` = 162981; -- Lifedrinker, about 8.0k
UPDATE `creature_template` SET `HealthModifier` = 12.388 WHERE `entry` = 162982; -- Risen Cultist, about 91.7k
UPDATE `creature_template` SET `HealthModifier` = 4.350 WHERE `entry` = 162983; -- Risen Cultist, about 32.2k
UPDATE `creature_template` SET `HealthModifier` = 15.219 WHERE `entry` = 162988; -- Vol’zeen, about 112.7k

DELETE FROM `coa_dungeon_health` WHERE `map_id` = 937;
INSERT INTO `coa_dungeon_health` (`map_id`, `difficulty`, `creature_entry`, `max_health`, `evidence`, `source`) VALUES
(937, 1, 162711, 337368, 'log', 'Heroic from Mythic /1.3; Muzah, the Shadow Hunter'),
(937, 2, 162711, 438578, 'log', 'half the Mythic combat log 2026-08-05 (877155); Muzah, the Shadow Hunter'),
(937, 1, 162715, 332571, 'log', 'Heroic from Mythic /1.3; Drak''math the Sinister King'),
(937, 2, 162715, 432342, 'log', 'half the Mythic combat log 2026-08-05 (864685); Drak''math the Sinister King'),
(937, 1, 162716, 342868, 'log', 'Heroic from Mythic /1.3; Chimeric Embryo'),
(937, 2, 162716, 445728, 'log', 'half the Mythic combat log 2026-08-05 (891455); Chimeric Embryo'),
(937, 1, 162743, 33319, 'log', 'Heroic from Mythic /1.3; Spider'),
(937, 2, 162743, 43315, 'log', 'half the Mythic combat log 2026-08-05 (86630); Spider'),
(937, 1, 162765, 75030, 'log', 'Heroic from Mythic /1.3; Interstitial Wanderer'),
(937, 2, 162765, 97539, 'log', 'half the Mythic combat log 2026-08-05 (195078); Interstitial Wanderer'),
(937, 1, 162766, 42308, 'model', 'Heroic from Mythic /1.3; Bat of the Other Side'),
(937, 2, 162766, 55000, 'model', 'in-game estimate (2026-10-23); Bat of the Other Side'),
(937, 1, 162767, 42308, 'model', 'Heroic from Mythic /1.3; Bat of the Other Side'),
(937, 2, 162767, 55000, 'model', 'in-game estimate (2026-10-23); Bat of the Other Side'),
(937, 1, 162769, 75037, 'log', 'Heroic from Mythic /1.3; Deathweaver Matriarch'),
(937, 2, 162769, 97548, 'log', 'half the Mythic combat log 2026-08-05 (195097); Deathweaver Matriarch'),
(937, 1, 162770, 28088, 'log', 'Heroic from Mythic /1.3; Spider of the Other Side'),
(937, 2, 162770, 36515, 'log', 'half the Mythic combat log 2026-08-05 (73030); Spider of the Other Side'),
(937, 1, 162773, 213659, 'log', 'Heroic from Mythic /1.3; Gutdevourer'),
(937, 2, 162773, 277757, 'log', 'half the Mythic combat log 2026-08-05 (555514); Gutdevourer'),
(937, 1, 162775, 75020, 'log', 'Heroic from Mythic /1.3; Gutdevourer'),
(937, 2, 162775, 97526, 'log', 'half the Mythic combat log 2026-08-05 (195053); Gutdevourer'),
(937, 1, 162776, 75026, 'log', 'Heroic from Mythic /1.3; Interstitial Wanderer'),
(937, 2, 162776, 97534, 'log', 'half the Mythic combat log 2026-08-05 (195069); Interstitial Wanderer'),
(937, 1, 162780, 213660, 'log', 'Heroic from Mythic /1.3; Risen Cultist'),
(937, 2, 162780, 277758, 'log', 'half the Mythic combat log 2026-08-05 (555515); Risen Cultist'),
(937, 1, 162782, 75032, 'log', 'Heroic from Mythic /1.3; Hisser of the Other Side'),
(937, 2, 162782, 97541, 'log', 'half the Mythic combat log 2026-08-05 (195082); Hisser of the Other Side'),
(937, 1, 162783, 75023, 'log', 'Heroic from Mythic /1.3; Interstitial Wanderer'),
(937, 2, 162783, 97530, 'log', 'half the Mythic combat log 2026-08-05 (195060); Interstitial Wanderer'),
(937, 1, 162784, 28088, 'log', 'Heroic from Mythic /1.3; Violent Swarm'),
(937, 2, 162784, 36515, 'log', 'half the Mythic combat log 2026-08-05 (73030); Violent Swarm'),
(937, 1, 162785, 101284, 'log', 'Heroic from Mythic /1.3; Watcher of the Path'),
(937, 2, 162785, 131669, 'log', 'half the Mythic combat log 2026-08-05 (263338); Watcher of the Path'),
(937, 1, 162979, 28088, 'log', 'Heroic from Mythic /1.3; Lifedrinker'),
(937, 2, 162979, 36515, 'log', 'half the Mythic combat log 2026-08-05 (73030); Lifedrinker'),
(937, 1, 162980, 28088, 'log', 'Heroic from Mythic /1.3; Lifedrinker'),
(937, 2, 162980, 36515, 'log', 'half the Mythic combat log 2026-08-05 (73030); Lifedrinker'),
(937, 1, 162981, 18742, 'log', 'Heroic from Mythic /1.3; Lifedrinker'),
(937, 2, 162981, 24365, 'log', 'half the Mythic combat log 2026-08-05 (48730); Lifedrinker'),
(937, 1, 162982, 213660, 'log', 'Heroic from Mythic /1.3; Risen Cultist'),
(937, 2, 162982, 277758, 'log', 'half the Mythic combat log 2026-08-05 (555515); Risen Cultist'),
(937, 1, 162983, 75029, 'log', 'Heroic from Mythic /1.3; Risen Cultist'),
(937, 2, 162983, 97538, 'log', 'half the Mythic combat log 2026-08-05 (195075); Risen Cultist'),
(937, 1, 162988, 262494, 'log', 'Heroic from Mythic /1.3; Vol’zeen'),
(937, 2, 162988, 341242, 'log', 'half the Mythic combat log 2026-08-05 (682485); Vol’zeen');
