#include "..\..\script_macros.hpp"
/*
    File: fn_garageRefund.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Returns players money as vehicle could not be spawned.
*/
params [
    ["_price",0,[0]]
];

hint localize "STR_Garage_SpawnPointError";
BANK = BANK + _price;
[1] call SOCK_fnc_updatePartial;
