#include <a_samp>

forward Event::Start(eventid, intime);
forward Event::OnStart(eventid, style);

new Event::StartTime, Event::StartCounterTimer, Event::CheckWinerTimer;
forward Event::StartCounter();

stock Event::Start(eventid, intime)
{
	Event[eventid][Event::Started] = true;
	Event::StartTime = intime;
	if(funcidx("event_OnStart") != -1) CallLocalFunction("event_OnStart","dd", eventid, Event[eventid][Event::Style]);
	Event::StartCounterTimer = SetTimer("event_StartCounter", 1000, true);
	return 1;
}

public Event::StartCounter()
{
	if(Event::StartTime == 0)
	{
		KillTimer(Event::StartCounterTimer);
		for(new i; i<MAX_PLAYERS;i++)
		{
			if(EVENTP::Joined[i])
			{
				if(Event[EVENTP::JoinedID[i]][Event::LeftPlayers] == 1)
				{
					SendClientMessage(i, -1, "You were the only one who joined event. Event Canceled");
					TogglePlayerControllable(i, true);
					Event[EVENTP::JoinedID[i]][Event::Started] = false;
					SpawnPlayer(i);

				}
				else
				{
					TogglePlayerControllable(i, true);
					Event[EVENTP::JoinedID[i]][Event::PlayerCantJoin] = true;
					Event::CheckWinerTimer = SetTimer("event_CheckWinner", 100, true);
				}
			}
		}
	}
	for(new i; i<MAX_PLAYERS;i++)
	{
		if(EVENTP::Joined[i])
		{
			new string[120];
			format(string, sizeof(string), "EVENT STARING IN %d SECOND", Event::StartTime);
			GameTextForPlayer(i, string, 1000, 1);
		}
	}
	Event::StartTime--;
}