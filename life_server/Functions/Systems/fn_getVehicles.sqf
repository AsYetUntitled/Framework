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
    ["_type","",[""]],
    ["_unit",objNull,[objNull]]
];

//Error checks
if (_pid isEqualTo "" || _side isEqualTo sideUnknown || _type isEqualTo "" || isNull _unit) exitWith {
    if (!isNull _unit) then {
        [[]] remoteExec ["life_fnc_impoundMenu",(owner _unit)];
    };
};

_unit = owner _unit;
_side = switch (_side) do {
    case west:{"cop"};
    case civilian: {"civ"};
    case independent: {"med"};
    default {"Error"};
};

if (_side IsEqualTo "Error") exitWith {
    [[]] remoteExec ["life_fnc_impoundMenu",(owner _unit)];
};

private _tickTime = diag_tickTime;
private _queryResult = [format ["SELECT id, side, classname, type, pid, alive, active, plate, color FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND side='%2' AND type='%3'",_pid,_side,_type],2,true] call DB_fnc_asyncCall;

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Client Query Request -------------";
    diag_log format ["QUERY: SELECT id, side, classname, type, pid, alive, active, plate, color FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND side='%2' AND type='%3'",_pid,_side,_type];
    diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
    diag_log format ["Result: %1",_queryResult];
    diag_log "------------------------------------------------";
};

if (_queryResult isEqualType "") exitWith {
    [[]] remoteExec ["life_fnc_impoundMenu",(owner _unit)];
};

[_queryResult] remoteExec ["life_fnc_impoundMenu",_unit];
