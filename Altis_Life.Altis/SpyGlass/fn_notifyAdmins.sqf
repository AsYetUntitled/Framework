#include "..\script_macros.hpp"
/*
    File: fn_notifyAdmins.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Checks if player is admin and notifies them that of the
    flagged person.
*/



if (isNil "life_adminlevel") exitWith {};//Should fix undefined "Life_adminLevel"
if (isServer && {!hasInterface}) exitWith {};
if (FETCH_CONST(life_adminlevel) < 1) exitWith {};

hint parseText format [localize "STR_SpyDetect_CheaterFlagged", (_this select 0), (_this select 1)];
