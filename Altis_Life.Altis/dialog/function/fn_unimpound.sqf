#include "..\..\script_macros.hpp"
/*
    File: fn_unimpound.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Yeah... Gets the vehicle from the garage.
*/
private _control = CONTROL(2800,2802);
private _index = lbCurSel _control;
if (_index isEqualTo -1) exitWith {hint localize "STR_Global_NoSelection"};

private _dataArr = _control lbData _index;
private _color = _control lbValue _index;
_dataArr = call compile format ["%1",_dataArr];
_dataArr params ["_plate",["_className",""]];
if (_className isEqualTo "") exitWith {hint localize "STR_Garage_Selection_Error"};

if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _className)) then {
    diag_log format ["%1: LifeCfgVehicles class doesn't exist",_className];
    _className = "Default"; //Use Default class if it doesn't exist
};

private _price = M_CONFIG(getNumber,"LifeCfgVehicles",_vehicleLife,"price");
private _storageFee = LIFE_SETTINGS(getNumber,"vehicle_storage_fee_multiplier");

switch (playerSide) do {
    case civilian: {_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");};
    case west: {_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_COP");};
    case independent: {_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_MEDIC");};
    case east: {_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_OPFOR");};
};
_price = _purchasePrice * _storageFee;

if (!(_price isEqualType 0) || _price < 1) then {_price = 500;};
if (BANK < _price) exitWith {hint format [(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];};

private _spawnPoint = life_garage_sp;
if (_spawnPoint isEqualType []) then {
    {
        if ((nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) isEqualTo []) exitWith {_spawnPoint = _x}
    } forEach _spawnPoint;
};

if (life_HC_isActive) then {
    [player,_plate,_spawnPoint] remoteExecCall ["NC_fnc_spawnVehicle",HC_Life];
} else {
    [player,_plate,_spawnPoint] remoteExecCall ["TON_fnc_spawnVehicle",RSERV];
};

hint localize "STR_Garage_SpawningVeh";
BANK = BANK - _price;
[1] call SOCK_fnc_updatePartial;
closeDialog 0;
