#include "\life_server\script_macros.hpp"
/*
    File: fn_vehicleStore.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Stores the vehicle in the 'Garage'
*/
params [
    ["_vehicle",objNull,[objNull]],
    ["_impound",false,[false]],
    ["_storeText","",[""]]
];
private _unit = remoteExecutedOwner;
if (isNull _vehicle || {_unit isEqualTo 0}) exitWith {life_impound_inuse = false; _unit publicVariableClient "life_impound_inuse"; life_garage_store = false;_unit publicVariableClient "life_garage_store";}; //Bad data passed.

(_vehicle getVariable ["dbInfo",[]]) params [
    ["_uid","",[""]],
    ["_plate",0,[0]]
];

if (_impound) exitWith {
    if !(_uid isEqualTo "") then { // no free repairs!
        private _query = format ["UPDATE vehicles SET active='0', fuel='%3', damage='%4' WHERE pid='%1' AND plate='%2'",_uid , _plate, _fuel, _damage];
        [_query,1] call DB_fnc_asyncCall;
    };
    life_impound_inuse = false;
    _unit publicVariableClient "life_impound_inuse";
    if (!isNil "_vehicle" && {!isNull _vehicle}) then {
        deleteVehicle _vehicle;
    };
};

if (_uid isEqualTo "") exitWith {
    [1,"STR_Garage_Store_NotPersistent",true] remoteExecCall ["life_fnc_broadcast",_unit];
    life_garage_store = false;
    _unit publicVariableClient "life_garage_store";
};

// save damage.
private _damage = [];
if (LIFE_SETTINGS(getNumber,"save_vehicle_damage") isEqualTo 1) then {
    _damage = (getAllHitPointsDamage _vehicle) select 2;
};
_damage = [_damage] call DB_fnc_mresArray;

// because fuel price!
private _fuel = 1;
if (LIFE_SETTINGS(getNumber,"save_vehicle_fuel") isEqualTo 1) then {
    _fuel = (fuel _vehicle);
};

if !(_uid isEqualTo getPlayerUID _unit) exitWith {
    [1,"STR_Garage_Store_NoOwnership",true] remoteExecCall ["life_fnc_broadcast",_unit];
    life_garage_store = false;
    _unit publicVariableClient "life_garage_store";
};

// sort out whitelisted items!
private _resourceItems = LIFE_SETTINGS(getArray,"save_vehicle_items");
(_vehicle getVariable ["Trunk",[[],0]]) params [
    ["_itemList",[],[[]]]
];
private _totalWeight = 0;
private _items = [];
private _trunk = [[],0];
if (LIFE_SETTINGS(getNumber,"save_vehicle_virtualItems") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"save_vehicle_illegal") isEqualTo 1) then {
        private ["_isIllegal", "_blacklist"];
        private _blacklist = false;
        private _profileQuery = format ["SELECT name FROM players WHERE pid='%1'", _uid];
        ([_profileQuery, 2] call DB_fnc_asyncCall) params ["_profileName"];

        {
            _x params ["_item","_count"];
            private _isIllegal = M_CONFIG(getNumber,"VirtualItems",_item,"illegal");
            _isIllegal = if (_isIllegal isEqualTo 1) then { true } else { false };

            if ((_item in _resourceItems) || {_isIllegal}) then {
                _items pushBack[_item,_count];
                _totalWeight = ((ITEM_WEIGHT(_item)) * _count) + _totalWeight;
            };
            if (_isIllegal) then {
                _blacklist = true;
            };

        } forEach _itemList;

        if (_blacklist) then {
            [_uid, _profileName, "481"] remoteExecCall ["life_fnc_wantedAdd", RSERV];
            private _query = format ["UPDATE vehicles SET blacklist='1' WHERE pid='%1' AND plate='%2'", _uid, _plate];
            [_query, 1] call DB_fnc_asyncCall;
        };

    } else {
        {
            _x params ["_item","_count"];
            if (_item in _resourceItems) then {
                _items pushBack [_item,_count];
                _totalWeight = ((ITEM_WEIGHT(_item)) * _count) + _totalWeight;
            };
        } forEach _itemList;
    };
    _trunk = [_items, _totalweight];
};

private _cargo = [];
if (LIFE_SETTINGS(getNumber,"save_vehicle_inventory") isEqualTo 1) then {
    private _vehItems = getItemCargo _vehicle;
    private _vehMags = getMagazineCargo _vehicle;
    private _vehWeapons = getWeaponCargo _vehicle;
    private _vehBackpacks = getBackpackCargo _vehicle;
    private _cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];
    // no items? clean the array so the database looks pretty
    if ((_vehItems select 0) isEqualTo [] && {(_vehMags select 0) isEqualTo []} && {(_vehWeapons select 0) isEqualTo []} && {(_vehBackpacks select 0) isEqualTo []}) then {
        _cargo = [];
    };
};
// prepare
_trunk = [_trunk] call DB_fnc_mresArray;
_cargo = [_cargo] call DB_fnc_mresArray;

// update
private _query = format ["UPDATE vehicles SET active='0', inventory='%3', gear='%4', fuel='%5', damage='%6' WHERE pid='%1' AND plate='%2'", _uid, _plate, _trunk, _cargo, _fuel, _damage];
[_query,1] call DB_fnc_asyncCall;

if (!isNil "_vehicle" && {!isNull _vehicle}) then {
    deleteVehicle _vehicle;
};

life_garage_store = false;
_unit publicVariableClient "life_garage_store";
[1,_storetext] remoteExecCall ["life_fnc_broadcast",_unit];
