#include "..\..\script_macros.hpp"
/*
    File: fn_isUIDActive.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sees if the UID passed to it is in the server.

    Returns:
    True if there was a match, false if not in server.
*/
params [
    ["_uid","",[""]];
];
if (_uid isEqualTo "") exitWith {false}; //Bad UID
private _ret = false;
{
    if (isPlayer _x && {getPlayerUID _x isEqualTo _uid}) exitWith {_ret = true;};
} forEach playableUnits;

_ret;
