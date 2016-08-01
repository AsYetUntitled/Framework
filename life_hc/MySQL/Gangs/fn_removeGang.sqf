#include "\life_hc\hc_macros.hpp"
/*
    File: fn_removeGang.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Blah
*/
private ["_group","_groupID"];
_group = param [0,grpNull,[grpNull]];
if (isNull _group) exitWith {};

_groupID = _group getVariable ["gang_id",-1];
if (_groupID isEqualTo -1) exitWith {};

[format ["UPDATE gangs SET active='0' WHERE id='%1'",_groupID],1] call HC_fnc_asyncCall;

_result = [format ["SELECT id FROM gangs WHERE active='1' AND id='%1'",_groupID],2] call HC_fnc_asyncCall;
if (count _result isEqualTo 0) then {
    [_group] remoteExecCall ["life_fnc_gangDisbanded",(units _group)];
    sleep 5;
    deleteGroup _group;
};
["CALL deleteOldGangs",1] call DB_fnc_asyncCall;
