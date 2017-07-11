#include "..\..\script_macros.hpp"
/*
    File: fn_loadDeadGear.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    BLAH
*/
private _loadout = [_this,0,[[],[],[],[],[],[],"","",[],[]],[[]]] call BIS_fnc_param;
player setUnitLoadout _loadout;
