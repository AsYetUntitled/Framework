#include "..\..\script_macros.hpp"
/*
    File: fn_gankBankResponse.sqf
    Author: DomT602
    Description:
    Recieves response from the server.
*/
params [
    ["_value",-1,[0]]
];

if (_value isEqualTo -1) exitWith {};

hint format ["You successfully withdrew $%1.",_value];
CASH = CASH + _value;
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;