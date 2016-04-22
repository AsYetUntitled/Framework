#include "..\..\script_macros.hpp"
/*
	File: fn_adminDebugCon.sqf
	Author: ColinM9991

	Description:
	Opens the Debug Console.
*/
if(FETCH_CONST(life_adminlevel) < 5) exitWith {closeDialog 0; hint localize "STR_NOTF_adminDebugCon";};
life_admin_debug = true;

createDialog "RscDisplayDebugPublic";
[0,format [localize "STR_NOTF_adminHasOpenedDebug",profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];

if(EQUAL(LIFE_SETTINGS(getNumber,"player_adminLog"),1)) then {
	_log = format ["%1 opened the debug console", profileName];
	[_log,true] remoteExecCall ["TON_fnc_logit",RSERV];
};
