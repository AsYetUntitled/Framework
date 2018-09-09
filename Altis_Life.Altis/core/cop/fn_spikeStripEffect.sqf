/*
    File: fn_spikeStripEffect.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Doesn't work without the server-side effect but shifted part of it clientside
    so code can easily be changed. Ultimately it just pops the tires.
*/
params [
    ["_vehicle",objNull,[objNull]]
];
if (isNull _vehicle) exitWith {}; //Bad vehicle type

_vehicle setHitPointDamage["HitLFWheel",1];
_vehicle setHitPointDamage["HitRFWheel",1];
