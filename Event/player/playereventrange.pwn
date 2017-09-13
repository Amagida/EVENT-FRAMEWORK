#include <a_samp>

new EVENTP::RangeWarning[MAX_PLAYERS];

forward EVENTP::CheckPlayerInRange(playerid);
public EVENTP::CheckPlayerInRange(playerid)
{
	if(!IsPlayerInRangeOfPoint(playerid, Event[EVENTP::JoinedID[playerid]][Event::Range], Event[EVENTP::JoinedID[playerid]][Event::x], Event[EVENTP::JoinedID[playerid]][Event::y], Event[EVENTP::JoinedID[playerid]][Event::z]))
	{
		GameTextForPlayer(playerid, "Stay In Event Bounds Or You Will Be Kicked From Event!", 2000, 3);
//		EVENTP::Spawn(EVENTP::JoinedID[playerid], playerid);
		EVENTP::RangeWarning[playerid]++;
		EVENTP::Spawn(EVENTP::JoinedID[playerid], playerid);
		if(EVENTP::RangeWarning[playerid] == 1)
		{
			EVENTP::Spawn(EVENTP::JoinedID[playerid], playerid);
		}
		if(EVENTP::RangeWarning[playerid] >= 5)
		{
			EVENTP::JoinedID[playerid] = -1;
			EVENTP::Joined[playerid] = false; 
			EVENTP::Spawned[playerid] = false;
			Event[EVENTP::JoinedID[playerid]][Event::LeftPlayers]--;
			KillTimer(EVENTP::IsInRangeChecker[playerid]);
		}
		//SetPlayerWorldBounds(playerid, Event[EVENTP::JoinedID[playerid]][Event::x]+20, Event[EVENTP::JoinedID[playerid]][Event::x]-20, Event[EVENTP::JoinedID[playerid]][Event::y]+20, Event[EVENTP::JoinedID[playerid]][Event::y]-20);
	}
}
