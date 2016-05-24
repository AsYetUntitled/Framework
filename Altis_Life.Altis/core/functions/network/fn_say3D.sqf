/*
    File: fn_say3D.sqf
    Author: Bryan "Tonic" Boardwine

    Description: Pass your sounds that you want everyone nearby to hear through here.

    Example:   [_veh,"unlock"] remoteExec ["life_fnc_say3D",RANY];
*/
private["_object","_sound"];
_object = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_sound = [_this,1,"",[""]] call BIS_fnc_param;

if (isNull _object || _sound isEqualTo "") exitWith {};
_object say3D _sound;