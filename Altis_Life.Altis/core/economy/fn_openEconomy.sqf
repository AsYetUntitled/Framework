#include "..\..\script_macros.hpp"
/*
	File: fn_openEconomy.sqf
	Author: Derek
	
	Description:
	Opens the Market menu
*/
private["_display","_units","_type"];

disableSerialization;
createDialog "Market";
waitUntil {!isNull findDisplay 39000};
_display = findDisplay 39000;
_venteliste = _display displayCtrl 39002;
_achatliste = _display displayCtrl 39003;

lbClear _venteliste;
lbClear _achatliste;

[0, "economy"] spawn life_fnc_retrievePrices;