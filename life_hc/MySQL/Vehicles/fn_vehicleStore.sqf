#include "\life_hc\hc_macros.hpp"
/*
	File: fn_vehicleStore.sqf
	Author: Bryan "Tonic" Boardwine

	This file is for Nanou's HeadlessClient.

	Description:
	Stores the vehicle in the 'Garage'
*/
private["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_sql","_unit","_trunk","_vehItems","_vehMags","_vehWeapons","_vehBackpacks","_cargo"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_impound = [_this,1,false,[true]] call BIS_fnc_param;
_unit = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
_storetext = _this select 3;
_resourceItems = ["oil_unprocessed","oil_processed","copper_unrefined","copper_refined","iron_unrefined","iron_refined","salt_unrefined","salt_refined","sand","glass","diamond_uncut","diamond_cut","rock","cement","heroin_unprocessed","heroin_processed","cannabis","marijuana","cocaine_unprocessed","cocaine_processed","turtle_raw"];

_ownerUnit = _unit getVariable "life_clientID";

if(isNull _vehicle OR isNull _unit) exitWith {life_impound_inuse = false; (_ownerUnit) publicVariableClient "life_impound_inuse";life_garage_store = false;(_ownerUnit) publicVariableClient "life_garage_store";}; //Bad data passed.

_vInfo = _vehicle getVariable["dbInfo",[]];

if(count _vInfo > 0) then {
	_plate = _vInfo select 1;
	_uid = _vInfo select 0;
};

//Save vehicle inventory
if(EQUAL(LIFE_SETTINGS(getNumber,"save_veh_virtualItems"),1)) then {
	_trunk = _vehicle getVariable["Trunk",[[],0]];
	_trunk2 = _trunk select 0;
	_trunk4 = _trunk select 1;
	{
		_itemName = _x select 0;
		if(_itemName in _resourceItems) then	{
			_val = ITEM_WEIGHT(_itemName);
			_ItemNumber = _x select 1;
			_setnumber = _val * _ItemNumber;
			_trunk4 = _trunk4 - _setnumber;
			_trunk2 set [_forEachIndex,666];
		};
	} forEach _trunk2;
	_trunk2 = _trunk2 - [666];
	_trunk set [0, _trunk2];
	_trunk set [1, _trunk4];
	_trunk = [_trunk] call HC_fnc_mresArray;
} else {
	_trunk = [[],0];
};

if(EQUAL(LIFE_SETTINGS(getNumber,"save_veh_gear"),1)) then {
	_vehItems = getItemCargo _vehicle;
	_vehMags = getMagazineCargo _vehicle;
	_vehWeapons = getWeaponCargo _vehicle;
	_vehBackpacks = getBackpackCargo _vehicle;
	_cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];
	_cargo = [_cargo] call HC_fnc_mresArray;
} else {
	_cargo = [];
};

if(_impound) then {
	if(count _vInfo == 0) then  {
		life_impound_inuse = false;
		(_ownerUnit) publicVariableClient "life_impound_inuse";
		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			deleteVehicle _vehicle;
		};
	} else {
		_query = format["UPDATE vehicles SET active='0', inventory='%3', gear='%4', fuel='%5' WHERE pid='%1' AND plate='%2'",_uid,_plate,_trunk,_cargo,fuel _vehicle];

		_thread = [_query,1] call HC_fnc_asyncCall;
		//waitUntil {scriptDone _thread};
		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			deleteVehicle _vehicle;
		};
		life_impound_inuse = false;
		(_ownerUnit) publicVariableClient "life_impound_inuse";
	};
} else {
	if(count _vInfo == 0) exitWith {
		[1,(localize "STR_Garage_Store_NotPersistent")] remoteExecCall ["life_fnc_broadcast",(_ownerUnit)];
		life_garage_store = false;
		(_ownerUnit) publicVariableClient "life_garage_store";
	};

	if(_uid != getPlayerUID _unit) exitWith {
		[1,(localize "STR_Garage_Store_NoOwnership")] remoteExecCall ["life_fnc_broadcast",(_ownerUnit)];
		life_garage_store = false;
		(_ownerUnit) publicVariableClient "life_garage_store";
	};

	_query = format["UPDATE vehicles SET inventory='%3', gear='%4', fuel='%5' WHERE pid='%1' AND plate='%2'",_uid,_plate,_trunk,_cargo,fuel _vehicle];

	_thread = [_query,1] call HC_fnc_asyncCall;
	//waitUntil {scriptDone _thread};
	if(!isNil "_vehicle" && {!isNull _vehicle}) then {
		deleteVehicle _vehicle;
	};
	life_garage_store = false;
	(_ownerUnit) publicVariableClient "life_garage_store";
	[1,_storetext] remoteExecCall ["life_fnc_broadcast",(_ownerUnit)];
	// System for suspend vehicle when have inventory
	_trunk3 = [];
	if(EQUAL(LIFE_SETTINGS(getNumber,"save_veh_virtualItems"),1)) then {
		_trunk = [_trunk] call HC_fnc_mresToArray;
		if(typeName _trunk == "STRING") then {_trunk = call compile format["%1", _trunk];};
		_trunk3 pushback (_trunk select 1);
	} else {
		_trunk = [[],0];
		_trunk3 pushback (_trunk select 1);
	};

	if(EQUAL(LIFE_SETTINGS(getNumber,"save_veh_gear"),1)) then {
		_cargo = [_cargo] call HC_fnc_mresToArray;
		if(typeName _cargo == "STRING") then {_cargo = call compile format["%1", _cargo];};
	} else {
		_vehItems = getItemCargo _vehicle;
		_vehMags = getMagazineCargo _vehicle;
		_vehWeapons = getWeaponCargo _vehicle;
		_vehBackpacks = getBackpackCargo _vehicle;
		_cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];
	};

	if (((count ((_cargo select 0) select 0) > 0) OR (count ((_cargo select 1) select 0) > 0) OR (count ((_cargo select 2) select 0) > 0) OR (count ((_cargo select 3) select 0) > 0)) OR (_trunk3 select 0) > 0) then {
		sleep 1200; //20 minutes
		_query = format["UPDATE vehicles SET active='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];
		_thread = [_query,1] call HC_fnc_asyncCall;
	} else {
		_query = format["UPDATE vehicles SET active='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];
		_thread = [_query,1] call HC_fnc_asyncCall;
	};
};
