#include "..\..\script_macros.hpp"
/*
	File: fn_copSplit.sqf
	Author: Devilfloh
*/
private ["_unit","_amount","_cops"];

_amount = [_this,0,0,[0]] call BIS_fnc_param;

_cops = [];
{
	if (side _x == west && _x distance (getMarkerPos "Respawn_west") > 300) then { _cops pushBack _x };
} forEach playableUnits;

_amount = floor (_amount / (count _cops));

{
	BANK = BANK + _amount;
} forEach _cops;

[0,format[localize "STR_Cop_splitmoney", [_amount] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",west];