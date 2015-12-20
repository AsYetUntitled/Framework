#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours later...
*/
private["_grp","_grpMembers"];
if(EQUAL(steamid,(grpPlayer GVAR "gang_owner"))) exitWith {hint localize "STR_GNOTF_LeaderLeave"};

_grp = grpPlayer;
_grpMembers = grpPlayer GVAR "gang_members";
SUB(_grpMembers,[steamid]);
_grp SVAR ["gang_members",_grpMembers,true];
[player] joinSilent (createGroup civilian);

[_unit,grpPlayer] remoteExec ["TON_fnc_clientGangLeft",_unit];
[4,_grp] remoteExec ["TON_fnc_updateGang",RSERV];
closeDialog 0;