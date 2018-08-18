#include "\life_hc\hc_macros.hpp"
/*
    File: fn_getVehicles.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Sends a request to query the database information and returns vehicles.
*/

params [
    ["_pid", "", [""]],
    ["_side", sideUnknown, [west]],
    ["_type", "", [""]],
    ["_unit", objNull, [objNull]]
];

//Error checks
if (_pid isEqualTo "" || {_side isEqualTo sideUnknown} || {_type isEqualTo ""} || {isNull _unit}) exitWith {
    if (!isNull _unit) then {
        [[]] remoteExec ["life_fnc_impoundMenu", _unit];
    };
};

_side = switch (_side) do {
    case west:{"cop"};
    case civilian: {"civ"};
    case independent: {"med"};
    default {"Error"};
};

if (_side isEqualTo "Error") exitWith {
    [[]] remoteExec ["life_fnc_impoundMenu", _unit];
};

private _query = format ["selectVehicles:%1:%2:%3", _pid, _side, _type];
private _queryResult = [_query, 2, true] call HC_fnc_asyncCall;

if (_queryResult isEqualType "") exitWith {
    [[]] remoteExec ["life_fnc_impoundMenu", _unit];
};

[_queryResult] remoteExec ["life_fnc_impoundMenu", _unit];
