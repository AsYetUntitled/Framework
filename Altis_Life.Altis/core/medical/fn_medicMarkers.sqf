/*
    File: fn_medicMarkers.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Marks downed players on the map when it's open.
*/
private _markers = [];
private _markersMedecin = [];
private _units = [];
private _medics = [];

{
    if (side _x isEqualTo independent) then {
        _medics pushBack _x
    };
} count playableUnits;

{
    _name = _x getVariable "name";
    _down = _x getVariable ["Revive",false];
    if (!isNil "_name" && !_down) then {
        _units pushBack _x;
    };
} count allDeadMen;

{
    if !(_x isEqualTo player) then {
        private _markerss = createMarkerLocal [format ["%1_marker",_x],visiblePosition _x];
        _markerss setMarkerColorLocal "ColorIndependent";
        _markerss setMarkerTypeLocal "Mil_dot";
        _markerss setMarkerTextLocal format ["%1", _x getVariable ["realname",name _x]];

        _markersMedecin pushBack [_markerss,_x];
    };
} count _medics;

//Loop through and create markers.
{
    private _marker = createMarkerLocal [format ["%1_dead_marker",_x],visiblePosition _x];
    _marker setMarkerColorLocal "ColorRed";
    _marker setMarkerTypeLocal "loc_Hospital";
    _marker setMarkerTextLocal format ["%1",(_x getVariable ["name","Unknown Player"])];
    _markers pushBack _marker;
} count _units;

while {visibleMap} do {
    {
        _x params [
            ["_mark","",[""]],
            ["_unit",objNull,objNull]
        ];
        if (!isNil "_unit" && !isNull _unit) then {
            _mark setMarkerPosLocal (visiblePosition _unit)
        };
    } forEach _markersMedecin;
    sleep 0.02;
};

{
    _x params [
        ["_marker","",[""]]
    ];
    deleteMarkerLocal _marker;
} count _markersMedecin;

_markersMedecin = [];
_medics = [];

{
    deleteMarkerLocal _x
} forEach _markers;
