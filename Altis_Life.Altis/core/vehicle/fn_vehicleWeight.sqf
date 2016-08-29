/*
    File: fn_vehicleWeight.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Calculates Vehicle Weight.
*/
private ["_vehicle","_weight","_used"];
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (isNull _vehicle) exitWith {};

_weight = -1;
_used = (_vehicle getVariable "Trunk") select 1;
_weight = [(typeOf _vehicle)] call life_fnc_vehicleWeightCfg;

if (isNil "_used") then {_used = 0};
[_weight,_used];
