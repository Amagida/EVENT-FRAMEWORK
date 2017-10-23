#include <a_samp>
#include <YSI\y_hooks>

forward EVENTP::OnPlayerJoin(playerid, eventid, style);

new bool: EVENTP::Joined[MAX_PLAYERS] = false, bool: EVENTP::Spawned[MAX_PLAYERS] = false, EVENTP::JoinedID[MAX_PLAYERS], EVENTP::IsInRangeChecker[MAX_PLAYERS];

stock EVENTP::Join(eventid, playerid)
{
	if(!Event[eventid][Event::Started]) return printf("[EVENT ERROR] EVENT ID %d IS NOT STARTED! ",eventid);
	if(Event[eventid][Event::PlayerCantJoin]) return SendClientMessage(playerid, -1, "Event-i Ukve Daiwyo!"); 
	EVENTP::Joined[playerid] = true;
	Event[eventid][Event::LeftPlayers]++;
	EVENTP::JoinedID[playerid] = eventid;
	EVENTP::Spawn(eventid, playerid);
	EVENTP::IsInRangeChecker[playerid] = SetTimerEx("eventp_CheckPlayerInRange", 150, 1, "d", playerid);
	#if defined eventp_OnPlayerJoin
		CallLocalFunction("eventp_OnPlayerJoin", "ddd", playerid, eventid, Event[eventid][Event::Style]); 
	#endif
	return 1;
}

stock EVENTP::Spawn(eventid, playerid)
{
	SetPlayerPos(playerid, Event[eventid][Event::SpawnX], Event[eventid][Event::SpawnY], Event[eventid][Event::SpawnZ]);
	EVENTP::Spawned[playerid] = true;
	if(!Event[eventid][Event::PlayerCantJoin])
	{
		TogglePlayerControllable(playerid, false);
	}
	return 1;
}	

