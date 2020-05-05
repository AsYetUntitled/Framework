#include "..\..\script_macros.hpp"
/*
    File: fn_ticketPrompt
    Author: Bryan "Tonic" Boardwine

    Description:
    Prompts the player that he is being ticketed.
*/

if (!isNull (findDisplay 2600)) exitWith {};

params [
    ["_cop", objNull, [objNull]],
    ["_val", -1, [0]]
];

if (isNull _cop || {_val isEqualTo -1}) exitWith {};

createDialog "life_ticket_pay";

life_ticket_paid = false;
life_ticket_val = _val;
life_ticket_cop = _cop;

CONTROL(2600,2601) ctrlSetStructuredText parseText format ["<t align='center'><t size='.8px'>" + (localize "STR_Cop_Ticket_GUI_Given"), _cop getVariable ["realname",name _cop], _val];

[] spawn {
    waitUntil {life_ticket_paid || {isNull (findDisplay 2600)}};
    if (isNull (findDisplay 2600) && {!life_ticket_paid}) then {
        [0, "STR_Cop_Ticket_Refuse", true, [profileName]] remoteExecCall ["life_fnc_broadcast", west];
        [1, "STR_Cop_Ticket_Refuse", true, [profileName]] remoteExecCall ["life_fnc_broadcast", life_ticket_cop];
    };
};
