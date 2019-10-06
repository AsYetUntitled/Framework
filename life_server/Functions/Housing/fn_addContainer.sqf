#include "\life_server\script_macros.hpp"
/*
    File: fn_addContainer.sqf
    Author: NiiRoZz

    Description:
    Add container in Database.
*/
params [
    ["_uid","",[""]],
    ["_container",objNull,[objNull]]
];

if (isNull _container || {_uid isEqualTo ""}) exitWith {};

private _containerPos = getPosATL _container;

[format ["INSERT INTO containers (pid, pos, classname, inventory, gear, owned, dir) VALUES('%1', '%2', '%3', '""[[],0]""', '""[]""', '1', '%4')", _uid, _containerPos, typeOf _container, [vectorDir _container, vectorUp _container]],1] call DB_fnc_asyncCall;

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log format ["Query: INSERT INTO containers (pid, pos, classname, inventory, gear, owned, dir) VALUES('%1', '%2', '%3', '""[[],0]""', '""[]""', '1', '%4')", _uid, _containerPos, typeOf _container, [vectorDir _container, vectorUp _container]];
};

uiSleep 0.3;

_container setVariable ["container_id",(([format ["SELECT id FROM containers WHERE pos='%1' AND pid='%2' AND owned='1'",_containerPos,_uid],2] call DB_fnc_asyncCall) select 0),true];
