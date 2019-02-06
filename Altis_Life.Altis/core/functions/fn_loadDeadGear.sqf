#include "..\..\script_macros.hpp"
/*
    File: fn_loadDeadGear.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    BLAH
*/
params [["_loadout",[],[[]]]];
player setUnitLoadout _loadout;
[] call life_fnc_playerSkins;
