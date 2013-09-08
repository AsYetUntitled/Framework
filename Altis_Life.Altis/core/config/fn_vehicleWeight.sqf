/*
	File: fn_calVehWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Base configuration for vehicle weight
*/
private["_vehicle","_weight","_used"];
_vehicle = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};

_weight = -1;
_used = (_vehicle getVariable "Trunk") select 1;

switch ((typeOf _vehicle)) do
{
	case "C_Offroad_01_F": {_weight = 70;};
	case "B_Quadbike_01_F": {_weight = 25;};
	case "I_Truck_02_covered_F": {_weight = 175;};
	case "I_Truck_02_transport_F": {_weight = 150;};
	case "C_Hatchback_01_F": {_weight = 40;};
	case "C_Hatchback_01_sport_F": {_weight = 45;};
	case "C_SUV_01_F": {_weight = 50;};
	case "C_Van_01_transport_F": {_weight = 80;};
	case "I_G_Van_01_transport_F": {_weight = 80;};
	case "C_Van_01_box_F": {_weight = 95;};
	case "C_Boat_Civil_01_F": {_weight = 65;};
	case "C_Boat_Civil_01_police_F": {_weight = 65;};
	case "C_Boat_Civil_01_rescue_F": {_weight = 65;};
};

if(isNil "_used") then {_used = 0};
[_weight,_used];