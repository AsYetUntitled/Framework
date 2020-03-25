/*
    File: fn_medicLights.sqf
    Author: mindstorm, modified by Adanteh
    Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow

    Description:
    Adds the light effect to medic vehicles, specifically the offroad.
*/

params [
    ["_vehicle", objNull, [objNull]],
    ["_lightTime", 0.22, [0]]
];

if (isNil "_vehicle" || {isNull _vehicle || {!(_vehicle getVariable "lights")}}) exitWith {};
private _lightRed = [0.1, 0.1, 20];
private _lightBlue = [0.1, 0.1, 20];

private _lightLeft = "#lightpoint" createVehicleLocal getPos _vehicle;
sleep 0.2;
_lightLeft setLightColor _lightRed;
_lightLeft setLightBrightness 0.2;
_lightLeft setLightAmbient [0.1,0.1,1];


//Format: [[left position], [right position]]
(switch (typeOf _vehicle) do {
    case "C_Offroad_01_F": {
        [[-0.37, 0.0, 0.56], [0.37, 0.0, 0.56]];
    };
    default {
        [[-1], [-1]];
    };
}) params ["_leftOffset", "_rightOffset"];

if (_leftOffset isEqualTo [-1]) exitWith {
    diag_log format ["Vehicle emergency lights not set for: %1",_vehicle];
    hint localize "STR_NOTF_ELSNotSet";
};

_lightLeft lightAttachObject [_vehicle, _leftOffset];

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

_lightRight lightAttachObject [_vehicle, _rightOffset];

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
