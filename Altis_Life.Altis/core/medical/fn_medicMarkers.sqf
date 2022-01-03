/*
    File: fn_medicMarkers.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Marks downed players on the map when it's open.
*/
private _deadMarkers = [];
private _medicMarkers = [];

{
    private _marker = createMarkerLocal [format ["%1_marker",netID _x],getPosATL _x];
    _marker setMarkerColorLocal "ColorIndependent";
    _marker setMarkerTypeLocal "Mil_dot";
    _marker setMarkerTextLocal format ["%1", _x getVariable ["realname",name _x]];
    _medicMarkers pushBack [_marker,_x];
} forEach ((units independent) - [player]);

{
    private _name = _x getVariable "name";
    private _down = _x getVariable ["Revive",false];
    if (!isNil "_name" && !_down) then {
        private _marker = createMarkerLocal [format ["%1_dead_marker",_x],getPosATL _x];
        _marker setMarkerColorLocal "ColorRed";
        _marker setMarkerTypeLocal "loc_Hospital";
        _marker setMarkerTextLocal format ["%1",_name];
        _deadMarkers pushBack _marker;
    };
} forEach allDeadMen;

while {visibleMap} do {
    {
        _x params [
            ["_mark",""],
            ["_unit",objNull]
        ];
        if !(isNull _unit) then {
            _mark setMarkerPosLocal (getPosATL _unit);
        };
    } forEach _medicMarkers;
    sleep 0.01;
};

{
    _x params [["_mark",""]];
    deleteMarkerLocal _mark;
} forEach _medicMarkers;

{
    deleteMarkerLocal _x;
} forEach _deadMarkers;
