/*
	File: fn_jumpFnc.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Makes the target jump.
*/
private["_unit","_vel","_dir","_v1","_v2","_anim"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_run = [_this,1,true,[false]] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //Bad data
if(local _unit && !_run) exitWith {}; //Ahh

if(animationState _unit == "AovrPercMrunSrasWrflDf") exitWith {};
_velocity = velocity _unit;

if(local _unit) then {
	_v1 = 3.82;
	_v2 = .4;
	_dir = direction player;
	_vel = velocity _unit;
	_unit setVelocity[(_vel select 0)+(sin _dir*_v2),(_vel select 1)+(cos _dir*_v2),(_vel select 2)+_v1];
};

_anim = animationState _unit;
_unit switchMove "AovrPercMrunSrasWrflDf";
if(local _unit) then {
	waitUntil{animationState _unit != "AovrPercMrunSrasWrflDf"};
	_unit switchMove _anim;
};