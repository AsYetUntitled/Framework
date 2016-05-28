#include "..\..\script_macros.hpp"
/*
    File: fn_weaponShopMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Something
*/
private["_shopSide","_shopSide","_license","_itemInfo","_itemList","_license","_flag","_exit","_level","_levelAssert","_levelName","_levelType","_levelValue","_levelMsg"];
_exit = false;
_shopTitle = M_CONFIG(getText,"WeaponShops",(_this select 3),"name");
_shopSide = M_CONFIG(getText,"WeaponShops",(_this select 3),"side");
_license = M_CONFIG(getText,"WeaponShops",(_this select 3),"license");
_levelAssert = M_CONFIG(getArray,"WeaponShops",(_this select 3),"level");
_levelName = (_levelAssert select 0);
_levelType = (_levelAssert select 1);
_levelValue = (_levelAssert select 2);
_levelMsg = (_levelAssert select 3);

if (!(_shopSide isEqualTo "")) then {
    _flag = switch (playerSide) do {case west: {"cop"}; case independent: {"med"}; default {"civ"};};
    if (!(_flag isEqualTo _shopSide)) then {_exit = true;};
};
if (_exit) exitWith {};

if (!(_license isEqualTo "")) then {
    _flag = M_CONFIG(getText,"Licenses",_license,"side");
    if (!(LICENSE_VALUE(_license,_flag))) exitWith {hint localize "STR_Shop_Veh_NoLicense"; _exit = true;};
};
if (_exit) exitWith {};

if (!(_levelValue isEqualTo -1)) then {
    _level = missionNamespace getVariable _levelName;
    if (_level isEqualType {}) then {_level = FETCH_CONST(_level);};

    _flag = switch (_levelType) do {
        case "SCALAR": {_level >= _levelValue};
        case "BOOL": {_level};
        case "EQUAL": {_level isEqualTo _levelValue};
        default {false};
    };
    if (!(_flag)) then {
        _exit = true;
        if (_levelMsg isEqualTo "") then {
            _levelMsg = (localize "STR_Shop_Veh_NotAllowed");
        } else {
            if (isLocalized _levelMsg) then {
                _levelMsg = (localize _levelMsg);
            };
        };
    };
};
if (_exit) exitWith {hint _levelMsg;};

uiNamespace setVariable ["Weapon_Shop",(_this select 3)];
uiNamespace setVariable["Weapon_Magazine",0];
uiNamespace setVariable["Weapon_Accessories",0];
uiNamespace setVariable["Magazine_Array",[]];
uiNamespace setVariable["Accessories_Array",[]];

if (!(createDialog "life_weapon_shop")) exitWith {};
if (!isClass(missionConfigFile >> "WeaponShops" >> (_this select 3))) exitWith {}; //Bad config entry.

disableSerialization;

ctrlSetText[38401,_shopTitle];

_filters = ((findDisplay 38400) displayCtrl 38402);
lbClear _filters;

ctrlShow [38406,true];
ctrlEnable [38406,false];
ctrlShow [38407,true];
ctrlEnable [38407,false];

_filters lbAdd localize "STR_Shop_Weapon_ShopInv";
_filters lbAdd localize "STR_Shop_Weapon_YourInv";

_filters lbSetCurSel 0;
