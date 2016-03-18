#include "\life_hc\hc_macros.hpp"
/*
	File: fn_jailSys.sqf
	Author: Bryan "Tonic" Boardwine
	
	This file is for Nanou's HeadlessClient.
	
	Description:
	I forget?
*/
private["_unit","_bad","_ret"];
params [
    ["_unit",Objnull,[Objnull]],
    ["_bad",false,[false]],
    ["_time",0,[0]]
];
if(isNull _unit) exitWith {};

_ret = [_unit] call HC_fnc_wantedPerson;
[_ret,_bad,_time] remoteExec ["life_fnc_jailMe",_unit];