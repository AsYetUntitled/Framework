#include "\life_server\script_macros.hpp"
/*
    File: fn_vehicleStore.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Stores the vehicle in the 'Garage'
*/
private["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_sql","_unit","_trunk","_vehItems","_vehMags","_vehWeapons","_vehBackpacks","_cargo","_saveItems","_storetext","_resourceItems","_fuel","_damage","_itemList","_totalweight","_weight","_thread"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_impound = [_this,1,false,[true]] call BIS_fnc_param;
_unit = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
_storetext = [_this,3,"",[""]] call BIS_fnc_param;
_resourceItems = LIFE_SETTINGS(getArray,"save_vehicle_items");

if (isNull _vehicle || isNull _unit) exitWith {life_impound_inuse = false; (owner _unit) publicVariableClient "life_impound_inuse";life_garage_store = false;(owner _unit) publicVariableClient "life_garage_store";}; //Bad data passed.
_vInfo = _vehicle getVariable["dbInfo",[]];

if (count _vInfo > 0) then {
    _plate = _vInfo select 1;
    _uid = _vInfo select 0;
};

// save damage.
if (LIFE_SETTINGS(getNumber,"save_vehicle_damage") isEqualTo 1) then {
    _damage = getAllHitPointsDamage _vehicle;
    _damage = _damage select 2;
    } else {
    _damage = [];
};
_damage = [_damage] call DB_fnc_mresArray;

// because fuel price!
if (LIFE_SETTINGS(getNumber,"save_vehicle_fuel") isEqualTo 1) then {
    _fuel = (fuel _vehicle);
    } else {
    _fuel = 1;
};

if (_impound) exitWith {
    if (count _vInfo isEqualTo 0) then  {
        life_impound_inuse = false;
        (owner _unit) publicVariableClient "life_impound_inuse";

        if (!isNil "_vehicle" && {!isNull _vehicle}) then {
            deleteVehicle _vehicle;
        };
    } else {    // no free repairs!
        _query = format["UPDATE vehicles SET active='0', fuel='%3', damage='%4' WHERE pid='%1' AND plate='%2'",_uid , _plate, _fuel, _damage];
        _thread = [_query,1] call DB_fnc_asyncCall;

        if (!isNil "_vehicle" && {!isNull _vehicle}) then {
            deleteVehicle _vehicle;
        };

        life_impound_inuse = false;
        (owner _unit) publicVariableClient "life_impound_inuse";
    };
};

// not persistent so just do this!
if (count _vInfo isEqualTo 0) exitWith {
    [1,(localize "STR_Garage_Store_NotPersistent")] remoteExecCall ["life_fnc_broadcast",(owner _unit)];
    life_garage_store = false;
    (owner _unit) publicVariableClient "life_garage_store";
};

if (_uid != getPlayerUID _unit) exitWith {
    [1,(localize "STR_Garage_Store_NoOwnership")] remoteExecCall ["life_fnc_broadcast",(owner _unit)];
    life_garage_store = false;
    (owner _unit) publicVariableClient "life_garage_store";
};

// sort out whitelisted items!
_trunk = _vehicle getVariable["Trunk", [[], 0]];
_itemList = _trunk select 0;
_totalweight = 0;
_items = [];
if (LIFE_SETTINGS(getNumber,"save_vehicle_virtualItems") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"save_vehicle_illegal") isEqualTo 1) then {
        private["_isIllegal", "_blacklist"];
        _blacklist = false;
        _profileQuery = format["SELECT name FROM players WHERE playerid='%1'", _uid];
        _profileName = [_profileQuery, 2] call DB_fnc_asyncCall;
        _profileName = _profileName select 0;

        {
            _isIllegal = M_CONFIG(getNumber,"VirtualItems",(_x select 0),"illegal");

            _isIllegal = if (_isIllegal isEqualTo 1) then { true } else { false };

            if (((_x select 0) in _resourceItems) || (_isIllegal)) then {
                _items pushBack[(_x select 0),(_x select 1)];
                _weight = (ITEM_WEIGHT(_x select 0)) * (_x select 1);
                _totalweight = _weight + _totalweight;
            };
            if (_isIllegal) then {
                _blacklist = true;
            };

        }
        foreach _itemList;

        if (_blacklist) then {
            [_uid, _profileName, "481"] remoteExecCall["life_fnc_wantedAdd", RSERV];
            _query = format["UPDATE vehicles SET blacklist='1' WHERE pid='%1' AND plate='%2'", _uid, _plate];
            _thread = [_query, 1] call DB_fnc_asyncCall;
        };

    }
    else {
        {
            if ((_x select 0) in _resourceItems) then {
                _items pushBack[(_x select 0),(_x select 1)];
                _weight = (ITEM_WEIGHT(_x select 0)) * (_x select 1);
                _totalweight = _weight + _totalweight;
            };
        }
        forEach _itemList;
    };

    _trunk = [_items, _totalweight];
}
else {
    _trunk = [[], 0];
};

if (LIFE_SETTINGS(getNumber,"save_vehicle_inventory") isEqualTo 1) then {
    _vehItems = getItemCargo _vehicle;
    _vehMags = getMagazineCargo _vehicle;
    _vehWeapons = getWeaponCargo _vehicle;
    _vehBackpacks = getBackpackCargo _vehicle;
    _cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];
    // no items? clean the array so the database looks pretty
    if ((count (_vehItems select 0) isEqualTo 0) && (count (_vehMags select 0) isEqualTo 0) && (count (_vehWeapons select 0) isEqualTo 0) && (count (_vehBackpacks select 0) isEqualTo 0)) then {_cargo = [];};
    } else {
    _cargo = [];
};
// prepare
_trunk = [_trunk] call DB_fnc_mresArray;
_cargo = [_cargo] call DB_fnc_mresArray;

// update
_query = format["UPDATE vehicles SET active='0', inventory='%3', gear='%4', fuel='%5', damage='%6' WHERE pid='%1' AND plate='%2'", _uid, _plate, _trunk, _cargo, _fuel, _damage];
_thread = [_query,1] call DB_fnc_asyncCall;

if (!isNil "_vehicle" && {!isNull _vehicle}) then {
    deleteVehicle _vehicle;
};

life_garage_store = false;
(owner _unit) publicVariableClient "life_garage_store";
[1,_storetext] remoteExecCall ["life_fnc_broadcast",(owner _unit)];
