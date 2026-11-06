-- Stomper Kreeg (14322): his Ascension kit Booze Spit comes a third less often, every 16-21.3 s instead of every
-- 12-16 s (#11456). Polymorph and Booze Spit leave tanks and healers alone (BossControlTargeting).
UPDATE `smart_scripts` SET `event_param3` = 16000, `event_param4` = 21300,
    `comment` = 'Stomper Kreeg - Ascension kit - In Combat (first 8-12 s, then every 16-21.3 s) - Cast \'Booze Spit\''
WHERE `entryorguid` = 14322 AND `source_type` = 0 AND `id` = 9004;
