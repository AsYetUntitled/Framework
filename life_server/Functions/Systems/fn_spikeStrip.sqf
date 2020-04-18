#include "\life_server\script_macros.hpp"
/*
    File: fn_spikeStrip.sqf
    Author: DomT602

    Description:
    Adds spikestrip to server-side array and if required - starts the monitoring of spikestrips.
*/
params [
    ["_spikeStrip", objNull, [objNull]]
];
if (isNull _spikeStrip) exitWith {};

server_spikes pushBack _spikeStrip;

if (server_spikes isEqualTo []) then { //start monitoring spikestrips
    private _minSpikeSpeed = LIFE_SETTINGS(getNumber,"minimumSpikeSpeed");

    for "_i" from 0 to 1 step 0 do {
        if (server_spikes isEqualTo []) exitWith {};
        private _toDelete = [];

        {
            private _pos = getPosATL _x;
            (nearestObjects [_pos,["Car"],5]) params [["_nearVeh", objNull]];
            if (alive _nearVeh && {speed _nearVeh > _minSpikeSpeed}) then {
                [_nearVeh] remoteExecCall ["life_fnc_spikeStripEffect",_nearVeh];
                deleteVehicle _x;
                _toDelete pushBack _forEachIndex;
            } else {
                if (isNull _object) then {
                    deleteVehicle _x;
                    _toDelete pushBack _forEachIndex;
                };
            };
        } forEach server_spikes;

        reverse _toDelete;
        {
            server_spikes deleteAt _x;
        };

        uiSleep 1e-6;
    };
};
