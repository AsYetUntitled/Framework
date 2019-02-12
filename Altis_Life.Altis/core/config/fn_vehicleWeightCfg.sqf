#include "..\..\script_macros.hpp"
/*
    File: fn_vehicleWeightCfg.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master configuration for vehicle weight.
*/
params [
    ["_className","",[""]];
];
private _classNameLife = _className;
if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _classNameLife)) then {
    _classNameLife = "Default"; //Use Default class if it doesn't exist
    diag_log format ["%1: LifeCfgVehicles class doesn't exist",_className];
};
private _weight = M_CONFIG(getNumber,"LifeCfgVehicles",_classNameLife,"vItemSpace");

if (isNil "_weight") then {_weight = -1;};
_weight;