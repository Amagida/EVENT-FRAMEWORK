#include <a_samp>


public OnPlayerDeath(playerid, killerid, reason)
{
	if(EVENTP::Joined[playerid])
	{
		Event[EVENTP::JoinedID[playerid]][Event::LeftPlayers]--;	
		EVENTP::Joined[playerid] = false;
		EVENTP::Spawned[playerid] = false;
		EVENTP::JoinedID[playerid] = -1;
		KillTimer(EVENTP::IsInRangeChecker[playerid]);
	}

	#if defined Event_OnGameModeInit
	return Event_OnGameModeInit();
	#else
	return 1;
	#endif
}

#if defined _ALS_OnPlayerDeath
#undef OnPlayerDeath
#else
#define _ALS_OnPlayerDeath
#endif

#define OnPlayerDeath Event_OnPlayerDeath
#if defined Event_OnPlayerDeath
forward Event_OnPlayerDeath();
#endif