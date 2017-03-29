/*
    File: fn_say3D.sqf
    Author: Bryan "Tonic" Boardwine

    Description: Pass your sounds that you want everyone nearby to hear through here.

    Example: [_veh,"unlock"] remoteExec ["life_fnc_say3D",RANY];
*/

params [
    ["_object", objNull, [objNull]],
    ["_sound", "", [""]]
];

if (isNull _object || {_sound isEqualTo ""}) exitWith {};
_object say3D _sound;