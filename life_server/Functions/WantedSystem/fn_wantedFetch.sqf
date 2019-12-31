#include "\life_server\script_macros.hpp"
/*
    File: fn_wantedFetch.sqf
    Author: Bryan "Tonic" Boardwine"
    Database Persistence By: ColinM
    Assistance by: Paronity
    Stress Tests by: Midgetgrimm

    Description:
    Displays wanted list information sent from the server.
*/

params [
    ["_ret", objNull, [objNull]]
];

if (isNull _ret) exitWith {};
_ret = owner _ret;
private _inStatement = "";
private _list = [];
private _units = [];
{
    if (side _x isEqualTo civilian) then {_units pushBack (getPlayerUID _x)};
    false
} count playableUnits;

if (_units isEqualTo []) exitWith {[_list] remoteExec ["life_fnc_wantedList",_ret];};

{
    if (count _units > 1) then {
        if (_inStatement isEqualTo "") then {
            _inStatement = "'" + _x + "'";
        } else {
            _inStatement = _inStatement + ", '" + _x + "'";
        };
    } else {
        _inStatement = _x;
    };
} forEach _units;

private _query = format ["selectWantedActiveID:%1", _inStatement];
private _queryResult = [_query,2,true] call DB_fnc_asyncCall;
if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log format ["Query: %1",_query];
};

{
    _list pushBack _x;
    false
} count _queryResult;

if (_list isEqualTo []) exitWith {[_list] remoteExec ["life_fnc_wantedList",_ret];};

[_list] remoteExec ["life_fnc_wantedList",_ret];
