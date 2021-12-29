#include "\life_hc\hc_macros.hpp"
/*
    File: fn_vehicleUpdate.sqf
    Author : NiiRoZz

    This file is for Nanou's HeadlessClient.

    Description:
    Tells the database that this vehicle need update inventory.
*/

params [
    ["_vehicle", objNull, [objNull]],
    ["_mode", 1, [0]]
];

if (isNull _vehicle) exitWith {};

private _ownerInfo = (_vehicle getVariable ["vehicle_info_owners",[]]) select 0;
if (_ownerInfo isEqualTo []) exitWith {};

_ownerInfo params ["_uid"];
private _vid = _vehicle getVariable ["vehID",-1];

switch _mode do {
    case 1: {
        private _vehItems = getItemCargo _vehicle;
        private _vehMags = getMagazineCargo _vehicle;
        private _vehWeapons = getWeaponCargo _vehicle;
        private _vehBackpacks = getBackpackCargo _vehicle;
        private _cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];

        // Keep it clean!
        if ((_vehItems select 0) isEqualTo [] && ((_vehMags select 0) isEqualTo []) && ((_vehWeapons select 0) isEqualTo []) && ((_vehBackpacks select 0) isEqualTo [])) then {
            _cargo = [];
        };

        private _query = format ["updateVehicleGear:%1:%2:%3", _cargo, _uid, _vid];
        [_query, 1] call HC_fnc_asyncCall;
    };

    case 2: {
        private _resourceItems = LIFE_SETTINGS(getArray,"save_vehicle_items");
        private _trunk = _vehicle getVariable ["Trunk",[[],0]];
        private _itemList = _trunk select 0;
        private _totalWeight = 0;
        private _items = [];
        {
            _x params ["_itemName","_itemCount"];
            if (_itemName in _resourceItems) then {
                _items pushBack [_itemName,_itemCount];
                private _weight = (ITEM_WEIGHT(_itemName)) * _itemCount;
                _totalWeight = _weight + _totalWeight;
            };
        } forEach _itemList;
        _trunk = [_items,_totalWeight];

        private _query = format ["updateVehicleTrunk:%1:%2:%3", _trunk, _uid, _vid];
        [_query,1] call HC_fnc_asyncCall;
    };
};
