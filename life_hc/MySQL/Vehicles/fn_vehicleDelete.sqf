/*
    File: fn_vehicleDelete.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Sets the vehicle to be 'dead' so it can be cleaned up later.
*/
params [
    ["_unit",objNull,[objNull]],
    ["_vid",-1,[0]]
];
if (isNull _unit || {_vid isEqualTo -1}) exitWith {};

private _pid = getPlayerUID _unit;
private _query = format ["deleteVehicle:%1:%2", _pid, _vid];
[_query, 1] call HC_fnc_asyncCall;
