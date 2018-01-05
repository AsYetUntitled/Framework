#include "\life_server\script_macros.hpp"
/*
    File: fn_removeGang.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Removes gang from database
*/
private ["_group","_groupID"];
_group = param [0,grpNull,[grpNull]];
if (isNull _group) exitWith {};

_groupID = _group getVariable ["gang_id",-1];
if (_groupID isEqualTo -1) exitWith {};

[format ["deleteGang:%1", _groupID], 1] call DB_fnc_asyncCall;

_result = [format ["deleteGang:%1", _groupID], 2] call DB_fnc_asyncCall;
if (_result isEqualTo []) then {
    [_group] remoteExecCall ["life_fnc_gangDisbanded",(units _group)];
    uiSleep 5;
    deleteGroup _group;
};
["deleteOldGangs", 1] call DB_fnc_asyncCall;
