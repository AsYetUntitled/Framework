#include "..\..\script_macros.hpp"
/*
	File: fn_adminDebugCon.sqf
	Author: ColinM9991

	Description:
	Opens the Debug Console.
*/
if(FETCH_CONST(life_adminlevel) < 5) exitWith {closeDialog 0; hint "You have no business using this";};
life_admin_debug = true;

createDialog "RscDisplayDebugPublic";
[0,format["Admin %1 has opened the Debug Console.",profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
