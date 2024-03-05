# FactionFree
Name:   FactionFree
Author:   Dalisar
Repository:   https://github.com/gitdalisar/factionfree
Download:   link to download the sources as .zip (take it from GitHub).
License:   Free to use for all, please have fun!


## Purpose
The goal of these changes are to allow for players of either faction to be able to gain repuatation for, take quests from, use cities of, and all other such features of the opposing faction. The concept was to truly be **_The Saviour of Azeroth_** and be able to assist and gain favor for all races and cities across the lands. These changes are strictly to the Player to NPC relationship. For the ability to have cross-faction groups, trade, guilds, etc. you will simply need to modify the worldserver.conf settings within your build path.

## How it works
This is not a module, but rather a replacement to 3 server side DBC files, modification of the acore_world database, and the inclusion of a custom .MPQ file. You will need to do the following:
1. Download all relevant files
2. Replace the existing Achievement.dbc, Faction.dbc, and Faction_Template.dbc in your build data directory with the 3 included here
  A. **NOTE**: If you have made modifications to these DBC files, such as your own custom factions or achievements, you will need to add thoes back in
3. Add the Patch-F.MPQ
  A. **NOTE**: If you already have a Patch-F.MPQ file in use, simply change the "F" to an unused letter
4. Log into your Database and run the attached .SQL file
   
