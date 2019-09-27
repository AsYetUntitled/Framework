/*
    File : fn_updateHouseContainers.sqf
    Author: NiiRoZz

    Description:
    Update inventory "i" in container
*/
params [
    ["_container",objNull,[objNull]]
];
if (isNull _container) exitWith {};
private _containerID = _container getVariable ["container_id",-1];
if (_containerID isEqualTo -1) exitWith {};

private _vehItems = getItemCargo _container;
private _vehMags = getMagazineCargo _container;
private _vehWeapons = getWeaponCargo _container;
private _vehBackpacks = getBackpackCargo _container;
private _cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];

_cargo = [_cargo] call DB_fnc_mresArray;

[format ["UPDATE containers SET gear='%1' WHERE id='%2'",_cargo,_containerID],1] call DB_fnc_asyncCall;
