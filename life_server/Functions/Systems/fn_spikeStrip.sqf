#include "\life_server\script_macros.hpp"
/*
    File: fn_spikeStrip.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    This is the server-side part of it which constantly monitors the spike strip and vehicles near it.
    First originally tried triggers but I was never any good at those nor do I like them as they
    have a global effect.
*/
params [
    ["_spikeStrip",[objNull],[objNull]]
];
if (isNull _spikeStrip) exitWith {}; //Bad vehicle type passed.

private _pos = getPosATL _spikeStrip;
private _nearVehicles = [];
waitUntil {
    _nearVehicles = nearestObjects[_pos,["Car"],5]; 
    !(_nearVehicles isEqualTo []) || 
    isNull _spikeStrip
};

if (isNull _spikeStrip) exitWith {}; //It was picked up?

_nearVehicles params [
    ["_vehicle",objNull,[objNull]]
];
if (isNull _vehicle) exitWith {};
[_vehicle] remoteExec ["life_fnc_spikeStripEffect",_vehicle];
deleteVehicle _spikeStrip;