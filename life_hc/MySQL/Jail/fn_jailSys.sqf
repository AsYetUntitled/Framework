#include "\life_hc\hc_macros.hpp"
/*
    File: fn_jailSys.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    I forget?
*/
private ["_unit","_bad","_ret"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (isNull _unit) exitWith {};
_bad = [_this,1,false,[false]] call BIS_fnc_param;

_ret = [_unit] call HC_fnc_wantedPerson;
[_ret,_bad] remoteExec ["life_fnc_jailMe",_unit];