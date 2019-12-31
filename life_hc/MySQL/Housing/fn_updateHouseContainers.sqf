/*
    File : fn_updateHouseContainers.sqf
    Author: NiiRoZz

    This file is for Nanou's HeadlessClient.

    Description:
    Update inventory "i" in container
*/

params [
    ["_container", objNull, [objNull]]
];

if (isNull _container) exitWith {};

private _containerID = _container getVariable ["container_id", -1];
if (_containerID isEqualTo -1) exitWith {};

private _vehItems = getItemCargo _container;
private _vehMags = getMagazineCargo _container;
private _vehWeapons = getWeaponCargo _container;
private _vehBackpacks = getBackpackCargo _container;
private _cargo = [_vehItems, _vehMags, _vehWeapons, _vehBackpacks];

private _query = format ["updateContainer:%1:%2", _cargo, _containerID];

[_query, 1] call HC_fnc_asyncCall;
