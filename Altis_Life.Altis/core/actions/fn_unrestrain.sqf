/*
	File: fn_unrestrain.sqf
*/
private["_unit"];
_unit = cursorTarget;

if(isNull _unit || !(_unit getVariable "restrained")) exitWith {};

_unit setVariable["restrained",false,true];
[[0,format["%1 was unrestrained by %2", name _unit, name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;