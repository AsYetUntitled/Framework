#include "..\..\script_macros.hpp"
/*
	File: fn_adminMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the admin menu, sorry nothing special in here. Take a look for yourself.
*/
private["_display","_list","_side"];
if(FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};

disableSerialization;

waitUntil {!isNull (findDisplay 2900)};
_list = CONTROL(2900,2902);
if(FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};
//Purge List
lbClear _list;

{
	_side = switch(side _x) do {case west: {"Cop"}; case civilian: {"Civ"}; case independent: {"Medic"}; default {"Unknown"};};
	_list lbAdd format["%1 - %2", _x GVAR ["realname",name _x],_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;
if(FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};