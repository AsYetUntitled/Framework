/*
    File: fn_copMarkers.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Marks cops on the map for other cops. Only initializes when the actual map is open.
*/
private _markers = [];
private _units = [];

{
if (side _x isEqualTo west) then 
    {
        _units pushBack ["ColorBLUFOR",_x,"Mil_dot",_x getVariable["realname",name _x]];
    };
} forEach playableUnits;

_medicsOnline = {_x != player && {side _x isEqualTo independent} && {alive _x}} count playableUnits > 0;
if (!_medicsOnline) then 
{
    {
        _name = _x getVariable "name";
        _down = _x getVariable ["Revive",false];
        if (!isNil "_name" && !_down) then 
        {
            _units pushBack ["ColorRed",_x,"loc_Hospital",_x getVariable["realname",name _x]];
        };
    } forEach allDeadMen;
};

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
