#include "..\..\script_macros.hpp"
/*
	File: fn_openEconomy.sqf
	Author: Derek
	
	Description:
	Opens the Market menu
*/
private["_display","_units","_type","_sellList","_buyList"];

disableSerialization;
createDialog "Market";
waitUntil {!isNull findDisplay 39000};
_display = findDisplay 39000;
_sellList = _display displayCtrl 39002;
_buyList = _display displayCtrl 39003;

lbClear _sellList;
lbClear _buyList;

[0, "economy"] spawn life_fnc_retrievePrices;