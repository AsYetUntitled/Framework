#include "..\..\script_macros.hpp"
/*
    File: fn_sellGarage.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sells a vehicle from the garage.
*/
private _control = CONTROL(2800,2802);
private _index = lbCurSel _control;
if (_index isEqualTo -1) exitWith {hint localize "STR_Global_NoSelection"};

private _dataArr = _control lbData _index;
(parseSimpleArray _dataArr) params ["_vid",["_className",""]];
if (_className isEqualTo "") exitWith {hint localize "STR_Garage_Selection_Error"};

if ((time - life_action_delay) < 1.5) exitWith {hint localize "STR_NOTF_ActionDelay";};
if !(isClass (missionConfigFile >> "LifeCfgVehicles" >> _className)) then {
    diag_log format ["%1: LifeCfgVehicles class doesn't exist",_className];
    _className = "Default"; //Use Default class if it doesn't exist
};

private "_multiplier";
private "_purchasePrice";
private _price = M_CONFIG(getNumber,"LifeCfgVehicles",_vehicleLife,"price");
switch (playerSide) do {
    case civilian: {
        _multiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_CIVILIAN");
        _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
    };
    case west: {
        _multiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_COP");
        _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_COP");
    };
    case independent: {
        _multiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_MEDIC");
        _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_MEDIC");
    };
    case east: {
        _multiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_OPFOR");
        _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_OPFOR");
    };
};

private _sellPrice = _purchasePrice * _multiplier;

if (!(_sellPrice isEqualType 0) || _sellPrice < 1) then {_sellPrice = 500;};

closeDialog 0;
private _action = [
    format[localize "STR_Garage_SellWarn", getText(configFile >> "CfgVehicles" >> _vehicle >> "displayName"), [_sellPrice] call life_fnc_numberText],
    localize "STR_Garage_SellWarnTitle",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if !(_action) exitWith {};

if (life_HC_isActive) then {
    [player,_vid] remoteExecCall ["HC_fnc_vehicleDelete",HC_Life];
} else {
    [player,_vid] remoteExecCall ["TON_fnc_vehicleDelete",RSERV];
};

hint format [localize "STR_Garage_SoldCar",[_sellPrice] call life_fnc_numberText];
BANK = BANK + _sellPrice;
[1] call SOCK_fnc_updatePartial;

if (LIFE_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        advanced_log = format [localize "STR_DL_AL_soldVehicle_BEF",_vehicleLife,[_sellPrice] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    } else {
        advanced_log = format [localize "STR_DL_AL_soldVehicle",profileName,(getPlayerUID player),_vehicleLife,[_sellPrice] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    };
    publicVariableServer "advanced_log";
};

life_action_delay = time;
closeDialog 0;