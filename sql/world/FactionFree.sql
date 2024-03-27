/* 
This SQL script is part of the mod-Faction-Free AzerothCore module hosted at:
https://github.com/gitdalisar/mod-Faction-Free

Maintained by GitDalisar

For Manual installation:
1. Ensure that you are logged into MySQL Database 
2. Change to the acore_world database with:  USE acore_world;
3. Run this using this command: SOURCE <path to .sql>;
*/

/*This will update the quest_template table to allow all races to have access to all quests.*/
UPDATE `acore_world`.`quest_template` SET `AllowableRaces` = 1791 WHERE `AllowableRaces` = 1101 OR `AllowableRaces` = 690;

/*This will update all Inns to give rested xp bonus to players regaurdless to the faction of the player vs. the Inn's faction.*/
UPDATE `acore_world`.`areatrigger_tavern` SET `faction` = 6 WHERE `faction` != 6;

/*This will update the playercreateinfo_skills table to have all players start with knowing all playable race languages at creation.*/
UPDATE `acore_world`.`playercreateinfo_skills` SET `raceMask`=1791 WHERE `raceMask`!=1791 AND `comment` LIKE "Language%";

/*This will update the broadcast_text, creature_text, and npc_text tables to ensure players can read NPC chat regardless of player faction.*/
UPDATE `acore_world`.`broadcast_text` SET `LanguageID` = 0 WHERE `LanguageID` IN (1,2,3,6,7,10,13,14,33,35);
UPDATE `acore_world`.`creature_text` SET `Language` = 0 WHERE `Language` IN (1,2,3,6,7,10,13,14,33,35);
UPDATE `acore_world`.`npc_text` SET `lang1` = 0 WHERE `lang1` IN (1,2,3,6,7,10,13,14,33,35);
UPDATE `acore_world`.`npc_text` SET `lang2` = 0 WHERE `lang2` IN (1,2,3,6,7,10,13,14,33,35);
UPDATE `acore_world`.`npc_text` SET `lang3` = 0 WHERE `lang3` IN (1,2,3,6,7,10,13,14,33,35);
UPDATE `acore_world`.`npc_text` SET `lang4` = 0 WHERE `lang4` IN (1,2,3,6,7,10,13,14,33,35);
UPDATE `acore_world`.`npc_text` SET `lang5` = 0 WHERE `lang5` IN (1,2,3,6,7,10,13,14,33,35);
UPDATE `acore_world`.`npc_text` SET `lang6` = 0 WHERE `lang6` IN (1,2,3,6,7,10,13,14,33,35);
UPDATE `acore_world`.`npc_text` SET `lang7` = 0 WHERE `lang7` IN (1,2,3,6,7,10,13,14,33,35);

/*This will create the two NPC used for the teleport network to aide in travel around the world, especially for ares where one faction
may have fewer cities or flight paths. This also addes the broadcast_text and npc_text required. PLEASE NOTE: the NPC and their corresponding
npc_text and broacast_text line up using 500000 and 500001 as entry or id numbers with 500003 for submenu text. If these are already in use 
within your environment, you can change those values here.*/
INSERT INTO `acore_world`.`creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (500000, 0, 0, 0, 0, 0, 26375, 0, 0, 0, 'Quinley Gearspark', 'Gobl-ome Engieering Co.', NULL, 0, 35, 35, 0, 474, 1, 1, 1.14286, 1, 1, 18, 1, 0, 0, 1, 2000, 2000, 1, 1, 8, 512, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1.1, 1, 1, 1, 0, 0, 1, 0, 0, 2, '', 12340);
INSERT INTO `acore_world`.`creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (500001, 0, 0, 0, 0, 0, 7039, 0, 0, 0, 'Harleen Gearspark', 'Gnom-lin Engieering Co.', NULL, 0, 35, 35, 0, 474, 1, 1, 1.14286, 1, 1, 18, 1, 0, 0, 1, 2000, 2000, 1, 1, 1, 512, 2048, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1.1, 1, 1, 1, 0, 0, 1, 0, 0, 2, '', 12340);
INSERT INTO `acore_world`.`broadcast_text` (`ID`, `LanguageID`, `MaleText`, `FemaleText`, `EmoteID1`, `EmoteID2`, `EmoteID3`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `SoundEntriesId`, `EmotesID`, `Flags`, `VerifiedBuild`) VALUES (500000, 0, 'The name’s $N you say?$B$BYou look like the perfect expirim..ustomer for this feat of Gobl-ome Engineering! All the Goblin wonder, splendor, and craftswomanship you could hope for! With ... Gnomish... *in a mocking voice* “Scientific Process.”', 'The name’s $N you say?$B$BYou look like the perfect expirim..ustomer for this feat of Gobl-ome Engineering! All the Goblin wonder, splendor, and craftswomanship you could hope for! With ... Gnomish... *in a mocking voice* “Scientific Process.”', 0, 0, 0, 0, 0, 0, 0, 0, 1, 18019);
INSERT INTO `acore_world`.`broadcast_text` (`ID`, `LanguageID`, `MaleText`, `FemaleText`, `EmoteID1`, `EmoteID2`, `EmoteID3`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `SoundEntriesId`, `EmotesID`, `Flags`, `VerifiedBuild`) VALUES (500001, 0, 'Hey there how\'s it goin\', $N?$B$BCan I interest you in travel today? Only the finest in Gnom-lin Engineering! The precise science of Gnomish ingenuity with... Goblin... explosiony-ness?', 'Hey there how\'s it goin\', $N?$B$BCan I interest you in travel today? Only the finest in Gnom-lin Engineering! The precise science of Gnomish ingenuity with... Goblin... explosiony-ness?', 0, 0, 0, 0, 0, 0, 0, 0, 1, 18019);
INSERT INTO `acore_world`.`broadcast_text` (`ID`, `LanguageID`, `MaleText`, `FemaleText`, `EmoteID1`, `EmoteID2`, `EmoteID3`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `SoundEntriesId`, `EmotesID`, `Flags`, `VerifiedBuild`) VALUES (500003, 0, 'Decide where you would like to go? Remember our network requires a lot of power, so anything outside the cities is a one way trip!', 'Decide where you would like to go? Remember our network requires a lot of power, so anything outside the cities is a one way trip!', 0, 0, 0, 0, 0, 0, 0, 0, 1, 18019);
INSERT INTO `acore_world`.`npc_text` (`ID`, `text0_0`, `text0_1`, `BroadcastTextID0`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `BroadcastTextID1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `BroadcastTextID2`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `BroadcastTextID3`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `BroadcastTextID4`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `BroadcastTextID5`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `BroadcastTextID6`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `BroadcastTextID7`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES (500000, 'The name’s $N you say?$B$BYou look like the perfect expirim..ustomer for this feat of Gobl-ome Engineering! All the Goblin wonder, splendor, and craftswomanship you could hope for! With ... Gnomish... *in a mocking voice* “Scientific Process.”', 'The name’s $N you say?$B$BYou look like the perfect expirim..ustomer for this feat of Gobl-ome Engineering! All the Goblin wonder, splendor, and craftswomanship you could hope for! With ... Gnomish... *in a mocking voice* “Scientific Process.”', 500000, 0, 1, 0, 0, 0, 0, 0, 0, '', '', 500000, 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 12340);
INSERT INTO `acore_world`.`npc_text` (`ID`, `text0_0`, `text0_1`, `BroadcastTextID0`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `BroadcastTextID1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `BroadcastTextID2`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `BroadcastTextID3`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `BroadcastTextID4`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `BroadcastTextID5`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `BroadcastTextID6`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `BroadcastTextID7`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES (500001, 'Hey there how\'s it goin\', $N?$B$BCan I interest you in travel today? Only the finest in Gnom-lin Engineering! The precise science of Gnomish ingenuity with... Goblin... explosiony-ness?', 'Hey there how\'s it goin\', $N?$B$BCan I interest you in travel today? Only the finest in Gnom-lin Engineering! The precise science of Gnomish ingenuity with... Goblin... explosiony-ness?', 500001, 0, 1, 0, 0, 0, 0, 0, 0, '', '', 500001, 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 12340);
INSERT INTO `acore_world`.`npc_text` (`ID`, `text0_0`, `text0_1`, `BroadcastTextID0`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `BroadcastTextID1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `BroadcastTextID2`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `BroadcastTextID3`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `BroadcastTextID4`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `BroadcastTextID5`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `BroadcastTextID6`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `BroadcastTextID7`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES (500003, 'Decide where you would like to go? Remember our network requires a lot of power, so anything outside the cities is a one way trip!', 'Decide where you would like to go? Remember our network requires a lot of power, so anything outside the cities is a one way trip!', 500003, 0, 1, 0, 0, 0, 0, 0, 0, '', '', 500003, 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 12340);

/*This will create a series of objects in gameobject_template that were used to add asthetics to the teleport network. They have no purpose 
other than just to make the area stand out and look better.*/
INSERT INTO `acore_world`.`gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES (500000, 0, 7135, 'FactionFreeTeleporter-WarpDevice', '', '', '', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340);
INSERT INTO `acore_world`.`gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES (500001, 0, 2047, 'FactionFreeTeleporter-MechanicalDevice', '', '', '', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340);
INSERT INTO `acore_world`.`gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES (500002, 0, 8632, 'FactionFreeTeleporter-UlduarDevice', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 9767);
INSERT INTO `acore_world`.`gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES (500003, 0, 9064, 'FactionFreeTeleporter-BlueEffect', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340);
INSERT INTO `acore_world`.`gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES (500004, 0, 9065, 'FactionFreeTeleporter-RedEffect', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340);

/*This will insert all of the teleporter game objections into the appropriate locations within the gameobject table. PLEASE note the GUIDs used here.
If those numbers are already in use within your environment, you can change them here.*/
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135556, 500000, 0, 0, 0, 1, 1, -4913.49, -929.127, 501.626, 5.2698, -0, -0, -0.485288, 0.874355, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135557, 500001, 0, 0, 0, 1, 1, -4913.49, -929.127, 501.626, 5.2698, -0, -0, -0.485288, 0.874355, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135558, 500002, 0, 0, 0, 1, 1, -4913.49, -929.127, 502.453, 5.2698, -0, -0, -0.485288, 0.874355, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135559, 500003, 0, 0, 0, 1, 1, -4913.49, -929.127, 502.453, 5.2698, -0, -0, -0.485288, 0.874355, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135560, 500004, 0, 0, 0, 1, 1, -4913.49, -929.127, 502.453, 5.2698, -0, -0, -0.485288, 0.874355, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135561, 500000, 1, 0, 0, 1, 1, 1654.7, -4325.37, 61.7998, 5.85969, -0, -0, -0.210166, 0.977666, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135562, 500001, 1, 0, 0, 1, 1, 1654.7, -4325.37, 61.7998, 5.85969, -0, -0, -0.210166, 0.977666, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135563, 500002, 1, 0, 0, 1, 1, 1654.7, -4325.37, 62.6259, 5.86755, -0, -0, -0.206326, 0.978483, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135564, 500003, 1, 0, 0, 1, 1, 1654.7, -4325.37, 62.6259, 5.86755, -0, -0, -0.206326, 0.978483, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135565, 500004, 1, 0, 0, 1, 1, 1654.7, -4325.37, 62.6259, 5.86755, -0, -0, -0.206326, 0.978483, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135590, 500000, 0, 0, 0, 1, 1, -8837.51, 469.527, 109.639, 2.2698, -0, -0, -0.906493, -0.422222, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135591, 500001, 0, 0, 0, 1, 1, -8837.51, 469.527, 109.639, 2.2698, -0, -0, -0.906493, -0.422222, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135592, 500002, 0, 0, 0, 1, 1, -8837.51, 469.527, 110.466, 2.2698, -0, -0, -0.906493, -0.422222, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135593, 500003, 0, 0, 0, 1, 1, -8837.51, 469.527, 110.466, 2.2698, -0, -0, -0.906493, -0.422222, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135594, 500004, 0, 0, 0, 1, 1, -8837.51, 469.527, 110.466, 2.2698, -0, -0, -0.906493, -0.422222, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135595, 500000, 530, 0, 0, 1, 1, -4031.65, -11803.7, 9.1174, 3.32224, -0, -0, -0.995924, 0.0901987, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135596, 500001, 530, 0, 0, 1, 1, -4031.65, -11803.7, 9.1174, 3.32224, -0, -0, -0.995924, 0.0901987, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135597, 500002, 530, 0, 0, 1, 1, -4031.66, -11803.6, 9.94138, 3.32224, -0, -0, -0.995924, 0.0901987, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135598, 500003, 530, 0, 0, 1, 1, -4031.66, -11803.6, 9.94138, 3.32224, -0, -0, -0.995924, 0.0901987, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135599, 500004, 530, 0, 0, 1, 1, -4031.66, -11803.6, 9.94138, 3.32224, -0, -0, -0.995924, 0.0901987, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135624, 500000, 1, 0, 0, 1, 1, 9864.34, 2495.77, 1315.9, 5.9394, -0, -0, -0.171047, 0.985263, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135625, 500001, 1, 0, 0, 1, 1, 9864.34, 2495.77, 1315.9, 5.9394, -0, -0, -0.171047, 0.985263, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135626, 500002, 1, 0, 0, 1, 1, 9864.34, 2495.77, 1316.73, 5.97474, -0, -0, -0.15361, 0.988132, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135627, 500003, 1, 0, 0, 1, 1, 9864.34, 2495.77, 1316.73, 5.97474, -0, -0, -0.15361, 0.988132, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135628, 500004, 1, 0, 0, 1, 1, 9864.34, 2495.77, 1316.73, 5.97474, -0, -0, -0.15361, 0.988132, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135635, 500000, 0, 0, 0, 1, 1, 1574.35, 240.538, -62.0772, 0.0126472, -0, -0, -0.00632474, -0.99998, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135636, 500001, 0, 0, 0, 1, 1, 1574.35, 240.538, -62.0772, 0.0126472, -0, -0, -0.00632474, -0.99998, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135637, 500002, 0, 0, 0, 1, 1, 1574.35, 240.538, -61.2511, 0.0322821, -0, -0, -0.0161398, -0.99987, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135638, 500003, 0, 0, 0, 1, 1, 1574.35, 240.538, -61.2511, 0.0322821, -0, -0, -0.0161398, -0.99987, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135639, 500004, 0, 0, 0, 1, 1, 1574.35, 240.538, -61.2511, 0.0322821, -0, -0, -0.0161398, -0.99987, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135640, 500000, 1, 0, 0, 1, 1, -1212.87, 61.2657, 130.294, 3.3765, -0, -0, -0.993111, 0.117182, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135641, 500001, 1, 0, 0, 1, 1, -1212.87, 61.2657, 130.294, 3.3765, -0, -0, -0.993111, 0.117182, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135642, 500002, 1, 0, 0, 1, 1, -1212.87, 61.2657, 131.12, 3.46289, -0, -0, -0.987124, 0.159958, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135643, 500003, 1, 0, 0, 1, 1, -1212.87, 61.2657, 131.12, 3.46289, -0, -0, -0.987124, 0.159958, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135644, 500004, 1, 0, 0, 1, 1, -1212.87, 61.2657, 131.12, 3.46289, -0, -0, -0.987124, 0.159958, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135645, 500000, 530, 0, 0, 1, 1, 9477.6, -7302.96, 14.3697, 1.17057, -0, -0, -0.552437, -0.833554, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135646, 500001, 530, 0, 0, 1, 1, 9477.6, -7302.96, 14.3697, 1.17057, -0, -0, -0.552437, -0.833554, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135647, 500002, 530, 0, 0, 1, 1, 9477.6, -7302.96, 15.1959, 1.17057, -0, -0, -0.552437, -0.833554, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135648, 500003, 530, 0, 0, 1, 1, 9477.6, -7302.96, 15.1959, 1.17057, -0, -0, -0.552437, -0.833554, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135649, 500004, 530, 0, 0, 1, 1, 9477.6, -7302.96, 15.1959, 1.17057, -0, -0, -0.552437, -0.833554, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135707, 500000, 571, 0, 0, 1, 1, 5782.92, 473.433, 657.88, 5.68628, -0, -0, -0.294044, 0.955792, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135708, 500001, 571, 0, 0, 1, 1, 5782.92, 473.433, 657.88, 5.68628, -0, -0, -0.294044, 0.955792, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135709, 500002, 571, 0, 0, 1, 1, 5782.92, 473.433, 658.707, 5.66271, -0, -0, -0.305283, 0.952262, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135710, 500003, 571, 0, 0, 1, 1, 5782.92, 473.433, 658.707, 5.66271, -0, -0, -0.305283, 0.952262, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135711, 500004, 571, 0, 0, 1, 1, 5782.92, 473.433, 658.707, 5.66271, -0, -0, -0.305283, 0.952262, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135736, 500000, 530, 0, 0, 1, 1, -1802.13, 5288.22, -12.4279, 2.67381, -0, -0, -0.972772, -0.231764, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135737, 500001, 530, 0, 0, 1, 1, -1802.13, 5288.22, -12.4279, 2.67381, -0, -0, -0.972772, -0.231764, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135738, 500002, 530, 0, 0, 1, 1, -1802.13, 5288.22, -11.6011, 2.63454, -0, -0, -0.968034, -0.250819, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135739, 500003, 530, 0, 0, 1, 1, -1802.13, 5288.22, -11.6011, 2.63454, -0, -0, -0.968034, -0.250819, 300, 0, 1, '', NULL, NULL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES (2135740, 500004, 530, 0, 0, 1, 1, -1802.13, 5288.22, -11.6011, 2.63454, -0, -0, -0.968034, -0.250819, 300, 0, 1, '', NULL, NULL);
