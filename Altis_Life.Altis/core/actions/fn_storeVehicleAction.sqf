#include "..\..\script_macros.hpp"
/*
	File: fn_storeVehicle.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Stores the vehicle in the garage.
*/
private["_nearVehicles","_vehicle"];
_mode = [_this,0,1,[0]] call BIS_fnc_param;
if(vehicle player != player) then {
	_vehicle = vehicle player;
} else {
	_nearVehicles = nearestObjects[getPosATL player,["Car","Air","Ship"],30]; //Fetch vehicles within 30m.
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

if(isNil "_vehicle") exitWith {};
if(isNull _vehicle) exitWith {};

switch (_mode) do {
	case 1: {
		_storetext = localize "STR_Garage_Store_Success";
		
		if(life_HC_isActive) then {
			[_vehicle,false,player,_storetext] remoteExec ["HC_fnc_vehicleStore",HC_Life];
		} else {
			[_vehicle,false,player,_storetext] remoteExec ["TON_fnc_vehicleStore",2];
		};

		hint localize "STR_Garage_Store_Server";
		life_garage_store = true;
	};

	case 2: {
		clearWeaponCargoGlobal _vehicle;
		clearMagazineCargoGlobal _vehicle;
		clearItemCargoGlobal _vehicle;
		clearBackpackCargoGlobal _vehicle;
		_vehicle SVAR ["Trunk",[[],0],true];
		_storetext = localize "STR_Garage_Store_Success";
		
		if(life_HC_isActive) then {
			[_vehicle,false,player,_storetext] remoteExec ["HC_fnc_vehicleStore",HC_Life];
		} else {
			[_vehicle,false,player,_storetext] remoteExec ["TON_fnc_vehicleStore",2];
		};
		
		hint localize "STR_Garage_Store_Server";
		life_garage_store = true;
	};
};
