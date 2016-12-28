#include "..\script_macros.hpp"
/*
    File: fn_notifyAdmins.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Checks if player is admin and notifies them that of the
    flagged person.
*/
if (isServer || !hasInterface) then {
    diag_log format ["SPY-GLASS Cheater Flagged Name: %1 Detection: %2",(_this select 0),(_this select 1)];
} else {
    if (FETCH_CONST(life_adminlevel) < 1) exitWith {};
    hint parseText format ["<t align='center'><t color='#FF0000'><t size='3'>SPY-GLASS</t></t><br/>Cheater Flagged</t><br/><br/>Name: %1<br/>Detection: %2",(_this select 0),(_this select 1)];
};
