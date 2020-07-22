/*
File: fn_houseCleanup.sqf
Author: NiiRoZz
Description:
Cleans up containers inside in house of player.
*/
params [
["_uid","",[""]]
];

private _query = format ["SELECT pos FROM containers WHERE pid='%1' AND owned='1'",_uid];
private _containers = [_query,2,true] call DB_fnc_asyncCall;

{
_x params ["_pos"];
_pos = parseSimpleArray _pos;
{
_x setPos [8417.31,25137.8,0.000846863];
_x setVariable ["trunk_in_use",true,true];

_trunkData = _x getVariable ["Trunk",[[],0]];
_containerID = _x getVariable ["container_id",-1];
_trunkData = [_trunkData] call DB_fnc_mresArray;
_query = format ["UPDATE containers SET inventory='%1' WHERE id='%2'",_trunkData,_containerID];
[_query,1] call DB_fnc_asyncCall;

_containerID = _x getVariable ["container_id",-1];
_vehItems = getItemCargo _x;
_vehMags = getMagazineCargo _x;
_vehWeapons = getWeaponCargo _x;
_vehBackpacks = getBackpackCargo _x;
_cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];
_cargo = [_cargo] call DB_fnc_mresArray;
_query = format ["UPDATE containers SET gear='%1' WHERE id='%2'",_cargo,_containerID];
[_query,1] call DB_fnc_asyncCall;

deleteVehicle _x;
} forEach (nearestObjects[_pos,["Box_IND_Grenades_F","B_supplyCrate_F"],12]);
} forEach _containers;