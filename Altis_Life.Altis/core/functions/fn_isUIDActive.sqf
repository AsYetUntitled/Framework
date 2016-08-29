#include "..\..\script_macros.hpp"
/*
    File: fn_isUIDActive.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sees if the UID passed to it is in the server.

    Returns:
    True if there was a match, false if not in server.
*/
private["_uid","_ret"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
if (_uid isEqualTo "") exitWith {false}; //Bad UID
_ret = false;
{
    if (isPlayer _x && {getPlayerUID _x isEqualTo _uid}) exitWith {_ret = true;};
} forEach playableUnits;

_ret;
