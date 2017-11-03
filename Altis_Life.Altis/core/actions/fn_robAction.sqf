#include "..\..\script_macros.hpp"
/*
    File: fn_robAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the robbing process?
*/
private _target = cursorObject;

if (isNull _target || {!isPlayer _target}) exitWith {};

if (_target getVariable ["robbed",false]) exitWith {};
[player] remoteExecCall ["life_fnc_robPerson",_target];
_target setVariable ["robbed",true,true];
