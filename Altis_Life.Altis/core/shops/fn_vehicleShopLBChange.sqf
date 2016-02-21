#include "..\..\script_macros.hpp"
/*
	File: fn_vehicleShopLBChange.sqf
	Author: Bryan "Tonic" Boardwine
	Modified : NiiRoZz

	Description:
	Called when a new selection is made in the list box and
	displays various bits of information about the vehicle.
*/
disableSerialization;
private["_control","_index","_className","_classNameLife","_basePrice","_vehicleInfo","_colorArray","_ctrl","_trunkSpace","_maxspeed","_horsepower","_passengerseats","_fuel","_armor","_multiplicator"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_className = _control lbData _index;
_classNameLife = _className;
_vIndex = _control lbValue _index;

_basePrice = switch(playerSide) do {
	case civilian: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"rentalprice"),0)};
	case west: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"rentalprice"),1)};
	case independent: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"rentalprice"),2)};
	case east: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"rentalprice"),3)};
};

_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;
_maxspeed = _vehicleInfo select 8;
_horsepower = _vehicleInfo select 11;
_passengerseats = _vehicleInfo select 10;
_fuel = _vehicleInfo select 12;
_armor = _vehicleInfo select 9;
[_className] call life_fnc_vehicleShop3DPreview;
_multiplicator = LIFE_SETTINGS(getNumber,"vehicleShop_BuyMultiplicator");

ctrlShow [2330,true];
(CONTROL(2300,2303)) ctrlSetStructuredText parseText format[
(localize "STR_Shop_Veh_UI_Rental")+ " <t color='#8cff9b'>$%1</t><br/>" +
(localize "STR_Shop_Veh_UI_Ownership")+ " <t color='#8cff9b'>$%2</t><br/>" +
(localize "STR_Shop_Veh_UI_MaxSpeed")+ " %3 km/h<br/>" +
(localize "STR_Shop_Veh_UI_HPower")+ " %4<br/>" +
(localize "STR_Shop_Veh_UI_PSeats")+ " %5<br/>" +
(localize "STR_Shop_Veh_UI_Trunk")+ " %6<br/>" +
(localize "STR_Shop_Veh_UI_Fuel")+ " %7<br/>" +
(localize "STR_Shop_Veh_UI_Armor")+ " %8",
[_basePrice] call life_fnc_numberText,
[round(_basePrice * _multiplicator)] call life_fnc_numberText,
_maxspeed,
_horsepower,
_passengerseats,
if(_trunkSpace == -1) then {"None"} else {_trunkSpace},
_fuel,
_armor
];

_ctrl = CONTROL(2300,2304);
lbClear _ctrl;

if(!isClass (missionConfigFile >> CONFIG_LIFE_VEHICLES >> _classNameLife)) then {
	_classNameLife = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: LifeCfgVehicles class doesn't exist",_className];
};
_colorArray = M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"textures");

{
	_flag = SEL(_x,1);
	_textureName = SEL(_x,0);
	if(EQUAL(SEL(life_veh_shop,2),_flag)) then {
		_ctrl lbAdd _textureName;
		_ctrl lbSetValue [(lbSize _ctrl)-1,_forEachIndex];
	};
} foreach _colorArray;

_numberindexcolor = 0;
_numberindexcolorarray = [];
for "_i" from 0 to (count(_colorArray) - 1) do {
	_numberindexcolorarray pushback _numberindexcolor;
	_numberindexcolor = _numberindexcolor + 1;
};
_indexrandom = _numberindexcolorarray call BIS_fnc_selectRandom;
_ctrl lbSetCurSel _indexrandom;

if(_className in (LIFE_SETTINGS(getArray,"vehicleShop_rentalOnly"))) then {
	ctrlEnable [2309,false];
} else {
	if(!(life_veh_shop select 3)) then {
		ctrlEnable [2309,true];
	};
};

if((lbSize _ctrl)-1 != -1) then {
	ctrlShow[2304,true];
} else {
	ctrlShow[2304,false];
};
true;
