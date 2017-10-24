#include <a_samp>


static stock strmatch(const out1[], const out2[])
{
	if((strcmp(out1, out2, true, strlen(out2)) == 0) && (strlen(out2) == strlen(out1))) return true;
	else return false;
}	


#include "Event\utils\eventcreate.pwn"
#include "Event\player\playereventjoin.pwn"
#include "Event\utils\eventstart.pwn"
#include "Event\player\playereventrange.pwn"
#include "Event\utils\eventgetfuncs.pwn"
#include "Event\player\playereliminate.pwn"
#include "Event\player\playercheckwinner.pwn"
