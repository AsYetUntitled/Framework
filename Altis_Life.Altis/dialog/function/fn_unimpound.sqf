#include "..\..\script_macros.hpp"
/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Yeah... Gets the vehicle from the garage.
*/
private["_vehicle","_vehicleLife","_vid","_pid","_unit","_price","_multiplicator"];
disableSerialization;
if(EQUAL(lbCurSel 2802,-1)) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vehicleLife = _vehicle;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = steamid;
_unit = player;
_spawntext = localize "STR_Garage_spawn_Success";
if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if(!isClass (missionConfigFile >> CONFIG_LIFE_VEHICLES >> _vehicleLife)) then {
	_vehicleLife = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: LifeCfgVehicles class doesn't exist",_vehicle];
};

_price = switch(playerSide) do {
	case civilian: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicleLife,"rentalprice"),0)};
	case west: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicleLife,"rentalprice"),1)};
	case independent: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicleLife,"rentalprice"),2)};
	case east: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicleLife,"rentalprice"),3)};
};
_multiplicator = LIFE_SETTINGS(getNumber,"vehicleGarage_StorFeeMultiplicator");
_price = _multiplicator * _price;

if(!(EQUAL(typeName _price,typeName 0)) OR _price < 1) then {_price = 1000};
if(BANK < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];};

if(EQUAL(typeName life_garage_sp,typeName [])) then {

	if(life_HC_isActive) then {
		[_vid,_pid,SEL(life_garage_sp,0),_unit,_price,SEL(life_garage_sp,1),_spawntext] remoteExec ["HC_fnc_spawnVehicle",HC_Life];
	} else {
		[_vid,_pid,SEL(life_garage_sp,0),_unit,_price,SEL(life_garage_sp,1),_spawntext] remoteExec ["TON_fnc_spawnVehicle",RSERV];
	};
	
} else {
	if(life_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3"]) then {
	
		if(life_HC_isActive) then {
			[_vid,_pid,life_garage_sp,_unit,_price,0,_spawntext] remoteExec ["HC_fnc_spawnVehicle",HC_Life];
		} else {
			[_vid,_pid,life_garage_sp,_unit,_price,_spawntext] remoteExec ["TON_fnc_spawnVehicle",RSERV];
		};
		
	} else {
	
		if(life_HC_isActive) then {
			[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,markerDir life_garage_sp,_spawntext] remoteExec ["HC_fnc_spawnVehicle",HC_Life];
		} else {
			[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,markerDir life_garage_sp,_spawntext] remoteExec ["TON_fnc_spawnVehicle",RSERV];
		};
	};
};

hint localize "STR_Garage_SpawningVeh";
SUB(BANK,_price);
closeDialog 0;
