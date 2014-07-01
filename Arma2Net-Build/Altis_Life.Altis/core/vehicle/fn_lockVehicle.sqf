/*
	File: fn_lockVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Locks the vehicle (used through the network when the person calling it isn't local).
*/
private["_vehicle","_state"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_state = [_this,1,2,[0,false]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};

_vehicle lock _state;