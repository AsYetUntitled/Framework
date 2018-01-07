#include "\life_server\script_macros.hpp"
/*
    File : fn_fetchPlayerHouses.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : NiiRoZz

    Description:
    1. Fetches all the players houses and sets them up.
    2. Fetches all the players containers and sets them up.
*/
params [
    ["_uid","",[""]]
];
if (_uid isEqualTo "") exitWith {};

private _query = format ["SELECT pid, pos, classname, inventory, gear, dir, id FROM containers WHERE pid='%1' AND owned='1'",_uid];
private _containers = [_query,2,true] call DB_fnc_asyncCall;

private _containerss = [];
{
    _x params [
        "_pid",
        "_pos",
        "_className",
        "_inventory",
        "_gear",
        "_dir",
        "_id"
    ];
    _position = call compile format ["%1",_pos];
    _house = nearestObject [_position, "House"];
    _direction = call compile format ["%1",_dir];
    _trunk = [_inventory] call DB_fnc_mresToArray;
    if (_trunk isEqualType "") then {_trunk = call compile format ["%1", _trunk];};
    _gear = [_gear] call DB_fnc_mresToArray;
    if (_gear isEqualType "") then {_gear = call compile format ["%1", _gear];};
    _container = createVehicle[_className,[0,0,999],[],0,"NONE"];
    waitUntil {!isNil "_container" && {!isNull _container}};
    _containerss = _house getVariable ["containers",[]];
    _containerss pushBack _container;
    _container allowDamage false;
    _container setPosATL _position;
    _container setVectorDirAndUp _direction;
    //Fix position for more accurate positioning
    _position params ["_posX", "_posY", "_posZ"];
    (getPosATL _container) params ["_curPosX", "_curPosY", "_curPosZ"];
    _fixX = _curPosX - _posX;
    _fixY = _curPosY - _posY;
    _fixZ = _curPosZ - _posZ;
    _container setPosATL [(_posX - _fixX), (_posY - _fixY), (_posZ - _fixZ)];
    _container setVectorDirAndUp _direction;
    _container setVariable ["Trunk",_trunk,true];
    _container setVariable ["container_owner",[_pid],true];
    _container setVariable ["container_id",_id,true];
    clearWeaponCargoGlobal _container;
    clearItemCargoGlobal _container;
    clearMagazineCargoGlobal _container;
    clearBackpackCargoGlobal _container;
    if (count _gear > 0) then {
        _gear params ["_items", "_mags", "_weapons", "_backpacks"];
        for "_i" from 0 to ((count (_items select 0)) - 1) do {
            _container addItemCargoGlobal [((_items select 0) select _i), ((_items select 1) select _i)];
        };
        for "_i" from 0 to ((count (_mags select 0)) - 1) do{
            _container addMagazineCargoGlobal [((_mags select 0) select _i), ((_mags select 1) select _i)];
        };
        for "_i" from 0 to ((count (_weapons select 0)) - 1) do{
            _container addWeaponCargoGlobal [((_weapons select 0) select _i), ((_weapons select 1) select _i)];
        };
        for "_i" from 0 to ((count (_backpacks select 0)) - 1) do{
            _container addBackpackCargoGlobal [((_backpacks select 0) select _i), ((_backpacks select 1) select _i)];
        };
    };
    _house setVariable ["containers",_containerss,true];
} forEach _containers;

_query = format ["SELECT pid, pos FROM houses WHERE pid='%1' AND owned='1'",_uid];
_houses = [_query,2,true] call DB_fnc_asyncCall;

_return = [];
{
    _x params [
        "",
        "_pos"
    ];
    _position = call compile format ["%1",_pos];
    _house = nearestObject [_position, "House"];
    _house allowDamage false;
    _return pushBack [_pos];
} forEach _houses;

missionNamespace setVariable [format ["houses_%1",_uid],_return];
