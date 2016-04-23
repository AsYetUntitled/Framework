#include "..\..\script_macros.hpp"
/*
	File: fn_garageRefund.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	I don't know?
*/
_price = SEL(_this,0);
_unit = SEL(_this,1);
if(_unit != player) exitWith {};
ADD(BANK,_price);