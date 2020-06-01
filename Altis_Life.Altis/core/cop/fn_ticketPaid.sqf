#include "..\..\script_macros.hpp"
/*
    File: fn_ticketPaid.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Verifies that the ticket was paid.
*/

params [
    ["_value", 5, [0]],
    ["_unit", objNull, [objNull]]
];

if (isNull _unit || {!(_unit isEqualTo life_ticket_unit)}) exitWith {};
private _name = _unit getVariable ["realname",name _unit];

hint format [localize "STR_Cop_Ticket_PaidNOTF_2",_name];
BANK = BANK + _value;
[1] call SOCK_fnc_updatePartial;
