/*
    File: fn_vehicleWeight.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Calculates Vehicle Weight.
*/
params [
    ["_vehicle",objNull,[objNull]]
];
if (isNull _vehicle) exitWith {};

private _used = (_vehicle getVariable ["Trunk",[[],0]]) select 1;
private _weight = [typeOf _vehicle] call life_fnc_vehicleWeightCfg;

[_weight,_used];
