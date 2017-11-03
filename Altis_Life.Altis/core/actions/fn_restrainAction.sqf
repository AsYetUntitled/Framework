#include "..\..\script_macros.hpp"
/*
    File: fn_restrainAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Restrains the target.
*/
private _unit = cursorObject;
if (isNull _unit || {player distance _unit > 3} || {_unit getVariable "restrained"} || {player isEqualTo _unit} || {!isPlayer _unit}) exitWith {};

_unit setVariable ["playerSurrender",false,true];
_unit setVariable ["restrained",true,true];
[player] remoteExec ["life_fnc_restrain",_unit];
[0,"STR_NOTF_Restrained",true,[_unit getVariable ["realname", name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",west];
