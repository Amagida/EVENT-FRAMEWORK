/*
	Event Framework
	Event Create Functions
	Author: Amagida
*/	

#include <a_samp>

/* FORWARDS */
forward Event::OnCreate(eventid, Float:x, Float:y, Float:z, Float:SpawnX, Float:SpawnY, Float:SpawnZ, Float:range, vw, int, style, MaxPlayers);
forward Event::Create(Name[], Float:x, Float:y, Float:z, Float:SpawnX, Float:SpawnY, Float:SpawnZ, Float:range, vw, int, style, MaxPlayers);

#define MAX_EVENT 20

enum Event::createEnum 
{
	   Event::id,
	   Event::Name[164],	
Float: Event::x,
Float: Event::y,
Float: Event::z,
Float: Event::SpawnX,
Float: Event::SpawnY,
Float: Event::SpawnZ,
Float: Event::Range,
	   Event::vw,
bool:  Event::Started,
       Event::int,
	   Event::Style,
	   Event::MaxPlayers,
	   Event::LeftPlayers,
bool:  Event::PlayerCantJoin	
}

new Event[MAX_EVENT][Event::createEnum];

new Event::Created = 0;

stock Event::Create(Name[], Float:x, Float:y, Float:z, Float:SpawnX, Float:SpawnY, Float:SpawnZ, Float:range, vw, int, style, MaxPlayers)
{

	Event::Created++;
	Event[Event::Created][Event::id] = Event::Created;
	strcat(Event[Event::Created][Event::Name], Name);
	Event[Event::Created][Event::x] = x;
	Event[Event::Created][Event::y] = y;
	Event[Event::Created][Event::z] = z;
	Event[Event::Created][Event::SpawnX] = SpawnX;
	Event[Event::Created][Event::SpawnY] = SpawnY;
	Event[Event::Created][Event::SpawnZ] = SpawnZ;
	Event[Event::Created][Event::Range] = range;
	Event[Event::Created][Event::vw] = vw;
	Event[Event::Created][Event::Started] = false;
	Event[Event::Created][Event::int] = int;
	Event[Event::Created][Event::Style] = style;
	Event[Event::Created][Event::MaxPlayers] = MaxPlayers;
	Event[Event::Created][Event::LeftPlayers] = 0;
	Event[Event::Created][Event::PlayerCantJoin] = false;
	if(funcidx("event_OnCreate") != -1) CallLocalFunction("event_OnCreate","dfffffffdddd", Event::Created,x,y,z,SpawnX,SpawnY,SpawnZ,range,vw,int,style,MaxPlayers);
	return 1;

}	