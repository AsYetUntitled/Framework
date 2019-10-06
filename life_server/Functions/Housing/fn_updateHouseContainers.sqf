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

[format ["UPDATE containers SET gear='%1' WHERE id='%2'", [[getItemCargo _container, getMagazineCargo _container, getWeaponCargo _container, getBackpackCargo _container]] call DB_fnc_mresArray, _containerID],1] call DB_fnc_asyncCall;
