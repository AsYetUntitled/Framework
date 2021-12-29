#include "..\..\script_macros.hpp"
/*
    File: fn_spikeStrip.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Creates a spike strip and preps it.
*/
private _maxSpikeCount = LIFE_SETTINGS(getNumber,"maximumSpikestrips");
life_spikesDeployed = life_spikesDeployed - [objNull];
if (_maxSpikeCount isNotEqualTo -1 && {(count life_spikesDeployed) isEqualTo _maxSpikeCount}) exitWith {hint format [localize "STR_ISTR_MaxSpikesDeployed", _maxSpikeCount]};

private _spikeStrip = "Land_Razorwire_F" createVehicle [0,0,0];
_spikeStrip attachTo [player,[0,5.5,0]];
_spikeStrip setDir 90;
life_spikeStrip = _spikeStrip;
life_spikesDeployed pushBack _spikeStrip;

life_action_spikeStripDeploy = player addAction [localize "STR_ISTR_Spike_Place",life_fnc_deploySpikes,"",0,false,false,"",'!isNull life_spikestrip'];
