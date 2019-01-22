#include "\life_hc\hc_macros.hpp"
/*
    File: fn_spikeStrip.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    This is the server-side part of it which constantly monitors the spike strip and vehicles near it.
    First originally tried triggers but I was never any good at those nor do I like them as they
    have a global effect.
*/
private "_nearVehicles";

params [
    ["_spikeStrip",objNull,[objNull]]
];

if (isNull _spikeStrip) exitWith {}; //Bad vehicle type passed.

waitUntil { _nearVehicles = nearestObjects[getPos _spikeStrip,["Car"],5]; != [] _nearVehicles || isNull _spikeStrip };

if (isNull _spikeStrip) exitWith {}; //It was picked up?
(_nearVehicles) params ["_vehicle",objNull,[objNull]];

if (isNull _vehicle) exitWith { deleteVehicle _spikeStrip; };
[_vehicle] remoteExec ["life_fnc_spikeStripEffect", _vehicle];
deleteVehicle _spikeStrip;
