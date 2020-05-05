#include "..\..\script_macros.hpp"
/*
    File: fn_vehicleWeightCfg.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master configuration for vehicle weight.
*/

params [
    ["_className", "", [""]]
];

if !(isClass (missionConfigFile >> "LifeCfgVehicles" >> _className)) then {
    diag_log format ["%1: LifeCfgVehicles class doesn't exist", _className];
    _className = "Default"; //Use Default
};

private _weight = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"vItemSpace");

if (isNil "_weight") then {
    _weight = -1;
};

_weight;
