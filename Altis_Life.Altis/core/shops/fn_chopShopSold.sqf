#include "..\..\script_macros.hpp"
/*
	File: fn_chopShopSold.sqf
	Author: Casperento
	
	Description:
	Finish chop shop sell process properly
*/
params [
	["_price",-1,[-1]],
	"_displayName"
];

life_action_inUse = false;

if (_price > 0) then {
	CASH = CASH + _price;
	[1,"STR_NOTF_ChopSoldCar",true,[_displayName,[_price] call life_fnc_numberText]] call life_fnc_broadcast;
};