#include "\life_server\script_macros.hpp"
/*
	File: fn_vehicleStore.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Stores the vehicle in the 'Garage'
*/
private["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_sql","_unit","_trunk","_vehItems","_vehMags","_vehWeapons","_vehBackpacks","_cargo","_saveItems","_storetext","_resourceItems","_fuel","_damage"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_impound = [_this,1,false,[true]] call BIS_fnc_param;
_unit = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
_storetext = [_this,3,"",[""]] call BIS_fnc_param;
_resourceItems = LIFE_SETTINGS(getArray,"save_veh_items");

if(isNull _vehicle OR isNull _unit) exitWith {life_impound_inuse = false; (owner _unit) publicVariableClient "life_impound_inuse";life_garage_store = false;(owner _unit) publicVariableClient "life_garage_store";}; //Bad data passed.

_vInfo = _vehicle getVariable["dbInfo",[]];

if(count _vInfo > 0) then {
	_plate = _vInfo select 1;
	_uid = _vInfo select 0;
};

// not persistent so just do this!
if(count _vInfo == 0) exitWith {
	[1,(localize "STR_Garage_Store_NotPersistent")] remoteExecCall ["life_fnc_broadcast",(owner _unit)];
	life_garage_store = false;
	(owner _unit) publicVariableClient "life_garage_store";
};

if(_uid != getPlayerUID _unit) exitWith {
	[1,(localize "STR_Garage_Store_NoOwnership")] remoteExecCall ["life_fnc_broadcast",(owner _unit)];
	life_garage_store = false;
	(owner _unit) publicVariableClient "life_garage_store";
};

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
	} else { 
	_trunk = [[],0];
};

// because fuel price!
if(EQUAL(LIFE_SETTINGS(getNumber,"save_veh_fuel"),1)) then {
	_fuel = (fuel _vehicle);
	} else {
	_fuel = 1;
};

if(EQUAL(LIFE_SETTINGS(getNumber,"save_veh_damage"),1)) then {
	_damage = getAllHitPointsDamage _vehicle;
	_damage = _damage select 2;
	} else {
	_damage = [];
};

if(EQUAL(LIFE_SETTINGS(getNumber,"save_veh_gear"),1)) then {
	_vehItems = getItemCargo _vehicle;
	_vehMags = getMagazineCargo _vehicle;
	_vehWeapons = getWeaponCargo _vehicle;
	_vehBackpacks = getBackpackCargo _vehicle;
	_cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];
	// no items? clean the array so the database looks pretty
	if((count (_vehItems select 0) == 0) && (count (_vehMags select 0) == 0) && (count (_vehWeapons select 0) == 0) && (count (_vehBackpacks select 0) == 0)) then {_cargo = [];};	
	} else {
	_cargo = [];
};

// prepare
_trunk = [_trunk] call DB_fnc_mresArray;
_cargo = [_cargo] call DB_fnc_mresArray;
_damage = [_damage] call DB_fnc_mresArray;

if(_impound) exitWith {
	if(count _vInfo == 0) then  {
		life_impound_inuse = false;
		(owner _unit) publicVariableClient "life_impound_inuse";
		
		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			deleteVehicle _vehicle;
		};
	} else {	// no free repair or refuel if saving is enabled!
		_query = format["UPDATE vehicles SET active='0' fuel='%3' damage='%4' WHERE pid='%1' AND plate='%2'",_uid , _plate, _fuel, _damage];
		_thread = [_query,1] call DB_fnc_asyncCall;

		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			deleteVehicle _vehicle;
		};
		
		life_impound_inuse = false;
		(owner _unit) publicVariableClient "life_impound_inuse";
	};
};

// update
_query = format["UPDATE vehicles SET active='0', inventory='%3', gear='%4', fuel='%5', damage='%6' WHERE pid='%1' AND plate='%2'", _uid, _plate, _trunk, _cargo, _fuel, _damage];
_thread = [_query,1] call DB_fnc_asyncCall;

if(!isNil "_vehicle" && {!isNull _vehicle}) then {
	deleteVehicle _vehicle;
};

life_garage_store = false;
(owner _unit) publicVariableClient "life_garage_store";
[1,_storetext] remoteExecCall ["life_fnc_broadcast",(owner _unit)];