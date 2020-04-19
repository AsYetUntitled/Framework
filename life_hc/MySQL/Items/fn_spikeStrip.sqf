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

if (hc_spikes isEqualTo []) then { //start monitoring spikestrips
    private _minSpikeSpeed = LIFE_SETTINGS(getNumber,"minimumSpikeSpeed");

    for "_i" from 0 to 1 step 0 do {
        if (hc_spikes isEqualTo []) exitWith {};
        private _toDelete = [];

        {
            private _pos = getPosATL _x;
            (nearestObjects [_pos,["Car"],5]) params [["_nearVeh", objNull]];
            if (alive _nearVeh && {abs (speed _nearVeh) > _minSpikeSpeed}) then {
                [_nearVeh] remoteExecCall ["life_fnc_spikeStripEffect",_nearVeh];
                deleteVehicle _x;
                _toDelete pushBack _forEachIndex;
            } else {
                if (isNull _object) then {
                    deleteVehicle _x;
                    _toDelete pushBack _forEachIndex;
                };
            };
        } forEach hc_spikes;

        reverse _toDelete;
        {
            hc_spikes deleteAt _x;
        };

        uiSleep 1e-6;
    };
};
