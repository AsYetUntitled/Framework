#include "\life_hc\hc_macros.hpp"
/*
    File: fn_spikeStrip.sqf
    Author: DomT602

    This file is for Nanou's HeadlessClient.

    Description:
    Adds spikestrip to hc-side array and if required - starts the monitoring of spikestrips.
*/
params [
    ["_spikeStrip", objNull, [objNull]]
];
if (isNull _spikeStrip) exitWith {};

hc_spikes pushBack _spikeStrip;

if (count hc_spikes isEqualTo 1) then { //start monitoring spikestrips
    private _minSpikeSpeed = LIFE_SETTINGS(getNumber,"minimumSpikeSpeed");

    for "_i" from 0 to 1 step 0 do {
        if (hc_spikes isEqualTo []) exitWith {};

        {
            (nearestObjects [_x,["Car"],5]) params [["_nearVeh", objNull]];
            if (alive _nearVeh && {abs (speed _nearVeh) > _minSpikeSpeed}) then {
                [_nearVeh] remoteExecCall ["life_fnc_spikeStripEffect",_nearVeh];
                deleteVehicle _x;
            };
        } forEach hc_spikes;

        hc_spikes = hc_spikes - [objNull];

        uiSleep 1e-6;
    };
};
