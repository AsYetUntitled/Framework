/*
    File: fn_simDisable.sqf
    Author:

    Description:

*/
private ["_obj","_bool"];
params [
    ["_obj",objNull,[objNull]];
    ["_bool",false,[false]];
];
if (isNull _obj) exitWith {};

_obj enableSimulation _bool;