# Dynamic Event System
Create Your Own Death Match Event Easily!

# FUNCTIONS

**Event::Create(Name[], Float:x, Float:y, Float:z, Float:SpawnX, Float:SpawnY, Float:SpawnZ, Float:range, vw, int, style, MaxPlayers);**

**EVENTP::Join(eventid, playerid);**

**EVENTP::Spawn(eventid, playerid);**

**Event::Start(eventid, intime);**

**Event::StartCounter();**

**EVENTP::CheckPlayerInRange(playerid);**

# CALLBACKS

**EVENTP::OnPlayerJoin(playerid, eventid, style);**

**Event::OnStart(eventid, style);**

**Event::OnCreate(eventid, Float:x, Float:y, Float:z, Float:SpawnX, Float:SpawnY, Float:SpawnZ, Float:range, vw, int, style, MaxPlayers);**
