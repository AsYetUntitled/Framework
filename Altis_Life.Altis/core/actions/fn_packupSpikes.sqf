/*
    File: fn_packupSpikes.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Packs up a deployed spike strip.
*/
(nearestObjects[getPos player,["Land_Razorwire_F"],5]) params ["_spikes",objNull,[objNull]];
if (isNull _spikes) exitWith {};

if ([true,"spikeStrip",1] call life_fnc_handleInv) then {
    titleText[localize "STR_NOTF_SpikeStrip", "PLAIN"];
    deleteVehicle _spikes;
};
