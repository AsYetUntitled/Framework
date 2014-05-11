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

_ret = [_pid,_side,_type] call DB_fnc_queryVehicles;
if(isNil "_ret") then {_ret = [];};
systemChat "Returning info..";
[[_ret],"life_fnc_impoundMenu",_unit,false] spawn life_fnc_MP;