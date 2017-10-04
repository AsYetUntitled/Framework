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

private _weight = -1;
(_vehicle getVariable "Trunk") params ["","_used"];
_weight = [(typeOf _vehicle)] call life_fnc_vehicleWeightCfg;

if (isNil "_used") then {_used = 0};
[_weight,_used];
