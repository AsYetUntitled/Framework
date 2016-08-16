/*
    File: fn_lightHouse.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Tells clients to either turn the lights on for that house
    or off.
*/
private ["_lightSource","_exit"];
params [
    ["_house",objNull,[objNull]],
    ["_mode",false,[false]]
];


if (isNull _house) exitWith {};
if (!(_house isKindOf "House_F")) exitWith {};

_exit = false;
if (_mode) then {
    _lightPos = (getArray (missionConfigFile >> "Housing" >> worldName >> (typeOf _house) >> "lightPos" ));
    if (_lightPos isEqualTo []) exitWith {};
    _lightSource = "#lightpoint" createVehicleLocal [0,0,0];
    _lightSource lightAttachObject [_house,_lightPos];
    _lightSource setLightColor [250,150,50];
    _lightSource setLightAmbient [1,1,0.2];
    _lightSource setLightAttenuation [1,0,0,0];
    _lightSource setLightIntensity 10;
    _lightSource setLightUseFlare true;
    _lightSource setLightFlareSize 0.2;
    _lightSource setLightFlareMaxDistance 50;
    _house setVariable ["lightSource",_lightSource];
} else {
    if (isNull (_house getVariable ["lightSource",objNull])) exitWith {};
    deleteVehicle (_house getVariable ["lightSource",objNull]);
};
