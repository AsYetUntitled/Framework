/*
    File: fn_insertVehicle.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Inserts the vehicle into the database
*/

params [
    "_uid",
    "_side",
    "_type",
    "_className",
    ["_color",-1,[0]],
    ["_plate",-1,[0]]
];

//Stop bad data being passed.
if (_uid isEqualTo "" || {_side isEqualTo ""} || {_type isEqualTo ""} || {_className isEqualTo ""} || {_color isEqualTo -1} || {_plate isEqualTo -1}) exitWith {};

private _query = format ["insertVehicle:%1:%2:%3:%4:%5:%6", _side, _className, _type, _uid, _color, _plate];
[_query, 1] call DB_fnc_asyncCall;
