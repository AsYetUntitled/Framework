#include "..\..\script_macros.hpp"
/*
    File: fn_colorVehicle.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Reskins the vehicle.
*/
params [
    ["_vehicle",objNull,[objNull]],
    ["_colorName","",[""]]
];
if (!alive _vehicle || {_colorName isEqualTo ""}) exitWith {};

private _className = typeOf _vehicle;
if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _className)) then {
    diag_log format ["%1: LifeCfgVehicles class doesn't exist",_className];
    _className = "Default"; //Use Default class if it doesn't exist
};

private _textureArray = M_CONFIG(getArray,"LifeCfgVehicles",_className,"textures");
private _colorIndex = _textureArray findIf {_x select 0 == _colorName};
if (_colorIndex isEqualTo -1) then {
    _colorIndex = 0; //default to first available texture
};
private _textures = (_textureArray select _colorIndex) select 2;
if (_textures isEqualTo []) exitWith {};

if (local _vehicle) exitWith {
    {
        _vehicle setObjectTexture [_forEachIndex,_x]
    } forEach _textures;
};

_vehicle setVariable ["Life_veh_color",_index,true];

{
    _vehicle setObjectTextureGlobal [_forEachIndex,_x]
} forEach _textures;
