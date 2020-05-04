#include "\life_hc\hc_macros.hpp"
/*
    File: fn_getVehicles.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Sends a request to query the database information and returns vehicles.
*/
params [
    ["_unit", objNull, [objNull]],
    ["_type", "", [""]]
];

if (isNull _unit || {_type isEqualTo ""}) exitWith {
    if !(isNull _unit) then {
        [[]] remoteExec ["life_fnc_impoundMenu",_unit];
    };
};

private _side = [_unit,true] call life_util_fnc_sideToString;

if (_side isEqualTo "Unknown") exitWith {
    [[]] remoteExec ["life_fnc_impoundMenu",_unit];
};

private _query = format ["selectVehicles:%1:%2:%3", _pid, _side, _type];
private _queryResult = [_query, 2, true] call HC_fnc_asyncCall;

if (_queryResult isEqualType "") exitWith {
    [[]] remoteExec ["life_fnc_impoundMenu", _unit];
};

[_queryResult] remoteExec ["life_fnc_impoundMenu", _unit];
