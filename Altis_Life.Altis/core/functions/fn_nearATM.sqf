#include "..\..\script_macros.hpp"
/*
	File: fn_nearATM.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks if the player is near an ATM object on the map.
	
	RETURNS:
		0: BOOL (True for yes, false for no)
*/
private ["_objs","_return"];
_objs = nearestObjects [player, [], 3];
_return = false;
{
	if(["atm_",str(_x)] call BIS_fnc_inString) exitWith {_return = true;};
} foreach _objs;

_return;