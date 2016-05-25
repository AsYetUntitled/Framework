#include "\life_server\script_macros.hpp"
/*
    File : fn_fetchPlayerHouses.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : NiiRoZz

    Description:
    1. Fetches all the players houses and sets them up.
    2. Fetches all the players containers and sets them up.
*/
private["_query","_containers","_containerss","_houses"];
params [
    ["_uid","",[""]]
];
if (_uid isEqualTo "") exitWith {};

_query = format["SELECT pid, pos, classname, inventory, gear, dir, id FROM containers WHERE pid='%1' AND owned='1'",_uid];
_containers = [_query,2,true] call DB_fnc_asyncCall;

_containerss = [];
{
    _position = call compile format["%1",_x select 1];
    _house = nearestObject [_position, "House"];
    _direction = call compile format["%1",_x select 5];
    _trunk = [_x select 3] call DB_fnc_mresToArray;
    if (_trunk isEqualType "") then {_trunk = call compile format["%1", _trunk];};
    _gear = [_x select 4] call DB_fnc_mresToArray;
    if (_gear isEqualType "") then {_gear = call compile format["%1", _gear];};
    _container = createVehicle[_x select 2,[0,0,999],[],0,"NONE"];
    waitUntil {!isNil "_container" && {!isNull _container}};
    _containerss pushBack _container;
    _container allowDamage false;
    _container setPosATL _position;
    _container setVectorDirAndUp _direction;
    //Fix position for more accurate positioning
    _posX = _position select 0;
    _posY = _position select 1;
    _posZ = _position select 2;
    _currentPos = getPosATL _container;
    _fixX = (_currentPos select 0) - _posX;
    _fixY = (_currentPos select 1) - _posY;
    _fixZ = (_currentPos select 2) - _posZ;
    _container setPosATL [(_posX - _fixX), (_posY - _fixY), (_posZ - _fixZ)];
    _container setVectorDirAndUp _direction;
    _container setVariable["Trunk",_trunk,true];
    _container setVariable["container_owner",[_x select 0],true];
    _container setVariable["container_id",_x select 6,true];
    clearWeaponCargoGlobal _container;
    clearItemCargoGlobal _container;
    clearMagazineCargoGlobal _container;
    clearBackpackCargoGlobal _container;
    if (count _gear > 0) then {
        _items = _gear select 0;
        _mags = _gear select 1;
        _weapons = _gear select 2;
        _backpacks = _gear select 3;
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
    _house setVariable["containers",_containerss,true];
} forEach _containers;

_query = format["SELECT pid, pos FROM houses WHERE pid='%1' AND owned='1'",_uid];
_houses = [_query,2,true] call DB_fnc_asyncCall;

_return = [];
{
    _pos = call compile format["%1",_x select 1];
    _house = nearestObject [_pos, "House"];
    _house allowDamage false;
    _return pushBack [_x select 1,_containerss];
} forEach _houses;

missionNamespace setVariable[format["houses_%1",_uid],_return];