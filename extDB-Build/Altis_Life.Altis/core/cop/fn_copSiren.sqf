#include <macro.h>
/*
	File: fn_copSiren.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the cop siren sound for other players
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};
if(isNil {_vehicle GVAR "siren"}) exitWith {};

while {true} do {
	if(!(_vehicle GVAR "siren")) exitWith {};
	if(EQUAL(count crew _vehicle,0)) then {_vehicle SVAR ["siren",false,true]};
	if(!alive _vehicle) exitWith {};
	if(isNull _vehicle) exitWith {};
	_vehicle say3D "SirenLong";
	sleep 4.7;
	if(!(_vehicle GVAR "siren")) exitWith {};
};