#include "..\..\script_macros.hpp"
/*
	File: fn_storeVehicle.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Stores the vehicle in the garage.
*/
private["_nearVehicles","_vehicle"];
if(vehicle player != player) then {
	_vehicle = vehicle player;
} else {
	_nearVehicles = nearestObjects[getPos SEL(_this ,0),["Car","Air","Ship"],30]; //Fetch vehicles within 30m.
	if(count _nearVehicles > 0) then {
		{
			if(!isNil "_vehicle") exitWith {}; //Kill the loop.
			_vehData = _x GVAR ["vehicle_info_owners",[]];
			if(count _vehData  > 0) then {
				_vehOwner = SEL(SEL(_vehData,0),0);
				if((getPlayerUID player) == _vehOwner) exitWith {
					_vehicle = _x;
				};
			};
		} foreach _nearVehicles;
	};
};

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_NoNPC"};
if(isNull _vehicle) exitWith {};

if((EQUAL(LIFE_SETTINGS(getNumber,"save_veh_gear"),1)) OR (EQUAL(LIFE_SETTINGS(getNumber,"save_veh_virtualItems"),1))) then {
	_trunk1 = [];
	_trunk = _vehicle getVariable["Trunk",[[],0]];
	_trunk1 pushback (_trunk select 1);

	_vehItems = getItemCargo _vehicle;
	_vehMags = getMagazineCargo _vehicle;
	_vehWeapons = getWeaponCargo _vehicle;
	_vehBackpacks = getBackpackCargo _vehicle;
	_cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];

	if (((count ((_cargo select 0) select 0) > 0) OR (count ((_cargo select 1) select 0) > 0) OR (count ((_cargo select 2) select 0) > 0) OR (count ((_cargo select 3) select 0) > 0)) OR (_trunk1 select 0) > 0) then {
		createDialog "Life_impound_menu_action";
	} else {
		_storetext = localize "STR_Garage_Store_Success";
		
		if(life_HC_isActive) then {
			[_vehicle,false,(_this select 1),_storetext] remoteExec ["HC_fnc_vehicleStore",HC_Life];
		} else {
			[_vehicle,false,(_this select 1),_storetext] remoteExec ["TON_fnc_vehicleStore",2];
		};
		
		hint localize "STR_Garage_Store_Server";
		life_garage_store = true;
	};
} else {
	_storetext = localize "STR_Garage_Store_Success";
	
	if(life_HC_isActive) then {
		[_vehicle,false,(_this select 1),_storetext] remoteExec ["HC_fnc_vehicleStore",HC_Life];
	} else {
		[_vehicle,false,(_this select 1),_storetext] remoteExec ["TON_fnc_vehicleStore",2];
	};
	
	hint localize "STR_Garage_Store_Server";
	life_garage_store = true;
};
