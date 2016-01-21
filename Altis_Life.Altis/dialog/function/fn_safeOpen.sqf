#include "..\..\script_macros.hpp"
/*
	File: fn_safeOpen.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens the safe inventory menu.
*/
if(dialog) exitWith {}; //A dialog is already open.
life_safeObj = param [0,ObjNull,[ObjNull]];
if(isNull life_safeObj) exitWith {};
if(playerSide != civilian) exitWith {};
if((life_safeObj GVAR ["safe",-1]) < 1) exitWith {hint localize "STR_Civ_VaultEmpty";};
if((life_safeObj GVAR ["inUse",false])) exitWith {hint localize "STR_Civ_VaultInUse"};
if({side _x == west} count playableUnits < (LIFE_SETTINGS(getNumber,"cops_online_min"))) exitWith {
	hint format [localize "STR_Civ_NotEnoughCops",(LIFE_SETTINGS(getNumber,"cops_online_min"))]
};
if(!createDialog "Federal_Safe") exitWith {localize "STR_MISC_DialogError"};

disableSerialization;
ctrlSetText[3501,(localize "STR_Civ_SafeInv")];
[life_safeObj] call life_fnc_safeInventory;
life_safeObj SVAR ["inUse",true,true];
[life_safeObj] spawn {
	waitUntil {isNull (findDisplay 3500)};
	SEL(_this,0) SVAR ["inUse",false,true];
};
