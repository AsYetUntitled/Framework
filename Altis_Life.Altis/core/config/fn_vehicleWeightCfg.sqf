#include "..\..\script_macros.hpp"
/*
    File: fn_vehicleWeightCfg.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master configuration for vehicle weight.
*/
private["_className","_classNameLife","_weight"];
_className = [_this,0,"",[""]] call BIS_fnc_param;
_classNameLife = _className;
if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _classNameLife)) then {
    _classNameLife = "Default"; //Use Default class if it doesn't exist
    diag_log format["%1: LifeCfgVehicles class doesn't exist",_className];
};
_weight = M_CONFIG(getNumber,"LifeCfgVehicles",_classNameLife,"vItemSpace");

if (isNil "_weight") then {_weight = -1;};
_weight;