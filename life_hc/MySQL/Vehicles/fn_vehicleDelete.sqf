/*
    File: fn_vehicleDelete.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Doesn't actually delete since we don't give our DB user that type of
    access so instead we set it to alive=0 so it never shows again.
*/

params [
    ["_vid", -1, [0]],
    ["_pid", "", [""]],
    ["_sp", 2500, [0]],
    ["_unit", objNull, [objNull]],
    ["_type", "", [""]]
];

if (_vid isEqualTo -1 || {_pid isEqualTo ""} || {_sp isEqualTo 0} || {isNull _unit} || {_type isEqualTo ""}) exitWith {};

private _query = format ["deleteVehicleID:%1:%2", _pid, _vid];
private _thread = [_query, 1] call HC_fnc_asyncCall;
