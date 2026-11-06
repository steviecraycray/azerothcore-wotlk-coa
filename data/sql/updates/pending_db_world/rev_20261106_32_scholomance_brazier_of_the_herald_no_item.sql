-- Scholomance: the Brazier of the Herald (175564) summons Kirtonos the Herald without Blood of Innocents; lock 1179
-- needed the item, which does not drop in a Mythic+ key (#11445).
UPDATE `gameobject_template` SET `Data1` = 0 WHERE `entry` = 175564;
