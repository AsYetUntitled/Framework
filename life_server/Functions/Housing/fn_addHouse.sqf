#include "\life_server\script_macros.hpp"
/*
	File: fn_addHouse.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Blah
*/
private["_housePos","_query"];
params [
	["_uid","",[""]],
	["_house",objNull,[objNull]]
];
if(isNull _house OR _uid == "") exitWith {};

_housePos = getPosATL _house;

_query = format["INSERT INTO houses (pid, pos, owned) VALUES('%1', '%2', '1')",_uid,_housePos];
if(EXTDB_SETTING(getNumber,"DebugMode") == 1) then {
	diag_log format["Query: %1",_query];
};

[_query,1] call DB_fnc_asyncCall;

sleep 0.3;

_query = format["SELECT id FROM houses WHERE pos='%1' AND pid='%2' AND owned='1'",_housePos,_uid];
_queryResult = [_query,2] call DB_fnc_asyncCall;
//systemChat format["House ID assigned: %1",_queryResult select 0];
_house setVariable["house_id",(_queryResult select 0),true];
