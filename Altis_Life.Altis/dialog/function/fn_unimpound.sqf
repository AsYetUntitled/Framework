#include <macro.h>
/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Yeah... Gets the vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2801 == -1) exitWith {hint "You did not select a vehicle..."};
_vehicle = lbData[2801,(lbCurSel 2801)];
_vid = lbValue[2801,(lbCurSel 2801)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint "The selection had a error..."};

_price = [_vehicle,__GETC__(life_garage_prices)] call fnc_index;
if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_prices) select _price) select 1;};
if(life_atmcash < _price) exitWith {hint format["You don't have $%1 in your bank account!",[_price] call life_fnc_numberText];};

[[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price],"STS_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
hint "Spawning vehicle please wait...";

life_atmcash = life_atmcash - _price;