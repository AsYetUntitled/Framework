#include "..\..\script_macros.hpp"
/*
    File: fn_vehicleGarage.sqf
    Author: Bryan "Tonic" Boardwine
    Updated to Housing/Garage Configs - BoGuu

    Description:
    Vehicle Garage, why did I spawn this in an action its self?
*/
params [
    ["_garageObj",objNull,[objNull]],
    ["_type","",[""]]
];

private _houseConfig = missionConfigFile >> "Housing" >> worldName >> _garageObj;
private _garageConfig = missionConfigFile >> "Garages" >> worldName >> _garageObj;

_isHouse = switch (true) do {
    case (isClass (_houseConfig)) : {true};
    case (isClass (_garageConfig)) : {false};
    default {nil};
};

if (isNil "_isHouse") exitWith {};

private _config = [_garageConfig,_houseConfig] select _isHouse;
private _dir = getNumber(_config >> "garageSpawnDir");
private _mTwPos = getArray(_config >> "garageSpawnPos");

life_garage_sp = [(_garageObj modelToWorld _mTwPos),((getDir _garageObj) + _dir)];
life_garage_type = _type;

if (life_HC_isActive) then {
    [getPlayerUID player,playerSide,_type,player] remoteExec ["HC_fnc_getVehicles",HC_Life];
} else {
    [getPlayerUID player,playerSide,_type,player] remoteExec ["TON_fnc_getVehicles",RSERV];
};

createDialog "Life_impound_menu";
disableSerialization;
ctrlSetText[2802,(localize "STR_ANOTF_QueryGarage")];
