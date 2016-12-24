#include "..\script_macros.hpp"
/*
    File: fn_initMedic.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the medic..
*/
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if ((FETCH_CONST(life_medicLevel)) < 1 && (FETCH_CONST(life_adminlevel) isEqualTo 0)) exitWith {
    ["Notwhitelisted",false,true] call BIS_fnc_endMission;
    sleep 35;
};

// -- Restrict Weapons
if (LIFE_SETTINGS(getNumber,"restrict_medic_weapons") isEqualTo 1) then {
    private _firedEVH = player addEventHandler ["Fired, {
        // -- Get Params
        params ["_unit", "", "", "_weapon"];
        
        // -- Check if weapon is equipped
        if (!(_weapon _unit isEqualTo "")) then {
            // -- Remove Weapon from Player
            removeWeapon _weapon player;
        };
    }];
};

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
