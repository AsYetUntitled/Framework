#include "\life_hc\hc_macros.hpp"
/*
    File: fn_jailSys.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    I forget?
*/
params [
    ["_unit",objNull,[objNull]],
    ["_bad",false,[false]]
];
if (isNull _unit) exitWith {};

private _ret = [_unit] call HC_fnc_wantedPerson;
[_ret,_bad] remoteExec ["life_fnc_jailMe",_unit];