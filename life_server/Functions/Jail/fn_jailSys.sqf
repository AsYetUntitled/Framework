#include "\life_server\script_macros.hpp"
/*
    File: fn_jailSys.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    I forget?
*/
params [
    ["_unit",objNull,[objNull]],
    ["_bad",false,[false]]
];
if (isNull _unit) exitWith {};
private _id = owner _unit;
private _ret = [_unit] call life_fnc_wantedPerson;
[_ret,_bad] remoteExec ["life_fnc_jailMe",_id];
