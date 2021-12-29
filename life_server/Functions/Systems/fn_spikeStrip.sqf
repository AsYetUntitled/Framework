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

if (count server_spikes isEqualTo 1) then { //start monitoring spikestrips
    private _minSpikeSpeed = LIFE_SETTINGS(getNumber,"minimumSpikeSpeed");

    for "_i" from 0 to 1 step 0 do {
        if (server_spikes isEqualTo []) exitWith {};

        {
            (nearestObjects [_x,["Car"],5]) params [["_nearVeh", objNull]];
            if (alive _nearVeh && {abs (speed _nearVeh) > _minSpikeSpeed}) then {
                [_nearVeh] remoteExecCall ["life_fnc_spikeStripEffect",_nearVeh];
                deleteVehicle _x;
            };
        } forEach server_spikes;

        server_spikes = server_spikes - [objNull];

        uiSleep 1e-6;
    };
};
