#include "\life_hc\hc_macros.hpp"
/*
	File: fn_getVehicles.sqf
	Author: Bryan "Tonic" Boardwine

	This file is for Nanou's HeadlessClient.
	
	Description:
	Sends a request to query the database information and returns vehicles.
*/
private["_pid","_side","_type","_unit","_ret","_tickTime","_queryResult"];
_pid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[west]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_unit = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if(_pid == "" OR _side == sideUnknown OR _type == "" OR isNull _unit) exitWith {
	if(!isNull _unit) then {
		[[]] remoteExecCall ["life_fnc_impoundMenu",_unit];
	};
};

_side = switch(_side) do {
	case west:{"cop"};
	case civilian: {"civ"};
	case independent: {"med"};
	default {"Error"};
};

if(_side == "Error") exitWith {
	[[]] remoteExecCall ["life_fnc_impoundMenu",_unit];
};

_query = format["SELECT id, side, classname, type, pid, alive, active, plate, color FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND side='%2' AND type='%3'",_pid,_side,_type];

_tickTime = diag_tickTime;
_queryResult = [_query,2,true] call HC_fnc_asyncCall;

if(typeName _queryResult == "STRING") exitWith {
	[[]] remoteExecCall ["life_fnc_impoundMenu",_unit];
};

[_queryResult] remoteExecCall ["life_fnc_impoundMenu",_unit];
