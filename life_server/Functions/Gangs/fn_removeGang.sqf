#include "\life_server\script_macros.hpp"
/*
    File: fn_removeGang.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Removes gang from database
*/

params [
    ["_group", grpNull, [grpNull]]
];

if (isNull _group) exitWith {};

private _groupID = _group getVariable ["gang_id",-1];
if (_groupID isEqualTo -1) exitWith {};

_group setVariable ["gang_owner",nil,true];
[format ["deleteGang:%1", _groupID], 1] call DB_fnc_asyncCall;

[_group] remoteExecCall ["life_fnc_gangDisbanded", (units _group)];
uiSleep 5;
deleteGroup _group;