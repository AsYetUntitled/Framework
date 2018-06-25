#include "..\script_macros.hpp"
/*
    File: fn_initMedic.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the medic..
*/
waitUntil {!(isNull (findDisplay 46))};

if ((FETCH_CONST(life_medicLevel) isEqualTo 0) || ((LIFE_SETTINGS(getNumber,"admin_slotAccessAllowed_MEDIC") isEqualTo 0) && (FETCH_CONST(life_adminlevel) isEqualTo 0))) then {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	sleep 35;
};


[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
