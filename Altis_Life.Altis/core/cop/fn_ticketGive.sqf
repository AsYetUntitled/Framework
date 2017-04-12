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

if !([_val] call TON_fnc_isnumber) exitWith {
    hint localize "STR_Cop_TicketNum"
};

private _parsedVal = parsgeNumber _val;

if (_parsedVal > 200000) exitWith {
    hint localize "STR_Cop_TicketOver100"
};

[0,"STR_Cop_TicketGive", true, [profileName, [_parsedVal] call life_fnc_numberText, life_ticket_unit getVariable ["realname", name life_ticket_unit]]] remoteExecCall ["life_fnc_broadcast", RCLIENT];
[player, _parsedVal] remoteExec ["life_fnc_ticketPrompt", life_ticket_unit];
closeDialog 0;
