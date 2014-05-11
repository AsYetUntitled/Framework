#include <macro.h>
/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells a vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2801 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2801,(lbCurSel 2801)];
_vid = lbValue[2801,(lbCurSel 2801)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint "The selection had a error..."};

_price = [_vehicle,__GETC__(life_garage_sell)] call fnc_index;
if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_sell) select _price) select 1;};

[[_vid,_pid,_price,player,life_garage_type],"TON_fnc_vehicleDelete",false,false] spawn life_fnc_MP;

closeDialog 0;