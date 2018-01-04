#include "..\..\script_macros.hpp"
/*
    File: fn_adminMarkers.sqf
    Author: Jason_000
    Description: Display markers for all players
*/
if (FETCH_CONST(life_adminlevel) < 4) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

life_markers = !life_markers;
hint localize (["STR_ANOTF_MEnabled", "STR_ANOTF_MDisabled"] select life_markers);

for "_i" from 0 to 1 step 0 do {
    if !(life_markers) exitWith {};
    private _markers = [];
    private _name = name _x;

    {
        private _colour = switch (side _x) do {
            case west: {"colorBLUFOR"};
            case independent: {"colorIndependent"};
            case east: {"colorOPFOR"};
            default {"colorCivilian"};
        };

        createMarkerLocal[_name, position _x];
        _name setMarkerColorLocal _colour;
        _name setMarkerTypeLocal "mil_dot";
        _markers pushBack _name;

    } count (allPlayers - entities "HeadlessClient_F");

    {deleteMarkerLocal _x} count _markers;
    sleep 0.5;

};
