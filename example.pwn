/*
	Example Script For EVENT System FrameWork
	Created By Amagida (Codeah)
*/	
#include <a_samp>
#include <zcmd> //https://pastebin.com/SbJc7iXa
#include <colors> //https://github.com/Amagida/colors-library
#include <colorlist> //https://github.com/Amagida/colors-library
#include <event> //https://github.com/Amagida/EVENT-FRAMEWORK

new DeagleEvent;

public Event::OnCreate(eventid, Float:x, Float:y, Float:z, Float:SpawnX, Float:SpawnY, Float:SpawnZ, Float:range, vw, int, style, MaxPlayers)
{
	printf("TEST DEBUG FOR EVENT ID %d", eventid);
	printf("%f", x);
	printf("%f", y);
	printf("%f", z);
	printf("%f", SpawnX);
	printf("%f", SpawnY);
	printf("%f", SpawnZ);
	printf("%d", vw);
	printf("%d", int);
	printf("%d", style);
	printf("%d", MaxPlayers);
	return 1;
}

public Event::OnStart(eventid, style)
{
	new eventname[126], string[126];
    Event::GetInfo(eventid, "name", eventname);
    format(string, sizeof(string), "%s %s %s Daiwyo! Event-shi Shesasvlelad Gamoiyenet %s /joindglevent %s !", SCOLOR<RED>, eventname, SCOLOR<WHITE>, SCOLOR<RED>, SCOLOR<WHITE>);
	SendClientMessageToAll(COLOR<WHITE>, string);
	return 1;
}

public EVENTP::OnPlayerJoin(playerid, eventid, style)
{
	new eventname[126], string[126];
    Event::GetInfo(eventid, "name", eventname);
    format(string, sizeof(string), "Tqven Daukavshirdit %s %s %s! Tqven Gadmogecat Desert Eagle Event-ze Satamashod !", SCOLOR<RED>, eventname, SCOLOR<WHITE>, SCOLOR<RED>, SCOLOR<WHITE>);
	SendClientMessage(playerid, COLOR<WHITE>, string);
	GivePlayerWeapon(playerid, 24, 9999);
	return 1;
}

public EVENTP::OnPlayerWin(playerid, eventid)
{
	SendClientMessage(playerid, COLOR<RED>, "Tqven Moiget Event-i!");
	return 1;
}

public OnGameModeInit()
{
	DeagleEvent = Event::Create("Deagle Event", 837.5248, -2011.0693 ,12.8672, 837.5248, -2011.0693, 12.8672, 30.0, 0, 0, 1, 2);
	return 1;
}	

CMD:startdeaglevent(playerid, params[])
{
	Event::Start(DeagleEvent, 5);
	return 1;
}

CMD:joindglevent(playerid, params[])
{
	EVENTP::Join(DeagleEvent, playerid);
	return 1;
}