/*
	File: fn_getVehicles.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends a request to query the database information and returns vehicles.
*/
private["_pid","_side","_type","_unit","_ret"];
_pid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[west]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_unit = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if(_pid == "" OR _side == sideUnknown OR _type == "" OR isNull _unit) exitWith
{
	if(!isNull _unit) then
	{
		[[[]],"life_fnc_impoundMenu",(owner _unit),false] spawn life_fnc_MP;
	};
};

_unit = owner _unit;
_side = switch(_side) do
{
	case west:{"cop"};
	case civilian: {"civ"};
	case independent: {"med"};
	default {"Error"};
};

if(_side == "Error") exitWith {
	[[[]],"life_fnc_impoundMenu",(owner _unit),false] spawn life_fnc_MP;
};

private["_handler","_queryResult","_thread"];
_handler = {
	private["_thread"];
	_thread = [_this select 0,true,_this select 1,false] spawn DB_fnc_asyncCall;
	waitUntil {scriptDone _thread};
};

_query = format["SELECT * FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND side='%2' AND type='%3'",_pid,_side,_type];

waitUntil{!DB_Async_Active};

while {true} do {
	_thread = [_query,_pid] spawn _handler;
	waitUntil {scriptDone _thread};
	sleep 0.2;
	_queryResult = missionNamespace getVariable format["QUERY_%1",_pid];
	if(!isNil "_queryResult") exitWith {};
};

missionNamespace setVariable[format["QUERY_%1",_pid],nil]; //Unset the variable.

if(typeName _queryResult == "STRING") exitWith {
	[[[]],"life_fnc_impoundMenu",(owner _unit),false] spawn life_fnc_MP;
};

[[_queryResult],"life_fnc_impoundMenu",_unit,false] spawn life_fnc_MP;