/*
    File : fn_updateHouseContainers.sqf
    Author: NiiRoZz

    Description:
    Update inventory "i" in container
*/
private["_containerID","_containers","_query","_vehItems","_vehMags","_vehWeapons","_vehBackpacks","_cargo"];
_container = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if (isNull _container) exitWith {};
_containerID = _container getVariable["container_id",-1];
if (_houseID isEqualTo -1) exitWith {};

_vehItems = getItemCargo _container;
_vehMags = getMagazineCargo _container;
_vehWeapons = getWeaponCargo _container;
_vehBackpacks = getBackpackCargo _container;
_cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];

_cargo = [_cargo] call DB_fnc_mresArray;

_query = format["UPDATE containers SET gear='%1' WHERE id='%2'",_cargo,_containerID];

[_query,1] call DB_fnc_asyncCall;
