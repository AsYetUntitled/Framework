#include <macro.h>
/*
	File: fn_garageLBChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Displays various different bits of information when called.
*/
disableSerialization;
private["_control","_index","_className","_vehicleDBID","_trunkSpace","_vehicleInfo","_sellPrice","_retrievePrice","_dataArr","_vehicleColor"];
_control = _this select 0;
_index = _this select 1;

//fetch information
_dataArr = call compile format["%1",_control lbData _index]; 
_className = _dataArr select 0;
_vehicleColor = [_className,_dataArr select 1] call life_fnc_vehicleColorStr;
_vehicleDBID = _control lbValue _index;
_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;
_retrievePrice = [_className,__GETC__(life_garage_prices)] call fnc_index; if(_retrievePrice == -1) then {_retrievePrice = 1000;} else {_retrievePrice = (__GETC__(life_garage_prices) select _retrievePrice) select 1;};
_sellPrice = [_className,__GETC__(life_garage_sell)] call fnc_index; if(_sellPrice == -1) then {_sellPrice = 1500;} else {_sellPrice = (__GETC__(life_garage_sell) select _sellPrice) select 1;};

(getControl(2800,2803)) ctrlSetStructuredText parseText format["
	Storage Fee: <t color='#8cff9b'>$%1</t><br/>
	Sell Price: <t color='#8cff9b'>$%2</t><br/>
	Color: %8<br/>
	Max Speed: %3 km/h<br/>
	Horse Power: %4<br/>
	Passenger Seats: %5<br/>
	Trunk Capacity: %6<br/>
	Fuel Capacity: %7<br/>",
	[_retrievePrice] call life_fnc_numberText,
	[_sellPrice] call life_fnc_numberText,
	_vehicleInfo select 8,
	_vehicleInfo select 11,
	_vehicleInfo select 10,
	if(_trunkSpace == -1) then {"None"} else {_trunkSpace},
	_vehicleInfo select 12,
	_vehicleColor
];

ctrlShow [2830,true];
ctrlShow [2803,true];