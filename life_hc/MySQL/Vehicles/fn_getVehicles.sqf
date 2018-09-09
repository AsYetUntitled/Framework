#include "\life_hc\hc_macros.hpp"
/*
    File: fn_getVehicles.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Sends a request to query the database information and returns vehicles.
*/
params [
    ["_pid","",[""]],
    ["_side",sideUnknown,[west]],
    ["_type","",[""]]
];
if (remoteExecutedOwner isEqualTo 0) exitWith {};

//Error checks
if (_pid isEqualTo "" || {_side isEqualTo sideUnknown} || {_type isEqualTo ""}) exitWith {
    if !(isNull remoteExecutedOwner) then {
        [[]] remoteExec ["life_fnc_impoundMenu",remoteExecutedOwner];
    };
};

_side = switch _side do {
    case west: {"cop"};
    case civilian: {"civ"};
    case independent: {"med"};
    default {"Error"};
};

if (_side isEqualTo "Error") exitWith {
    [[]] remoteExec ["life_fnc_impoundMenu",remoteExecutedOwner];
};

private _query = format ["SELECT id, side, classname, type, pid, alive, active, plate, color FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND side='%2' AND type='%3'",_pid,_side,_type];
private _queryResult = [_query,2,true] call HC_fnc_asyncCall;

if (_queryResult isEqualType "") exitWith {
    [[]] remoteExec ["life_fnc_impoundMenu",remoteExecutedOwner];
};

[_queryResult] remoteExec ["life_fnc_impoundMenu",remoteExecutedOwner];
