/*
    File : fn_updateHouseTrunk.sqf
    Author: NiiRoZz

    This file is for Nanou's HeadlessClient.

    Description:
    Update inventory "y" in container
*/

params [
    ["_container", objNull, [objNull]]
];

if (isNull _container) exitWith {};

_trunkData = _container getVariable ["Trunk", [[], 0]];
_containerID = _container getVariable ["container_id", -1];

if (_containerID isEqualTo -1) exitWith {};

_query = format ["updateHouseTrunk:%1:%2", _trunkData, _containerID];
[_query, 1] call HC_fnc_asyncCall;
