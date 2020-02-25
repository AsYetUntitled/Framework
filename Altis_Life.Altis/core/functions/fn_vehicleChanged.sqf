/*
    File: fn_vehicleChanged.sqf
    Author: blackfisch

    Description:
    handles player switching vehicles
*/
params [
    ["_unit", objNull, [objNull]],
    ["_role", "", [""]],
    ["_vehicle", objNull, [objNull]],
    ["_turret", [], [[]]]
];

//update view distance settings
[] call life_fnc_updateViewDistance;
