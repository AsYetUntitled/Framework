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

(_vehicle getVariable ["dbInfo",[]]) params [
    ["_uid","",[""]],
    ["_plate",-1,[0]]
];
if (_uid isEqualTo "" || {_plate isEqualTo -1}) exitWith {};

switch _mode do {
    case 1: {
        private _vehItems = getItemCargo _vehicle;
        private _vehMags = getMagazineCargo _vehicle;
        private _vehWeapons = getWeaponCargo _vehicle;
        private _vehBackpacks = getBackpackCargo _vehicle;
        private _cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];

        // Keep it clean!
        if ((_vehItems select 0) isEqualTo [] && {(_vehMags select 0) isEqualTo []} && {(_vehWeapons select 0) isEqualTo []} && {(_vehBackpacks select 0) isEqualTo []}) then {
            _cargo = [];
        };

        private _cargo = [_cargo] call DB_fnc_mresArray;

        private _query = format ["UPDATE vehicles SET gear='%3' WHERE pid='%1' AND plate='%2'",_uid,_plate,_cargo];
        [_query,1] call DB_fnc_asyncCall;
    };

    case 2: {
        private _resourceItems = LIFE_SETTINGS(getArray,"save_vehicle_items");
        (_vehicle getVariable ["Trunk",[[],0]]) params [
            ["_itemList",[],[[]]]
        ];
        private _totalWeight = 0;
        private _items = [];
        {
            _x params ["_item","_count"];
            if (_item in _resourceItems) then {
                _items pushBack [_item,_count];
                _totalWeight = ((ITEM_WEIGHT(_item)) * _count) + _totalWeight;
            };
        } forEach _itemList;
        private _trunk = [_items,_totalWeight];
        _trunk = [_trunk] call DB_fnc_mresArray;

        private _query = format ["UPDATE vehicles SET inventory='%3' WHERE pid='%1' AND plate='%2'",_uid,_plate,_trunk];
        [_query,1] call DB_fnc_asyncCall;
    };
};