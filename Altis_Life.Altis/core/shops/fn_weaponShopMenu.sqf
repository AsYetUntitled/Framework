#include "..\..\script_macros.hpp"
/*
    File: fn_weaponShopMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Something
*/
private ["_shopSide","_shopSide","_license","_itemInfo","_itemList","_license","_flag","_exit","_level","_levelAssert","_levelName","_levelType","_levelValue","_levelMsg"];
_exit = false;
_shopTitle = M_CONFIG(getText,"WeaponShops",(_this select 3),"name");
_shopSide = M_CONFIG(getText,"WeaponShops",(_this select 3),"side");
private _conditions = M_CONFIG(getText,"WeaponShops",(_this select 3),"conditions");


if (!(_shopSide isEqualTo "")) then {
    _flag = switch (playerSide) do {case west: {"cop"}; case independent: {"med"}; default {"civ"};};
    if (!(_flag isEqualTo _shopSide)) then {_exit = true;};
};
if (_exit) exitWith {};

_exit = [_conditions] call life_fnc_levelCheck;
if !(_exit) exitWith {hint localize "STR_Shop_Veh_NotAllowed";};

uiNamespace setVariable ["Weapon_Shop",(_this select 3)];
uiNamespace setVariable ["Weapon_Magazine",0];
uiNamespace setVariable ["Weapon_Accessories",0];
uiNamespace setVariable ["Magazine_Array",[]];
uiNamespace setVariable ["Accessories_Array",[]];

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
