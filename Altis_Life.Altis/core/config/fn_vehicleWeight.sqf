/*
	File: fn_calVehWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Base configuration for vehicle weight
*/
private["_vehicle","_weight","_used"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};

_weight = -1;
_used = (_vehicle getVariable "Trunk") select 1;

switch ((typeOf _vehicle)) do
{
	case "C_Offroad_01_F": {_weight = 65;};
	case "B_G_Offroad_01_F": {_weight = 65;};
	case "B_Quadbike_01_F": {_weight = 25;};
	case "I_Truck_02_covered_F": {_weight = 250;};
	case "I_Truck_02_transport_F": {_weight = 200;};
	case "C_Hatchback_01_F": {_weight = 40;};
	case "C_Hatchback_01_sport_F": {_weight = 45;};
	case "C_SUV_01_F": {_weight = 50;};
	case "C_Van_01_transport_F": {_weight = 100;};
	case "I_G_Van_01_transport_F": {_weight = 100;};
	case "C_Van_01_box_F": {_weight = 150;};
	case "C_Boat_Civil_01_F": {_weight = 85;};
	case "C_Boat_Civil_01_police_F": {_weight = 85;};
	case "C_Boat_Civil_01_rescue_F": {_weight = 85;};
	case "B_Truck_01_box_F": {_weight = 450;};
	case "B_Truck_01_transport_F": {_weight = 325;};
	case "B_MRAP_01_F": {_weight = 65;};
	case "O_MRAP_02_F": {_weight = 60;};
	case "I_MRAP_03_F": {_weight = 58;};
	case "B_Heli_Light_01_F": {_weight = 90;};
	case "O_Heli_Light_02_unarmed_F": {_weight = 210;};
	case "I_Heli_Transport_02_F": {_weight = 375;};
	case "C_Rubberboat": {_weight = 45;};
	case "O_Boat_Armed_01_hmg_F": {_weight = 175;};
	case "B_Boat_Armed_01_minigun_F": {_weight = 175;};
	case "I_Boat_Armed_01_minigun_F": {_weight = 175;};
	case "B_G_Boat_Transport_01_F": {_weight = 45;};
	case "B_Boat_Transport_01_F": {_weight = 45;};
};

if(isNil "_used") then {_used = 0};
[_weight,_used];