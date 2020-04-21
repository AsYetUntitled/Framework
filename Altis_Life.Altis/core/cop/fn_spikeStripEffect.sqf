/*
    File: fn_spikeStripEffect.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Pops the vehicles tyres - required due to the local arguments for setHitPointDamage being local.
*/

params [
    ["_vehicle",objNull,[objNull]]
];

if (isNull _vehicle) exitWith {};

_vehicle setHitPointDamage ["HitLFWheel",1];
_vehicle setHitPointDamage ["HitRFWheel",1];
