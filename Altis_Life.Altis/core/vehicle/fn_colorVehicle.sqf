#include "..\..\script_macros.hpp"
/*
    File: fn_colorVehicle.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: SimZor

    Description:
    Reskins the vehicle.
*/
//Get Parameters
params [
    ["_vehicle", objNull, [objNull]],
    ["_index", -1, [0]]
];

//Type of vehicle
private _className = typeOf _vehicle;

//Check
if (isNull _vehicle || {!alive _vehicle} || {_index isEqualTo -1}) exitWith {};

//Set Colour on Vehicle
_vehicle setVariable (if (local _vehicle) then {
    switch _className do {
        case "C_Offroad_01_F":          {["color", 3, true]};
        case "C_Hatchback_01_F":        {["color", 1, true]};
        case "C_Hatchback_01_sport_F":  {["color", 1, true]};
        case "C_SUV_01_F":              {["color", 1, true]};
        case "C_Van_01_box_F":          {["color", 1, true]};
        case "C_Van_01_transport_F":    {["color", 1, true]};
    };
});

//Check to see if vehicle exist in missionConfigFile, otherwise use normal ArmA Class
if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _className)) then {
    _className = "Default";
    diag_log format ["%1: LifeCfgVehicles class doesn't exist", _className];
};

//Get Textures Array
private _textures = (getArray (missionConfigFile >> "LifeCfgVehicles" >> _className >> "textures") select _index) select 2;

//No textures so let it set default one
if (isNil "_textures" || {count _textures isEqualTo 0}) exitWith {};

//Set colour in variable attached to vehicle
_vehicle setVariable ["Life_VEH_color", _index, true];

//Apply texture on vehicle
{_vehicle setObjectTextureGlobal [_forEachIndex, _x];} forEach _textures;
