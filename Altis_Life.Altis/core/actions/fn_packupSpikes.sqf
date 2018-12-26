/*
    File: fn_packupSpikes.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Packs up a deployed spike strip.
*/
private _spikes = nearestObjects[getPos player,["Land_Razorwire_F"],5] select 0;
if (isNil "_spikes") exitWith {};

[true,"spikeStrip",1] call life_fnc_handleInv;
titleText[localize "STR_NOTF_SpikeStrip", "PLAIN"];
deleteVehicle _spikes;
