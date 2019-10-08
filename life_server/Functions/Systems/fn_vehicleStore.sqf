#include "\life_server\script_macros.hpp"
/*
    File: fn_vehicleStore.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Stores the vehicle in the 'Garage'
*/
params [
    ["_vehicle",objNull,[objNull]],
    ["_impound",false,[true]],
    ["_unit",objNull,[objNull]],
    ["_storetext","",[""]]
];
private ["_uid","_plate"];

if (isNull _vehicle || isNull _unit) exitWith {life_impound_inuse = false; (owner _unit) publicVariableClient "life_impound_inuse";life_garage_store = false;(owner _unit) publicVariableClient "life_garage_store";}; //Bad data passed.
private _vInfo = _vehicle getVariable ["dbInfo",[]];
if (count _vInfo > 0) then {
    _vInfo params [
        ["_uid","",[""]],
        ["_plate",0,[0]]
    ];
};

// save damage.
private _damage = [];
if (LIFE_SETTINGS(getNumber,"save_vehicle_damage") isEqualTo 1) then {
    _damage = (getAllHitPointsDamage _vehicle) select 2;
};
_damage = [_damage] call DB_fnc_mresArray;

// because fuel price!
private _fuel = 1;
if (LIFE_SETTINGS(getNumber,"save_vehicle_fuel") isEqualTo 1) then {_fuel = (fuel _vehicle);};

if (_impound) exitWith {
    if (count _vInfo isEqualTo 0) then  {
        life_impound_inuse = false;
        (owner _unit) publicVariableClient "life_impound_inuse";

        if (!isNil "_vehicle" && {!isNull _vehicle}) then {
            deleteVehicle _vehicle;
        };
    } else {    // no free repairs!
        [format ["UPDATE vehicles SET active='0', fuel='%3', damage='%4' WHERE pid='%1' AND plate='%2'",_uid , _plate, _fuel, _damage],1] call DB_fnc_asyncCall;

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
private _totalweight = 0;
_items = [];
if (LIFE_SETTINGS(getNumber,"save_vehicle_virtualItems") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"save_vehicle_illegal") isEqualTo 1) then {
        private _blacklist = false;
        private "_isIllegal";
        {
            _isIllegal = M_CONFIG(getNumber,"VirtualItems",(_x select 0),"illegal");

            _isIllegal = if (_isIllegal isEqualTo 1) then { true } else { false };

            if (((_x select 0) in (LIFE_SETTINGS(getArray,"save_vehicle_items"))) || (_isIllegal)) then {
                _items pushBack[(_x select 0),(_x select 1)];
                _totalweight = ((ITEM_WEIGHT(_x select 0)) * (_x select 1)) + _totalweight;
            };
            if (_isIllegal) then {
                _blacklist = true;
            };

        } foreach (_trunk select 0);

        if (_blacklist) then {
            [_uid, ([format ["SELECT name FROM players WHERE pid='%1'", _uid], 2] call DB_fnc_asyncCall) select 0, "481"] remoteExecCall["life_fnc_wantedAdd", RSERV];
            [format ["UPDATE vehicles SET blacklist='1' WHERE pid='%1' AND plate='%2'", _uid, _plate],1] call DB_fnc_asyncCall;
        };

    }
    else {
        {
            if ((_x select 0) in (LIFE_SETTINGS(getArray,"save_vehicle_items"))) then {
                _items pushBack[(_x select 0),(_x select 1)];
                _totalweight = ((ITEM_WEIGHT(_x select 0)) * (_x select 1)) + _totalweight;
            };
        } forEach _itemList;
    };

    _trunk = [_items, _totalweight];
}
else {
    _trunk = [[], 0];
};

private _cargo = [];
if (LIFE_SETTINGS(getNumber,"save_vehicle_inventory") isEqualTo 1) then {
    _cargo = [getItemCargo _vehicle, getMagazineCargo _vehicle, getWeaponCargo _vehicle, getBackpackCargo _vehicle];
    // no items? clean the array so the database looks pretty
    if ((count _cargo) isEqualTo 0) then {_cargo = [];};
};
// update
[format ["UPDATE vehicles SET active='0', inventory='%3', gear='%4', fuel='%5', damage='%6' WHERE pid='%1' AND plate='%2'", _uid, _plate, [_trunk] call DB_fnc_mresArray, [_cargo] call DB_fnc_mresArray, _fuel, _damage],1] call DB_fnc_asyncCall;

if (!isNil "_vehicle" && {!isNull _vehicle}) then {
    deleteVehicle _vehicle;
};

life_garage_store = false;
(owner _unit) publicVariableClient "life_garage_store";
[1,_storetext] remoteExecCall ["life_fnc_broadcast",(owner _unit)];
