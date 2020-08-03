/*
    File: fn_corpse.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Hides dead bodies.
*/

params [
    ["_corpse", objNull, [objNull]]
];

if (isNull _corpse) exitWith {};

deleteVehicle _corpse;
