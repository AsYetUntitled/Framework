#include "..\..\script_macros.hpp"
/*
	File: fn_weaponShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Something
*/
private["_shopSide","_shopSide","_license","_itemInfo","_itemList","_license","_flag","_exit","_level","_message","_exit2"];
_exit = false;
_exit2 = false;
_shopTitle = M_CONFIG(getText,"WeaponShops",(SEL(_this,3)),"name");
_shopSide = M_CONFIG(getText,"WeaponShops",(SEL(_this,3)),"side");
_license = M_CONFIG(getText,"WeaponShops",(SEL(_this,3)),"license");
_level = M_CONFIG(getNumber,"WeaponShops",(SEL(_this,3)),"level");
_message = M_CONFIG(getText,"WeaponShops",(SEL(_this,3)),"msg");

if(!(EQUAL(_license,""))) then {
	_flag = M_CONFIG(getText,"Licenses",_license,"side");
	if(!(LICENSE_VALUE(_license,_flag))) exitWith {hint localize "STR_Shop_Veh_NoLicense"; _exit = true;};
};
if(_exit) exitWith {};

_flag = switch(playerSide) do {case west: {"cop"}; case independent: {"med"}; default {"civ"};};
if(!(EQUAL(_flag,_shopSide))) exitWith {};
if(!(EQUAL(_level,-1))) then {
	_flag = switch(playerSide) do {case west: {(_level <= (FETCH_CONST(life_copLevel)))}; case independent: {(_level <= (FETCH_CONST(life_medicLevel)))}; default {true};};
	if(!_flag) then {_exit2 = true;};
};
if(_exit2) exitWith {hint _message;};

uiNamespace setVariable ["Weapon_Shop",SEL(_this,3)];

if(!(createDialog "life_weapon_shop")) exitWith {};
if(!isClass(missionConfigFile >> "WeaponShops" >> (SEL(_this,3)))) exitWith {}; //Bad config entry.

disableSerialization;

ctrlSetText[38401,_shopTitle];

_filters = ((findDisplay 38400) displayCtrl 38402);
lbClear _filters;

_filters lbAdd localize "STR_Shop_Weapon_ShopInv";
_filters lbAdd localize "STR_Shop_Weapon_YourInv";

_filters lbSetCurSel 0;