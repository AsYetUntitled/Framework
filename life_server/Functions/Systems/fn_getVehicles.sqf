#include "\life_server\script_macros.hpp"
/*
    File: fn_getVehicles.sqf
    Author: Bryan "Tonic" Boardwine

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
private _tickTime = diag_tickTime;
private _queryResult = [_query,2,true] call DB_fnc_asyncCall;

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Client Query Request -------------";
    diag_log format ["QUERY: %1",_query];
    diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
    diag_log format ["Result: %1",_queryResult];
    diag_log "------------------------------------------------";
};

if (_queryResult isEqualType "") exitWith {
    [[]] remoteExec ["life_fnc_impoundMenu",remoteExecutedOwner];
};

[_queryResult] remoteExec ["life_fnc_impoundMenu",remoteExecutedOwner];
