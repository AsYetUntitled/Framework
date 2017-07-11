#include "..\..\script_macros.hpp"
/*
    File: fn_fetchDeadGear.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Fetches gear off of a body.
*/

params [["_unit",objNull,[objNull]]];

if (isNull _unit) exitWith {};

private _dropWeapons = LIFE_SETTINGS(getNumber,"drop_weapons_onDeath");
private _loadout = getUnitLoadout player;
if (_dropWeapons isEqualTo 1) then {
    {
        _loadout set [_x,[]];
    } count [0,1,2];
};
_loadout;
