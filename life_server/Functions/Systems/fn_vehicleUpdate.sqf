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

switch (_mode) do {
    case 1: {
        private _cargo = [getItemCargo _vehicle, getMagazineCargo _vehicle, getWeaponCargo _vehicle, getBackpackCargo _vehicle];
        // Keep it clean!
        if ((count _cargo) isEqualTo 0) then {_cargo = [];};
        [format ["UPDATE vehicles SET gear='%3' WHERE pid='%1' AND plate='%2'", _dbInfo select 0, _dbInfo select 1, [_cargo] call DB_fnc_mresArray], 1] call DB_fnc_asyncCall;
    };

    case 2: {
        private _totalweight = 0;
        private _items = [];
        {
            if ((_x select 0) in (LIFE_SETTINGS(getArray,"save_vehicle_items"))) then {
                _items pushBack [_x select 0,_x select 1];
                _totalweight = ((ITEM_WEIGHT(_x select 0)) * (_x select 1)) + _totalweight;
            };
        }forEach ((_vehicle getVariable ["Trunk",[[],0]]) select 0);
        [format ["UPDATE vehicles SET inventory='%3' WHERE pid='%1' AND plate='%2'", _dbInfo select 0, _dbInfo select 1, [[_items,_totalweight]] call DB_fnc_mresArray],1] call DB_fnc_asyncCall;
    };
};
