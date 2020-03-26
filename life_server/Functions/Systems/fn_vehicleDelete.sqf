/*
    File: fn_vehicleDelete.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Sets the vehicle to be 'dead' so it can be cleaned up later.
*/

params [
    ["_unit",objNull,[objNull]],
    ["_plate","",[""]]
];
if (isNull _unit || {_plate isEqualTo ""}) exitWith {};

private _pid = getPlayerUID _unit;
private _query = format ["deleteVehicle:%1:%2", _pid, _plate];
[_query, 1] call DB_fnc_asyncCall;
