#include "..\..\script_macros.hpp"
/*
    File: fn_restrainAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Restrains the target.
*/
private ["_unit", "_handcuff"];
params[
    ["_isRebel", false,[false]]
];
_unit = cursorObject;
_handcuff = missionNamespace getVariable "life_inv_handcuff";

if (isNull _unit) exitWith {}; //Not valid
if (player distance _unit > 3) exitWith {};
if (_unit getVariable "restrained") exitWith {};

if (!(_isRebel) && {side _unit isEqualTo west} ) exitWith {};
if ( (_isRebel) && {_handcuff isEqualTo 0} ) exitWith {};

if (player isEqualTo _unit) exitWith {};
if (!isPlayer _unit) exitWith {};

if ((_isRebel) && !([false,"handcuff",1] call life_fnc_handleInv)) exitWith {};
_unit setVariable ["restrained",true,true];
[player] remoteExec ["life_fnc_restrain",_unit];
if (_isRebel) exitWith {};
[0,"STR_NOTF_Restrained",true,[_unit getVariable ["realname", name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",west];
