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
    ["_unit",objNull,[objNull]],
    ["_storetext","",[""]]
];
private _resourceItems = LIFE_SETTINGS(getArray,"save_vehicle_items");

if (isNull _vehicle || isNull _unit) exitWith {life_impound_inuse = false; (owner _unit) publicVariableClient "life_impound_inuse";life_garage_store = false;(owner _unit) publicVariableClient "life_garage_store";}; //Bad data passed.
private _vInfo = _vehicle getVariable ["dbInfo",[]];

if (count _vInfo > 0) then {
    _vInfo params ["_uid", "_plate"]
};

// save damage.
if (LIFE_SETTINGS(getNumber,"save_vehicle_damage") isEqualTo 1) then {
    getAllHitPointsDamage _vehicle params ["", "", "_damage"];
} else {
    _damage = [];
};
_damage = [_damage] call DB_fnc_mresArray;

// because fuel price!
private _fuel = if (LIFE_SETTINGS(getNumber,"save_vehicle_fuel") isEqualTo 1) then {
    (fuel _vehicle);
} else {
    1;
};

if (_impound) exitWith {
    if (count _vInfo isEqualTo 0) then  {
        life_impound_inuse = false;
        (owner _unit) publicVariableClient "life_impound_inuse";

        if (!isNil "_vehicle" && {!isNull _vehicle}) then {
            deleteVehicle _vehicle;
        };
    } else {    // no free repairs!
        private _query = format ["UPDATE vehicles SET active='0', fuel='%3', damage='%4' WHERE pid='%1' AND plate='%2'",_uid , _plate, _fuel, _damage];
        [_query,1] call DB_fnc_asyncCall;

        if (!isNil "_vehicle" && {!isNull _vehicle}) then {
            deleteVehicle _vehicle;
        };

        life_impound_inuse = false;
        (owner _unit) publicVariableClient "life_impound_inuse";
    };
};

// not persistent so just do this!
if (count _vInfo isEqualTo 0) exitWith {
    [1,"STR_Garage_Store_NotPersistent",true] remoteExecCall ["life_fnc_broadcast",(owner _unit)];
    life_garage_store = false;
    (owner _unit) publicVariableClient "life_garage_store";
};

if !(_uid isEqualTo getPlayerUID _unit) exitWith {
    [1,"STR_Garage_Store_NoOwnership",true] remoteExecCall ["life_fnc_broadcast",(owner _unit)];
    life_garage_store = false;
    (owner _unit) publicVariableClient "life_garage_store";
};

// sort out whitelisted items!
private _trunk = _vehicle getVariable ["Trunk", [[], 0]];
_trunk params ["_itemList"];
private _totalweight = 0;
private _items = [];
if (LIFE_SETTINGS(getNumber,"save_vehicle_virtualItems") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"save_vehicle_illegal") isEqualTo 1) then {
        private _blacklist = false;
        private _profileQuery = format ["SELECT name FROM players WHERE pid='%1'", _uid];
        private _profileName = [_profileQuery, 2] call DB_fnc_asyncCall;
        _profileName params ["_profileName"];

        {
            _x params [
                ["_item","",[""]],
                ["_oldWeight",0,[0]]
            ];
            _isIllegal = M_CONFIG(getNumber,"VirtualItems",(_item),"illegal");

            _isIllegal = if (_isIllegal isEqualTo 1) then { true } else { false };

            if ((_item in _resourceItems) || (_isIllegal)) then {
                _items pushBack[_item,_oldWeight];
                _weight = (ITEM_WEIGHT(_item)) * (_oldWeight);
                _totalweight = _weight + _totalweight;
            };
            if (_isIllegal) then {
                _blacklist = true;
            };

        } forEach _itemList;

        if (_blacklist) then {
            [_uid, _profileName, "481"] remoteExecCall["life_fnc_wantedAdd", RSERV];
            private _query = format ["UPDATE vehicles SET blacklist='1' WHERE pid='%1' AND plate='%2'", _uid, _plate];
            [_query, 1] call DB_fnc_asyncCall;
        };

    } else {
        {
            _x params [
                ["_item","",[""]],
                ["_oldWeight",0,[0]]
            ];
            if (_item in _resourceItems) then {
                _items pushBack[_item,(_oldWeight)];
                _weight = (ITEM_WEIGHT(_item)) * (_oldWeight);
                _totalweight = _weight + _totalweight;
            };
        } forEach _itemList;
    };

    _trunk = [_items, _totalweight];
} else {
    _trunk = [[], 0];
};

if (LIFE_SETTINGS(getNumber,"save_vehicle_inventory") isEqualTo 1) then {
    private _vehItems = getItemCargo _vehicle;
    private _vehMags = getMagazineCargo _vehicle;
    private _vehWeapons = getWeaponCargo _vehicle;
    private _vehBackpacks = getBackpackCargo _vehicle;
    private _cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];
    // no items? clean the array so the database looks pretty
    if ((count (_vehItems select 0) isEqualTo 0) && (count (_vehMags select 0) isEqualTo 0) && (count (_vehWeapons select 0) isEqualTo 0) && (count (_vehBackpacks select 0) isEqualTo 0)) then {_cargo = [];};
    } else {
    _cargo = [];
};
// prepare
_trunk = [_trunk] call DB_fnc_mresArray;
_cargo = [_cargo] call DB_fnc_mresArray;

// update
_query = format ["UPDATE vehicles SET active='0', inventory='%3', gear='%4', fuel='%5', damage='%6' WHERE pid='%1' AND plate='%2'", _uid, _plate, _trunk, _cargo, _fuel, _damage];
[_query,1] call DB_fnc_asyncCall;

if (!isNil "_vehicle" && {!isNull _vehicle}) then {
    deleteVehicle _vehicle;
};

life_garage_store = false;
(owner _unit) publicVariableClient "life_garage_store";
[1,_storetext] remoteExecCall ["life_fnc_broadcast",(owner _unit)];
