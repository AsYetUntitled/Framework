/*
	File: fn_netSetVar.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Set a variable on a client.
*/
disableSerialization;
private["_varName","_ns","_value"];
_varName = [_this,0,"",[""]] call BIS_fnc_param;
_value = [_this,1,-9999,[sideUnknown,"",[],{},false,0,ObjNull,GrpNull,displayNull]] call BIS_fnc_param;
_ns = [_this,2,missionNamespace,[missionNamespace]] call BIS_fnc_param;

if(_varName == "") exitWith {}; //Error checking
_ns setVariable[_varName,_value];