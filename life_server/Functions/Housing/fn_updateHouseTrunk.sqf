/*
    File : fn_updateHouseTrunk.sqf
    Author: NiiRoZz

    Description:
    Update inventory "y" in container
*/
params [
    ["_container",objNull,[objNull]]
];
if (isNull _container) exitWith {};

private _containerID = _container getVariable ["container_id",-1];
if (_containerID isEqualTo -1) exitWith {}; //Dafuq?

[format ["UPDATE containers SET inventory='%1' WHERE id='%2'", [_container getVariable ["Trunk",[[],0]]] call DB_fnc_mresArray, _containerID],1] call DB_fnc_asyncCall;
