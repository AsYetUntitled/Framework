/*
    File: fn_civMarkers.sqf
    Author:

    Description:
    Add markers for civilians in groups.
*/
private _markers = [];
private _members = [];

for "_i" from 0 to 1 step 0 do {
    sleep 0.5;
    if (visibleMap) then {
        _members = units (group player);
        {
            if !(_x isEqualTo player) then {
                private _marker = createMarkerLocal [format ["%1_marker",_x],visiblePosition _x];
                _marker setMarkerColorLocal "ColorCivilian";
                _marker setMarkerTypeLocal "Mil_dot";
                _marker setMarkerTextLocal format ["%1", _x getVariable ["realname",name _x]];
                _markers pushBack [_marker,_x];
            };
        } count _members;

        while {visibleMap} do
        {
            {
                _x params [
                    ["_mark","",[""]],
                    ["_unit",objNull,objNull]
                ];
                if (!isNil "_unit" && !isNull _unit) then {
                      _mark setMarkerPosLocal (visiblePosition _unit)
                };
            } count _markers;
            sleep 0.02;
        };

        {
            _x params [
                ["_marker","",[""]]
            ];
            deleteMarkerLocal _marker;
        } count _markers;
        _markers = [];
        _members = [];
    };
};
