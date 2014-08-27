#include <macro.h>
/*
	File: fn_impoundMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Not actually a impound menu, may act as confusion to some but that is what I wanted.
	The purpose of this menu is it is now called a 'Garage' where vehicles are stored (persistent ones).
*/
private["_vehicles","_control"];
disableSerialization;
_vehicles = [_this,0,[],[[]]] call BIS_fnc_param;

ctrlShow[2803,false];
ctrlShow[2830,false];
waitUntil {!isNull (findDisplay 2800)};

if(count _vehicles == 0) exitWith
{
	ctrlSetText[2811,localize "STR_Garage_NoVehicles"];
};

_control = ((findDisplay 2800) displayCtrl 2802);
lbClear _control;


{
	_vehicleInfo = [_x select 2] call life_fnc_fetchVehInfo;
	_control lbAdd (_vehicleInfo select 3);
	_tmp = [_x select 2,_x select 8];
	_tmp = str(_tmp);
	_control lbSetData [(lbSize _control)-1,_tmp];
	_control lbSetPicture [(lbSize _control)-1,_vehicleInfo select 2];
	_control lbSetValue [(lbSize _control)-1,_x select 0];
} foreach _vehicles;

ctrlShow[2810,false];
ctrlShow[2811,false];
/*
{
	_displayName = getText(configFile >> "CfgVehicles" >> (_x select 2) >> "displayName");
	_picture = getText(configFile >> "CfgVehicles" >> (_x select 2) >> "picture");
	_price = [_x select 2,__GETC__(life_garage_prices)] call TON_fnc_index;
	_sPrice = [_x select 2,__GETC__(life_garage_sell)] call TON_fnc_index;
	if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_prices) select _price) select 1;};
	if(_sPrice == -1) then {_sPrice = 1500;} else {_sPrice = (__GETC__(life_garage_sell) select _sPrice) select 1;};
	
	_control lbAdd format["%1 - %4 Fee: $%2 || %5: $%3", _displayName,[_price] call life_fnc_numberText,[_sPrice] call life_fnc_numberText,localize "STR_Garage_SFee",localize "STR_Garage_SellPrice"];
	_control lbSetData [(lbSize _control)-1,(_x select 2)];
	_control lbSetValue [(lbSize _control)-1,(call compile format["%1", _x select 0])];
	_control lbSetPicture [(lbSize _control)-1,_picture];
} foreach _vehicles;
*/