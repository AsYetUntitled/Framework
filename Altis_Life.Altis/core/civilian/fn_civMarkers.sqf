/*
    File: fn_civMarkers.sqf
    Author:

    Description:
    Add markers for civilians in groups.
*/
private _markers = [];

{
    private _marker = createMarkerLocal [format ["%1_marker",netID _x],getPosATL _x];
    _marker setMarkerColorLocal "ColorCivilian";
    _marker setMarkerTypeLocal "Mil_dot";
    _marker setMarkerTextLocal format ["%1", _x getVariable ["realname",name _x]];
    _markers pushBack [_marker,_x];
} forEach ((units (group player)) - [player]);

while {visibleMap} do {
    {
        _x params [
            ["_mark",""],
            ["_unit",objNull]
        ];
        if !(isNull _unit) then {
            _mark setMarkerPosLocal (getPosATL _unit);
        };
    } forEach _markers;
    uiSleep 0.01;
};

{
    _x params [["_mark",""]];
    deleteMarkerLocal _mark;
} forEach _markers;
