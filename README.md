# Dynamic Event System
Create Your Own Death Match Event Easily!

# FUNCTIONS

**event_Create(Name[], Float:x, Float:y, Float:z, Float:SpawnX, Float:SpawnY, Float:SpawnZ, Float:range, vw, int, style, MaxPlayers);**

**eventp_Join(eventid, playerid);**

**eventp_Spawn(eventid, playerid);**

**event_Start(eventid, intime);**

**event_StartCounter();**

**eventp_CheckPlayerInRange(playerid);**

# CALLBACKS

**eventp_OnPlayerJoin(playerid, eventid, style);**

**event_OnStart(eventid, style);**

**event_OnCreate(eventid, Float:x, Float:y, Float:z, Float:SpawnX, Float:SpawnY, Float:SpawnZ, Float:range, vw, int, style, MaxPlayers);**
