#include "\life_hc\hc_macros.hpp"
/*
    File: fn_wantedFetch.sqf
    Author: Bryan "Tonic" Boardwine"
    Database Persistence By: ColinM
    Assistance by: Paronity
    Stress Tests by: Midgetgrimm

    This file is for Nanou's HeadlessClient.

    Description:
    Displays wanted list information sent from the server.
*/
private ["","_list","_result","_queryResult","_units","_inStatement"];
params [
    ["_ret",objNull,[objNull]]
];

if (isNull _ret) exitWith {};
private _inStatement = "";
private _list = [];
private _units = [];
{if ((side _x) isEqualTo civilian) then {_units pushBack (getPlayerUID _x)};} forEach playableUnits;

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

_query = format ["SELECT wantedID, wantedName FROM wanted WHERE active='1' AND wantedID in (%1)",_inStatement];
_queryResult = [_query,2,true] call HC_fnc_asyncCall;

diag_log format ["Query: %1",_query];


{
    _list pushBack (_x);
}
forEach _queryResult;

if (_list isEqualTo []) exitWith {[_list] remoteExec ["life_fnc_wantedList",_ret];};

[_list] remoteExec ["life_fnc_wantedList",_ret];
