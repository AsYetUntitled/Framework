/*
    File: fn_setFuel.sqf
    Author: Bryan "Tonic" Boardwine

    Description: Used to set fuel levels in vehicles. (Ex. Service Chopper)
*/

params [
    ["_object", objNull, [objNull]],
    ["_value", 1, [0]]
];

if (isNull _object) exitWith {};

_object setFuel _value;
