#include "\life_server\script_macros.hpp"
/*
    File: fn_vehicleUpdate.sqf
    Author : NiiRoZz

    Description:
    Tells the database that this vehicle need update inventory.
*/
params [
    ["_vehicle",objNull,[objNull]],
    ["_mode",1,[0]]
];
if (isNull _vehicle) exitWith {}; //NULL

private _dbInfo = _vehicle getVariable ["dbInfo",[]];
if (count _dbInfo isEqualTo 0) exitWith {};
private _uid = _dbInfo select 0;
private _plate = _dbInfo select 1;
switch (_mode) do {
    case 1: {
        private _vehItems = getItemCargo _vehicle;
        private _vehMags = getMagazineCargo _vehicle;
        private _vehWeapons = getWeaponCargo _vehicle;
        private _vehBackpacks = getBackpackCargo _vehicle;
        private _cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];

        // Keep it clean!
        if ((count (_vehItems select 0) isEqualTo 0) && (count (_vehMags select 0) isEqualTo 0) && (count (_vehWeapons select 0) isEqualTo 0) && (count (_vehBackpacks select 0) isEqualTo 0)) then {
            _cargo = [];
        };

        _cargo = [_cargo] call DB_fnc_mresArray;

        [format ["UPDATE vehicles SET gear='%3' WHERE pid='%1' AND plate='%2'",_uid,_plate,_cargo],1] call DB_fnc_asyncCall;
    };

    case 2: {
        private _resourceItems = LIFE_SETTINGS(getArray,"save_vehicle_items");
        private _trunk = _vehicle getVariable ["Trunk",[[],0]];
        private _itemList = _trunk select 0;
        private _totalweight = 0;
        private _items = [];
        private _weight = 0;
        {
            if ((_x select 0) in _resourceItems) then {
                _items pushBack [_x select 0,_x select 1];
                _weight = (ITEM_WEIGHT(_x select 0)) * (_x select 1);
                _totalweight = _weight + _totalweight;
            };
        }forEach _itemList;
        _trunk = [_items,_totalweight];
        _trunk = [_trunk] call DB_fnc_mresArray;

        [format ["UPDATE vehicles SET inventory='%3' WHERE pid='%1' AND plate='%2'",_uid,_plate,_trunk],1] call DB_fnc_asyncCall;
    };
};
