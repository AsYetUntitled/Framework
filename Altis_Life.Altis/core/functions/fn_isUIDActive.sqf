#include "..\..\script_macros.hpp"
/*
    File: fn_isUIDActive.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sees if the UID passed to it is in the server.

    Returns:
    True if there was a match, false if not in server.
*/
if !(params ["_uid", "", [""]]) exitWith {};
if (_uid isEqualTo "") exitWith {false};

private _ret = false;
{
    if (isPlayer _x && {getPlayerUID _x isEqualTo _uid}) exitWith {_ret = true};
    true
} count playableUnits;

_ret
