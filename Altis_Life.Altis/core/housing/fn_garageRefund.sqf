#include "..\..\script_macros.hpp"
/*
    File: fn_garageRefund.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    I don't know?
*/
params [
	["_house","",[""]],
	["_unit",objNull,[objNull]]
];
if !(_unit isEqualTo player) exitWith {};
BANK = BANK + _price;
[1] call SOCK_fnc_updatePartial;
