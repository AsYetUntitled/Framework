/*
    File: fn_countVehicles.sqf
    Author: Dardo

    Description:
    Count vehicles of the player and check if they exceed the limit,return bool.
*/
#include "\life_hc\script_macros.hpp"

private ["_query","_vehiclesCount","_vehiclesLimit","_type","_cfgType","_bool","_side"];

_side = _this select 0;
_uid = _this select 1;
_type = _this select 2;
_mode = _this select 3;


switch (_side) do {
    case east : { _vehiclesLimit = LIFE_SETTINGS(getNumber,"garage_limit_OPFOR"); };
    case west : { _vehiclesLimit = LIFE_SETTINGS(getNumber,"garage_limit_COP"); };
    case civilian : { _vehiclesLimit = LIFE_SETTINGS(getNumber,"garage_limit_CIVILIAN"); };
    case independent : {_vehiclesLimit = LIFE_SETTINGS(getNumber,"garage_limit_MEDIC"); };
};

if (_vehiclesLimit isEqualTo 0) exitWith { true };
_query = format ["SELECT COUNT(*) FROM vehicles WHERE pid ='%1' AND alive='1' AND side='%2' AND type='%3'", _uid, _side, _type];
_vehiclesCount = [_query, 2] call HC_fnc_asyncCall select 0;

switch (_mode) do {
 case "compare" : {
_bool = _vehiclesCount < _vehiclesLimit;
};
 case "equal" : { _bool = _vehiclesCount <= _vehiclesLimit; };
 };

_bool;
