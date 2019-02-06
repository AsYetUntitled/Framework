/*
    File: fn_copLights.sqf
    Author: mindstorm, modified by Adanteh
    Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow
    
    Description:
    Adds the light effect to cop vehicles, specifically the offroad.
*/

params [
    ["_vehicle", objNull, [objNull]],
    ["_lightTime", 0.22, [0]]
];

if (isNil "_vehicle" || {isNull _vehicle || {!(_vehicle getVariable "lights")}}) exitWith {};
private _lightRed = [20, 0.1, 0.1];
private _lightBlue = [0.1, 0.1, 20];

private _lightLeft = "#lightpoint" createVehicleLocal getPos _vehicle;
sleep 0.2;
_lightLeft setLightColor _lightRed;
_lightLeft setLightBrightness 0.2;
_lightLeft setLightAmbient [0.1,0.1,1];

private _offset = switch (typeOf _vehicle) do {
    case "C_Offroad_01_F": {
        [-0.37, 0.0, 0.56];
    };
    case "B_MRAP_01_F": {
        [-0.37, -1.9, 0.7];
    };
    case "C_SUV_01_F": {
        [-0.37,-1.2,0.42];
    };
    case "C_Hatchback_01_sport_F": {
        [-0.35,-0.2,0.25];
    };
    case "B_Heli_Light_01_F": {
        [-0.37, 0.0, -0.80];
    };
    case "B_Heli_Transport_01_F": {
        [-0.5, 0.0, 0.81];
    };
};

_lightLeft lightAttachObject [_vehicle, _offset];

_lightLeft setLightAttenuation [0.181, 0, 1000, 130];
_lightLeft setLightIntensity 10;
_lightLeft setLightFlareSize 0.38;
_lightLeft setLightFlareMaxDistance 150;
_lightLeft setLightUseFlare true;

private _lightRight = "#lightpoint" createVehicleLocal getPos _vehicle;
sleep 0.2;
_lightRight setLightColor _lightBlue;
_lightRight setLightBrightness 0.2;
_lightRight setLightAmbient [0.1,0.1,1];

_offset = switch (typeOf _vehicle) do {
    case "C_Offroad_01_F": {
        [0.37, 0.0, 0.56];
    };
    case "B_MRAP_01_F": {
        [0.37, -1.9, 0.7];
    };
    case "C_SUV_01_F": {
        [0.37,-1.2,0.42];
    };
    case "C_Hatchback_01_sport_F": {
        [0.35,-0.2,0.25];
    };
    case "B_Heli_Light_01_F": {
        [0.37, 0.0, -0.80];
    };
    case "B_Heli_Transport_01_F": {
        [0.5, 0.0, 0.81];
    };
};

_lightRight lightAttachObject [_vehicle, _offset];

_lightRight setLightAttenuation [0.181, 0, 1000, 130];
_lightRight setLightIntensity 10;
_lightRight setLightFlareSize 0.38;
_lightRight setLightFlareMaxDistance 150;
_lightRight setLightUseFlare true;

_lightLeft setLightDayLight true;
_lightRight setLightDayLight true;

private _leftRed = true;
while {alive _vehicle} do {  
    if !(_vehicle getVariable "lights") exitWith {};
    if (_leftRed) then {
        _lightRight setLightBrightness 0.0;
        sleep 0.05;
        _lightLeft setLightBrightness 6;
    } else {
        _lightLeft setLightBrightness 0.0;
        sleep 0.05;
        _lightRight setLightBrightness 6;
    };
    _leftRed = !_leftRed;
    sleep _lightTime;  
};

deleteVehicle _lightLeft;
deleteVehicle _lightRight;
