/*
    File: fn_say3D.sqf
    Author: Bryan "Tonic" Boardwine
    Modified by: blackfisch

    Description:
    Pass your sounds that you want everyone nearby to hear through here.

    Example:   [_veh,"unlock",50,1] remoteExec ["life_fnc_say3D",0];
*/
params [
    ["_object",objNull,[objNull]],
    ["_sound","",[""]],
    ["_distance",100,[0]],
    ["_pitch",1,[0]]
];

if (isNull _object || {_sound isEqualTo ""}) exitWith {};
if (_distance < 0) then {_distance = 100};
_object say3D [_sound,_distance,_pitch];
