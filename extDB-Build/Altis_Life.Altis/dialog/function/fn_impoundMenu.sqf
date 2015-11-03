#include "..\..\script_macros.hpp"
/*
	File: fn_impoundMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Not actually a impound menu, may act as confusion to some but that is what I wanted.
	The purpose of this menu is it is now called a 'Garage' where vehicles are stored (persistent ones).
*/
private["_vehicles","_control"];
disableSerialization;
_vehicles = param [0,[],[[]]];

ctrlShow[2803,false];
ctrlShow[2830,false];
waitUntil {!isNull (findDisplay 2800)};

if(EQUAL(count _vehicles,0)) exitWith {
	ctrlSetText[2811,localize "STR_Garage_NoVehicles"];
};

_control = CONTROL(2800,2802);
lbClear _control;

{
	_vehicleInfo = [SEL(_x,2)] call life_fnc_fetchVehInfo;
	_control lbAdd (SEL(_vehicleInfo,3));
	_tmp = [SEL(_x,2),SEL(_x,8)];
	_tmp = str(_tmp);
	_control lbSetData [(lbSize _control)-1,_tmp];
	_control lbSetPicture [(lbSize _control)-1,SEL(_vehicleInfo,2)];
	_control lbSetValue [(lbSize _control)-1,SEL(_x,0)];
} foreach _vehicles;

ctrlShow[2810,false];
ctrlShow[2811,false];