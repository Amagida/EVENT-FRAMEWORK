#include <a_samp>


stock Event::GetInfo(eventid, argument[], out[])
{
	if(EventFuncs::strmatch(argument, "name"))
	{
		format(out, 64, "%s", Event[eventid][Event::Name]);
	}
	if(EventFuncs::strmatch(argument, "x"))
	{
		format(out, 64, "%f", Event[eventid][Event::x]);
	}
	if(EventFuncs::strmatch(argument, "y"))
	{
		format(out, 64, "%f", Event[eventid][Event::y]);
	}
	if(EventFuncs::strmatch(argument, "z"))
	{
		format(out, 64, "%f", Event[eventid][Event::z]);
	}
	if(EventFuncs::strmatch(argument, "range"))
	{
		format(out, 64, "%f", Event[eventid][Event::Range]);
	}
	if(EventFuncs::strmatch(argument, "SpawnX"))
	{
		format(out, 64, "%f", Event[eventid][Event::SpawnX]);
	}
	if(EventFuncs::strmatch(argument, "SpawnY"))
	{
		format(out, 64, "%f", Event[eventid][Event::SpawnY]);
	}
	if(EventFuncs::strmatch(argument, "SpawnZ"))
	{
		format(out, 64, "%f", Event[eventid][Event::SpawnZ]);
	}
	if(EventFuncs::strmatch(argument, "int"))
	{
		format(out, 64, "%d", Event[eventid][Event::int]);
	}
	if(EventFuncs::strmatch(argument, "vw"))
	{
		format(out, 64, "%d", Event[eventid][Event::vw]);
	}
	if(EventFuncs::strmatch(argument, "maxplayers"))
	{
		format(out, 64, "%d", Event[eventid][Event::MaxPlayers]);
	}
}