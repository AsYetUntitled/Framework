/*
    File: fn_nearUnits.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Checks for units near (human units)

    Returns:
    true - Units are near
    false - No units near
*/
private ["_faction","_position","_radius","_ret"];
_faction = [_this,0,sideUnknown,[sideUnknown]] call BIS_fnc_param;
_position = [_this,1,(getPos player),[[]]] call BIS_fnc_param;
_radius = [_this,2,30,[0]] call BIS_fnc_param;
_ret = false;

//Error check
if (_faction isEqualTo sideUnknown) exitWith {_ret};

_ret = {!(_x isEqualTo player) && side _x isEqualTo _faction && alive _x && _position distance _x < _radius} count playableUnits > 0;
_ret;