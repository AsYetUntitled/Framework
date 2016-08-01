/*
    File : fn_updateHouseTrunk.sqf
    Author: NiiRoZz

    This file is for Nanou's HeadlessClient.

    Description:
    Update inventory "y" in container
*/
private ["_house"];
_container = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (isNull _container) exitWith {};

_trunkData = _container getVariable ["Trunk",[[],0]];
_containerID = _container getVariable ["container_id",-1];

if (_containerID isEqualTo -1) exitWith {}; //Dafuq?

_trunkData = [_trunkData] call HC_fnc_mresArray;
_query = format ["UPDATE containers SET inventory='%1' WHERE id='%2'",_trunkData,_containerID];

[_query,1] call HC_fnc_asyncCall;
