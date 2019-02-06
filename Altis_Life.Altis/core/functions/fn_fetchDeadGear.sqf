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
private _loadout = getUnitLoadout _unit;
if (_dropWeapons isEqualTo 1) then {
    _loadout set [0,[]];//primaryWeapon
    _loadout set [1,[]];//secondaryWeapon
    _loadout set [2,[]];//handgunWeapon
};
_loadout;
