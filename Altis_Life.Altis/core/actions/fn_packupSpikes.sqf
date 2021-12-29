/*
    File: fn_packupSpikes.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Packs up a deployed spike strip.
*/
(nearestObjects [player,["Land_Razorwire_F"],8]) params [["_spikes", objNull]];
if (isNull _spikes) exitWith {};

if ([true,"spikeStrip",1] call life_fnc_handleInv) then {
    private _index = life_spikesDeployed findIf {_x isEqualTo _spikes};
    life_spikesDeployed deleteAt _index; //remove spikes from spike array
    titleText [localize "STR_NOTF_SpikeStrip","PLAIN"];
    deleteVehicle _spikes;
};
