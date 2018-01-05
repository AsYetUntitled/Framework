#include "\life_server\script_macros.hpp"
/*
    File: fn_vehicleUpdate.sqf
    Author : NiiRoZz

    Description:
    Tells the database that this vehicle need update inventory.
*/
private ["_vehicle","_plate","_uid","_query","_sql","_dbInfo","_thread","_cargo","_trunk","_resourceItems","_fuel","_damage","_itemList","_totalweight","_weight"];
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_mode = [_this,1,1,[0]] call BIS_fnc_param;
if (isNull _vehicle) exitWith {}; //NULL

_dbInfo = _vehicle getVariable ["dbInfo",[]];
if (_dbInfo isEqualTo []) exitWith {};
_uid = _dbInfo select 0;
_plate = _dbInfo select 1;
switch (_mode) do {
    case 1: {
        _vehItems = getItemCargo _vehicle;
        _vehMags = getMagazineCargo _vehicle;
        _vehWeapons = getWeaponCargo _vehicle;
        _vehBackpacks = getBackpackCargo _vehicle;
        _cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];

        // Keep it clean!
        if (((_vehItems select 0) isEqualTo []) && ((_vehMags select 0) isEqualTo []) && ((_vehWeapons select 0) isEqualTo []) && ((_vehBackpacks select 0) isEqualTo [])) then {
            _cargo = [];
        };

        _cargo = [_cargo] call DB_fnc_mresArray;

        _query = format ["updateVehicleGear:%1:%2:%3", _cargo, _uid, _plate];
        _thread = [_query,1] call DB_fnc_asyncCall;
    };

    case 2: {
        _resourceItems = LIFE_SETTINGS(getArray,"save_vehicle_items");
        _trunk = _vehicle getVariable ["Trunk",[[],0]];
        _itemList = _trunk select 0;
        _totalweight = 0;
        _items = [];
        {
            if ((_x select 0) in _resourceItems) then {
                _items pushBack [_x select 0,_x select 1];
                _weight = (ITEM_WEIGHT(_x select 0)) * (_x select 1);
                _totalweight = _weight + _totalweight;
            };
        }forEach _itemList;
        _trunk = [_items,_totalweight];
        _trunk = [_trunk] call DB_fnc_mresArray;

        _query = format ["updateVehicleTrunk:%1:%2:%3", _trunk, _uid, _plate];
        _thread = [_query,1] call DB_fnc_asyncCall;
    };
};
