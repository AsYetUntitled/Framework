#include "\life_hc\hc_macros.hpp"
/*
    File: fn_addContainer.sqf
    Author: NiiRoZz

    This file is for Nanou's HeadlessClient.

    Description:
    Add container in Database.
*/
private ["_containerPos","_query","_className","_dir"];
params [
    ["_uid","",[""]],
    ["_container",objNull,[objNull]]
];

if (isNull _container || _uid isEqualTo "") exitWith {};

_containerPos = getPosATL _container;
_className = typeOf _container;
_dir = [vectorDir _container, vectorUp _container];

_query = format ["INSERT INTO containers (pid, pos, classname, inventory, gear, owned, dir) VALUES('%1', '%2', '%3', '""[[],0]""', '""[]""', '1', '%4')",_uid,_containerPos,_className,_dir];
[_query,1] call HC_fnc_asyncCall;

sleep 0.3;

_query = format ["SELECT id FROM containers WHERE pos='%1' AND pid='%2' AND owned='1'",_containerPos,_uid];
_queryResult = [_query,2] call HC_fnc_asyncCall;

_container setVariable ["container_id",(_queryResult select 0),true];
