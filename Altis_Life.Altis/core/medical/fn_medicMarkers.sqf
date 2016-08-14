/*
    File: fn_medicMarkers.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Marks downed players on the map when it's open.
*/
private _markers = [];
private _units = [];

{
if (side _x isEqualTo independent) then 
    {
        _units pushBack ["ColorIndependent",_x,"Mil_dot",_x getVariable["realname",name _x]];
    };
} forEach playableUnits;

{
    _name = _x getVariable "name";
    _down = _x getVariable ["Revive",false];
    if (!isNil "_name" && !_down) then 
        {
            _units pushBack ["ColorRed",_x,"loc_Hospital",_x getVariable["realname",name _x]];
        };
} forEach allDeadMen;

{
    if ((_x select 1) != player) then 
    {
        private _marker = createMarkerLocal [format["%1_marker",(_x select 1)],visiblePosition (_x select 1)];
        _marker setMarkerColorLocal (_x select 0);
        _marker setMarkerTypeLocal (_x select 2);
        _marker setMarkerTextLocal format["%1", (_x select 3)];
        _markers pushBack [_marker,(_x select 1),_x select 3,_x select 2];
    };
} forEach _units;

while {(_this select 0)} do 
{
    if (!visibleMap) exitWith {{deleteMarkerLocal (_x select 0);} forEach _markers;};
    {
        private["_marker","_unit"];
        _marker = _x select 0;
        _unit = _x select 1;
        if !(_x select 3 isEqualTo "loc_Hospital") then {
            if (!isNil "_unit" && !isNull _unit) then 
            {
                _marker setMarkerPosLocal (visiblePosition _unit);
            };
        };
    } forEach _markers;
    sleep 0.02;
};
