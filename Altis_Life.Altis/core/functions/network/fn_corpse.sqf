/*
    File: fn_corpse.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Hides dead bodies.
*/

params [
    ["_corpse", 0, [[],0]]
];

if (isNull _corpse) exitWith {};
if (alive _corpse) exitWith {};

deleteVehicle _corpse;