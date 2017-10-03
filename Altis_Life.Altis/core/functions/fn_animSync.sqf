/*
    File: fn_animSync.sqf
    Author:

    Description:

*/
params [
    ["_unit",objNull,[objNull]],
    ["_anim","",[""]],
    ["_cancelOwner",false,[false]]
];

if (isNull _unit || {(local _unit && _cancelOwner)}) exitWith {};
_unit switchMove _anim;