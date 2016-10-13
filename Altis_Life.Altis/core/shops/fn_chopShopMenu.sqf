#include "..\..\script_macros.hpp"
/*
    File: fn_chopShopMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens & initializes the chop shop menu.
*/
private ["_control","_price","_vehicleShop","_vehicleList","_className","_classNameLife","_displayName","_picture","","_vehicleIndex","_vehiclePrice","_nearVehicles","_chopMultiplier","_chopable","_nearUnits"];
if (life_action_inUse) exitWith {hint localize "STR_NOTF_ActionInProc"};
if (playerSide != civilian) exitWith {hint localize "STR_NOTF_notAllowed"};
disableSerialization;
_chopable = LIFE_SETTINGS(getArray,"chopShop_vehicles");
_nearVehicles = nearestObjects [getMarkerPos (_this select 3),_chopable,25];
_nearUnits = (nearestObjects[player,["Man"],5]) arrayIntersect playableUnits;
if (count _nearUnits > 1) exitWith {hint localize "STR_NOTF_PlayerNear"};

life_chopShop = _this select 3;
//Error check
if (count _nearVehicles isEqualTo 0) exitWith {titleText[localize "STR_Shop_NoVehNear","PLAIN"];};
if (!(createDialog "Chop_Shop")) exitWith {hint localize "STR_Shop_ChopShopError"};

_control = CONTROL(39400,39402);
{
    if (alive _x) then {
        _className = typeOf _x;
        _classNameLife = _className;
        _displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
        _picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");

        if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _classNameLife)) then {
            _classNameLife = "Default"; //Use Default class if it doesn't exist
            diag_log format ["%1: LifeCfgVehicles class doesn't exist",_className];
        };

        _price = M_CONFIG(getNumber,"LifeCfgVehicles",_classNameLife,"price");
        _chopMultiplier = LIFE_SETTINGS(getNumber,"vehicle_chopShop_multiplier");
        _vehicleShop = _x getVariable ["shop_info",""];
        if (!(_vehicleShop isEqualTo "")) then {
            if (isClass (missionConfigFile >> "CarShops" >> _vehicleShop)) then {
                _vehicleList = M_CONFIG(getArray,"CarShops",_vehicleShop,"vehicles");
                _vehicleIndex = [_className,_vehicleList] call TON_fnc_index;

                if (!(_vehicleIndex isEqualTo -1)) then {
                    _vehiclePrice = ((_vehicleList select _vehicleIndex) select 1) select 0;
                    if (!(_vehiclePrice isEqualTo -1)) then {
                        _price = _vehiclePrice;
                    };
                };
            };
        };

        _price = _price * _chopMultiplier;
        if (!isNil "_price" && count crew _x isEqualTo 0) then {
            _control lbAdd _displayName;
            _control lbSetData [(lbSize _control)-1,str(_forEachIndex)];
            _control lbSetPicture [(lbSize _control)-1,_picture];
            _control lbSetValue [(lbSize _control)-1,_price];
        };
    };
} forEach _nearVehicles;
