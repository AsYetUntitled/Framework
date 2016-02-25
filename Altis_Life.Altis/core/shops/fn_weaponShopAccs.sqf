#include "..\..\script_macros.hpp"
/*
	File: fn_weaponShopAccs.sqf
	Author: Daniel Stuart

	Description:
	Set Weapon Shop in accessories mode
*/
disableSerialization;

if((GVAR_UINS ["Weapon_Accessories",0]) == 0) then {
	private["_weapon","_slotArray","_weaponArray","_CowsSlot","_MuzzleSlot","_PointerSlot","_UnderBarrelSlot"];
	_weapon = lbData[38403,lbCurSel (38403)];
	_weaponArray = [];
	_slotArray = [];
	_CowsSlot = (configFile >> "CfgWeapons" >> _weapon >> WeaponSlotsInfo >> CowsSlot);
	_MuzzleSlot = (configFile >> "CfgWeapons" >> _weapon >> WeaponSlotsInfo >> MuzzleSlot);
	_PointerSlot = (configFile >> "CfgWeapons" >> _weapon >> WeaponSlotsInfo >> PointerSlot);
	_UnderBarrelSlot = (configFile >> "CfgWeapons" >> _weapon >> WeaponSlotsInfo >> UnderBarrelSlot);

	if(isClass _CowsSlot) then {
		if(isArray (_CowsSlot >> compatibleItems)) then {
			_slotArray = getArray(_CowsSlot >> compatibleItems);
			{
				_weaponArray pushBack _x;
			} forEach _slotArray;
		};
	};
	if(isClass _MuzzleSlot) then {
		if(isArray (_MuzzleSlot >> compatibleItems)) then {
			_slotArray = getArray(_MuzzleSlot >> compatibleItems);
			{
				_weaponArray pushBack _x;
			} forEach _slotArray;
		};
	};
	if(isClass _PointerSlot) then {
		if(isArray (_PointerSlot >> compatibleItems)) then {
			_slotArray = getArray(_PointerSlot >> compatibleItems);
			{
				_weaponArray pushBack _x;
			} forEach _slotArray;
		};
	};
	if(isClass _UnderBarrelSlot) then {
		if(isArray (_UnderBarrelSlot >> compatibleItems)) then {
			_slotArray = getArray(_UnderBarrelSlot >> compatibleItems);
			{
				_weaponArray pushBack _x;
			} forEach _slotArray;
		};
	};
	uiNamespace setVariable["Accessories_Array",_weaponArray];
	uiNamespace setVariable["Weapon_Accessories",1];
	uiNamespace setVariable["Weapon_Magazine",0];
} else {
	uiNamespace setVariable["Weapon_Accessories",0];
};
