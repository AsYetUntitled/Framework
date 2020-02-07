#include "\life_hc\hc_macros.hpp"
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

_group setVariable ["gang_owner",nil,true];
[format ["UPDATE gangs SET active='0' WHERE id='%1'",_groupID],1] call HC_fnc_asyncCall;

[_group] remoteExecCall ["life_fnc_gangDisbanded",(units _group)];
waitUntil {(units _group) isEqualTo []};
deleteGroup _group;