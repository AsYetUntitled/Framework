#include "..\..\script_macros.hpp"
/*
    File: fn_chopShopMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens & initializes the chop shop menu.
*/
if (life_action_inUse) exitWith {hint localize "STR_NOTF_ActionInProc"};
if !(playerSide isEqualTo civilian) exitWith {hint localize "STR_NOTF_notAllowed"};
disableSerialization;
private _chopable = LIFE_SETTINGS(getArray,"chopShop_vehicles");
private _nearVehicles = nearestObjects [getMarkerPos (_this select 3),_chopable,25];
private _nearUnits = (nearestObjects[player,["Man"],5]) arrayIntersect playableUnits;
if (count _nearUnits > 1) exitWith {hint localize "STR_NOTF_PlayerNear"};

life_chopShop = param[3,objNull[objNull]];
//Error check
if (count _nearVehicles isEqualTo 0) exitWith {titleText[localize "STR_Shop_NoVehNear","PLAIN"];};
if !(createDialog "Chop_Shop") exitWith {hint localize "STR_Shop_ChopShopError"};

private _control = CONTROL(39400,39402);
{
    if (alive _x) then {
        private _className = typeOf _x;
        private _classNameLife = _className;
        private _displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
        private _picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");

        if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _classNameLife)) then {
            _classNameLife = "Default"; //Use Default class if it doesn't exist
            diag_log format ["%1: LifeCfgVehicles class doesn't exist",_className];
        };

        private _price = M_CONFIG(getNumber,"LifeCfgVehicles",_classNameLife,"price");
        private _chopMultiplier = LIFE_SETTINGS(getNumber,"vehicle_chopShop_multiplier");

        _price = _price * _chopMultiplier;
        if (!isNil "_price" && count crew _x isEqualTo 0) then {
            _control lbAdd _displayName;
            _control lbSetData [(lbSize _control)-1,str(_forEachIndex)];
            _control lbSetPicture [(lbSize _control)-1,_picture];
            _control lbSetValue [(lbSize _control)-1,_price];
        };
    };
} forEach _nearVehicles;
