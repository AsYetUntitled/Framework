#include "..\..\script_macros.hpp"
/*
    File: fn_vehicleShopLBChange.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : NiiRoZz

    Description:
    Called when a new selection is made in the list box and
    displays various bits of information about the vehicle.
*/
params [
    ["_control",controlNull,[controlNull]],
    ["_index",0,[0]]
];
disableSerialization;

private _className = _control lbData _index;
private _vIndex = _control lbValue _index;
private _initalPrice = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"price");

private "_buyMultiplier";
private "_rentMultiplier";
switch playerSide do {
    case civilian: {
        _buyMultiplier = LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
        _rentMultiplier = LIFE_SETTINGS(getNumber,"vehicle_rental_multiplier_CIVILIAN");
    };
    case west: {
        _buyMultiplier = LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_COP");
        _rentMultiplier = LIFE_SETTINGS(getNumber,"vehicle_rental_multiplier_COP");
    };
    case independent: {
        _buyMultiplier = LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_MEDIC");
        _rentMultiplier = LIFE_SETTINGS(getNumber,"vehicle_rental_multiplier_MEDIC");
    };
    case east: {
        _buyMultiplier = LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_OPFOR");
        _rentMultiplier = LIFE_SETTINGS(getNumber,"vehicle_rental_multiplier_OPFOR");
    };
};

private _vehicleInfo = [_className] call life_fnc_fetchVehInfo;
private _trunkSpace = [_className] call life_fnc_vehicleWeightCfg;
_vehicleInfo params ["","","","","","","","","_maxSpeed","_armor","_seats","_horsePower","_fuelCapacity"];

if (LIFE_SETTINGS(getNumber,"vehicleShop_3D") isEqualTo 1) then {
    [_className] call life_fnc_3dPreviewDisplay;
};

ctrlShow [2330,true];
(CONTROL(2300,2303)) ctrlSetStructuredText parseText format [
    (localize "STR_Shop_Veh_UI_Rental")+ " <t color='#8cff9b'>$%1</t><br/>" +
    (localize "STR_Shop_Veh_UI_Ownership")+ " <t color='#8cff9b'>$%2</t><br/>" +
    (localize "STR_Shop_Veh_UI_MaxSpeed")+ " %3 km/h<br/>" +
    (localize "STR_Shop_Veh_UI_HPower")+ " %4<br/>" +
    (localize "STR_Shop_Veh_UI_PSeats")+ " %5<br/>" +
    (localize "STR_Shop_Veh_UI_Trunk")+ " %6<br/>" +
    (localize "STR_Shop_Veh_UI_Fuel")+ " %7<br/>" +
    (localize "STR_Shop_Veh_UI_Armor")+ " %8",
    [round(_initalPrice * _rentMultiplier)] call life_fnc_numberText,
    [round(_initalPrice * _buyMultiplier)] call life_fnc_numberText,
    _maxSpeed,
    _horsePower,
    _seats,
    if (_trunkSpace isEqualTo -1) then {"None"} else {_trunkSpace},
    _fuelCapacity,
    _armor
];

private _ctrl = CONTROL(2300,2304);
lbClear _ctrl;

if !(isClass (missionConfigFile >> "LifeCfgVehicles" >> _className)) then {
    diag_log format ["%1: LifeCfgVehicles class doesn't exist",_className];
    _className = "Default"; //Use Default class if it doesn't exist
};

private _colorArray = M_CONFIG(getArray,"LifeCfgVehicles",_className,"textures");
{
    _x params ["_textureName","_flag"];
    if ((life_veh_shop select 2) isEqualTo _flag) then {
        private _toShow = [_x] call life_fnc_levelCheck;
        if (_toShow) then {
            _ctrl lbAdd _textureName;
        };
    };
} forEach _colorArray;

private _count = (count _colorArray) - 1;
_ctrl lbSetCurSel (round(random _count));

if (_className in (LIFE_SETTINGS(getArray,"vehicleShop_rentalOnly"))) then {
    ctrlEnable [2309,false];
} else {
    if !(life_veh_shop select 3) then {
        ctrlEnable [2309,true];
    };
};

if !((lbSize _ctrl)-1 isEqualTo -1) then {
    ctrlShow[2304,true];
} else {
    ctrlShow[2304,false];
};

true;
