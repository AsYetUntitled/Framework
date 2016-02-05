#include "..\..\script_macros.hpp"
/*
	File: fn_weaponShopMags.sqf
	Author: Daniel Stuart

	Description:
	Set Weapon Shop in magazine mode
*/
if((GVAR_UINS ["Weapon_Magazine",0]) == 1) then {
	uiNamespace setVariable ["Weapon_Magazine",0];
} else {
	uiNamespace setVariable ["Weapon_Magazine",1];
};
