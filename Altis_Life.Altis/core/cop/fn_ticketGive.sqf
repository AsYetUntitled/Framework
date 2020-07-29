#include "..\..\script_macros.hpp"
/*
    File: fn_ticketGive.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Gives a ticket to the targeted player.
*/

if (isNil "life_ticket_unit") exitWith {
    hint localize "STR_Cop_TicketNil"
};

if (isNull life_ticket_unit) exitWith {
    hint localize "STR_Cop_TicketExist"
};

private _val = ctrlText 2652;
private _parsedVal = parseNumber _val;

if !([_val] call life_util_fnc_isNumber) exitWith {hint localize "STR_Cop_TicketNum"};

if (_parsedVal > 200000) exitWith {
    hint localize "STR_Cop_TicketOver100"
};

[0,"STR_Cop_TicketGive", true, [profileName, [_parsedVal] call life_fnc_numberText, life_ticket_unit getVariable ["realname", name life_ticket_unit]]] remoteExecCall ["life_fnc_broadcast", RCLIENT];
[player, _parsedVal] remoteExecCall ["life_fnc_ticketPrompt", life_ticket_unit];
closeDialog 0;
