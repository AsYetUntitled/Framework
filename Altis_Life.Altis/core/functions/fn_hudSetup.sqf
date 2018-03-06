#include "..\..\script_macros.hpp"
/*
    File: fn_hudSetup.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Setups the hud for the player?
*/
disableSerialization;

cutRsc ["playerHUD", "PLAIN", 2, false];
[] call life_fnc_hudUpdate;

[] spawn
{
    for "_i" from 0 to 1 step 0 do {
        private _dam = damage player;
        private _thirst = life_thirst;
        private _hunger = life_hunger;
        waitUntil {!((damage player) isEqualTo _dam) || {!(life_thirst isEqualTo _thirst)} || {!(life_hunger isEqualTo _hunger)}};
        [] call life_fnc_hudUpdate;
    };
};
