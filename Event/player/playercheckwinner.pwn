#include <a_samp>

forward EVENTP::OnPlayerWin(playerid, eventid);

forward Event::CheckWinner();
public Event::CheckWinner()
{
	for(new i; i<MAX_PLAYERS; i++)
	{
		if(Event[EVENTP::JoinedID[i]][Event::LeftPlayers] == 1)
		{
			#if defined eventp_OnPlayerWin
				CallLocalFunction("eventp_OnPlayerWin","dd", i, EVENTP::JoinedID[i]);
			#endif
			Event[EVENTP::JoinedID[i]][Event::Started] = false;
			Event[EVENTP::JoinedID[i]][Event::PlayerCantJoin] = false;
			Event[EVENTP::JoinedID[i]][Event::LeftPlayers] = 0;
			EVENTP::Joined[i] = false;
			EVENTP::Spawned[i] = false;
			EVENTP::JoinedID[i] = -1;			
			SpawnPlayer(i);
			KillTimer(Event::CheckWinerTimer);
		}
	}
}
