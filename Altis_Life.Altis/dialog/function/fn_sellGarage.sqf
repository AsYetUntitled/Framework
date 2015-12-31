#include "..\..\script_macros.hpp"
/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells a vehicle from the garage.
*/
private["_vehicle","_vehicleLife","_vid","_pid","_unit","_sellPrice"];
disableSerialization;
if(EQUAL(lbCurSel 2802,-1)) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vehicleLife = _vehicle;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = steamid;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if((time - life_action_delay) < 1.5) exitWith {hint localize "STR_NOTF_ActionDelay";};
if(!isClass (missionConfigFile >> CONFIG_LIFE_VEHICLES >> _vehicleLife)) then {
	_vehicleLife = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: LifeCfgVehicles class doesn't exist",_vehicle];
};

_sellPrice = switch(playerSide) do {
	case civilian: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicleLife,"garageSell"),0)};
	case west: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicleLife,"garageSell"),1)};
	case independent: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicleLife,"garageSell"),2)};
	case east: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicleLife,"garageSell"),3)};
};

if(!(EQUAL(typeName _sellPrice,typeName 0)) OR _sellPrice < 1) then {_sellPrice = 1000};
[_vid,_pid,_sellPrice,player,life_garage_type] remoteExecCall ["TON_fnc_vehicleDelete",RSERV];
hint format[localize "STR_Garage_SoldCar",[_sellPrice] call life_fnc_numberText];
ADD(BANK,_sellPrice);
life_action_delay = time;
closeDialog 0;