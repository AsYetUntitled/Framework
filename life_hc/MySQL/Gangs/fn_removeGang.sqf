#include "\life_hc\hc_macros.hpp"
/*
    File: fn_removeGang.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Blah
*/

params [
    ["_group", grpNull, [grpNull]]
];

if (isNull _group) exitWith {};

private _groupID = _group getVariable ["gang_id",-1];
if (_groupID isEqualTo -1) exitWith {};

[format ["deleteGang:%1", _groupID], 1] call HC_fnc_asyncCall;

_result = [format ["selectGang:%1", _groupID], 2] call HC_fnc_asyncCall;
if (_result isEqualTo []) then {
    [_group] remoteExecCall ["life_fnc_gangDisbanded",(units _group)];
    sleep 5;
    deleteGroup _group;
};
["deleteOldGangs", 1] call HC_fnc_asyncCall;
