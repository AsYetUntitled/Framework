/*
	File: fn_simDisable.sqf
*/
private["_obj","_bool"];
_obj = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_bool = [_this,1,false,[false]] call BIS_fnc_param;
if(isNull _obj) exitWith {};

_obj enableSimulation _bool;