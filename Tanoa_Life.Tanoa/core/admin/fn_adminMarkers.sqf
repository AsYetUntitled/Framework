#include "..\..\script_macros.hpp"
/*
    File: fn_adminMarkers.sqf
    Author: Jason_000
    Description: Display markers for all players
*/

params [
    ["_reOpen", false, [false]]
];

if (FETCH_CONST(life_adminlevel) < 4) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

life_markers_active = true;

if !(_reOpen) then {
    life_markers = !life_markers;
    hint localize (["STR_ANOTF_MDisabled", "STR_ANOTF_MEnabled"] select life_markers);
};

for "_i" from 0 to 1 step 0 do {
    if !(life_markers && {life_markers_active}) exitWith {};
    private _markers = [];

    {
        private _colour = switch (side _x) do {
            case west: {"colorBLUFOR"};
            case independent: {"colorIndependent"};
            case east: {"colorOPFOR"};
            default {"colorCivilian"};
        };

        private _name = name _x;
        createMarkerLocal[_name, position _x];
        _name setMarkerTypeLocal "mil_dot";
        _name setMarkerColorLocal _colour;
        _name setMarkerTextLocal _name;
        _markers pushBack _name;
        true

    } count (allPlayers - entities "HeadlessClient_F");

    sleep 0.5;
    {deleteMarkerLocal _x} count _markers;

};
