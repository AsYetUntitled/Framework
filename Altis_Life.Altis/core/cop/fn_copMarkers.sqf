/*
    File: fn_copMarkers.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Marks cops on the map for other cops. Only initializes when the actual map is open.
*/
private _markers = [];
private _cops = [];

{
    if (side _x isEqualTo west) then {
        _cops pushBack _x
    };
    true
} count playableUnits; //Fetch list of cops / blufor

//Create markers
{
    if !(_x isEqualTo player) then {
        private _marker = createMarkerLocal [format ["%1_marker",_x],visiblePosition _x];
        _marker setMarkerColorLocal "ColorBLUFOR";
        _marker setMarkerTypeLocal "Mil_dot";
        _marker setMarkerTextLocal format ["%1", _x getVariable ["realname",name _x]];

        _markers pushBack [_marker,_x]
    };
    true
} count _cops;

while {visibleMap} do {
    {
        _x params [
            ["_mark","",[""]],
            ["_unit",objNull,[objNull]]
        ];
        if (!isNil "_unit" && {!isNull _unit}) then {
            _mark setMarkerPosLocal (visiblePosition _unit)
        };
        true
    } count _markers;
    uiSleep 0.02
};

{
    _x params [
        ["_marker","",[""]]
    ];
    deleteMarkerLocal _marker;
    true
} count _markers;
