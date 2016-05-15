/*
    File: fn_hideObj.sqf

    Author: Daniel Stuart and NiiRoZz

    Description:
    Hides an object for all the players

    Usage :
    _id = The owner of player
    [_object] remoteExecCall ["life_fnc_hideObj",-_id];
*/
params [
    ["_object",objNull,[objNull]]
];
if (isNull _object) exitWith {};

_object hideObject true;
