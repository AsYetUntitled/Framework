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
if (isNull _vehicle) exitWith {};

_dbInfo = _vehicle getVariable ["dbInfo",[]];
if (count _dbInfo isEqualTo 0) exitWith {};
_dbInfo params ["_uid", "_plate"];

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

        private _query = format ["UPDATE vehicles SET gear='%3' WHERE pid='%1' AND plate='%2'",_uid,_plate,_cargo];
        [_query,1] call DB_fnc_asyncCall;
    };

    case 2: {
        private _resourceItems = LIFE_SETTINGS(getArray,"save_vehicle_items");
        private _trunk = _vehicle getVariable ["Trunk",[[],0]];
        _trunk params ["_itemList"];
        private _totalWeight = 0;
        private _items = [];
        {
            _x params [
                ["_item","",[""]],
                ["_oldWeight",0,[0]]
            ];
            if (_item in _resourceItems) then {
                _items pushBack [_item,_oldWeight];
                _weight = (ITEM_WEIGHT(_item)) * _oldWeight;
                _totalWeight = _weight + _totalWeight;
            };
        } forEach _itemList;
        _trunk = [_items,_totalWeight];
        _trunk = [_trunk] call DB_fnc_mresArray;

        private _query = format ["UPDATE vehicles SET inventory='%3' WHERE pid='%1' AND plate='%2'",_uid,_plate,_trunk];
        [_query,1] call DB_fnc_asyncCall;
    };
};