/*
    File: fn_getInMan.sqf
    Author: blackfisch

    Description:
    Handles player entering a vehicle.
*/
params [
    ["_unit", objNull, [objNull]],
    ["_role", "", [""]],
    ["_vehicle", objNull, [objNull]],
    ["_turret", [], [[]]]
];

//update view distance settings
[] call life_fnc_updateViewDistance;
