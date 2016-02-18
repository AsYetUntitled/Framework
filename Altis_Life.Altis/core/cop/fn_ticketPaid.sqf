#include "..\..\script_macros.hpp"
/*
	File: fn_ticketPaid.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Verifies that the ticket was paid.
*/
params [
	["_value",5,[0]],
	["_unit",objNull,[objNull]],
	["_cop",objNull,[objNull]]
];
if(isNull _unit OR {_unit != life_ticket_unit}) exitWith {}; //NO
if(isNull _cop OR {_cop != player}) exitWith {}; //Double NO

_copslitmoney = LIFE_SETTINGS(getNumber,"cops_slitmoney");

if (_value > _copslitmoney) then {
	[_value] spawn life_fnc_copSplit;
} else {
	ADD(BANK,_value);
};