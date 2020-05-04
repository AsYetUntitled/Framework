#include "\life_hc\hc_macros.hpp"
/*
    File: fn_vehicleStore.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Stores the vehicle in the 'Garage'
*/
params [
    ["_vehicle", objNull, [objNull]],
    ["_impound", false, [true]],
    ["_unit", objNull, [objNull]]
];

if (isNull _vehicle || {isNull _unit}) exitWith {life_garage_store = false;(owner _unit) publicVariableClient "life_garage_store";}; //Bad data passed.

private _ownerInfo = (_vehicle getVariable ["vehicle_info_owners",[]]) select 0;
_ownerInfo params ["_uid"];
private _vid = _vehicle getVariable ["vehID",-1];

// save damage.
private _damage = [];
if (LIFE_SETTINGS(getNumber,"save_vehicle_damage") isEqualTo 1) then {
    _damage = getAllHitPointsDamage _vehicle;
    _damage = _damage select 2;
};

// because fuel price!
private _fuel = 1;
if (LIFE_SETTINGS(getNumber,"save_vehicle_fuel") isEqualTo 1) then {
    _fuel = fuel _vehicle;
};

if (_impound) exitWith {
    if (_vid isEqualTo -1) then {
        private _query = format ["updateVehicleFuel:%1:%2:%3:%4", _fuel, _damage, _uid, _vid];
        [_query,1] call HC_fnc_asyncCall;
    };

    deleteVehicle _vehicle;
};

// not persistent so just do this!
if (_vid isEqualTo -1) exitWith {
    if (LIFE_SETTINGS(getNumber,"vehicle_rentalReturn") isEqualTo 1) then {
        [1,"STR_Garage_Store_NotPersistent2",true] remoteExecCall ["life_fnc_broadcast",_unit];
        deleteVehicle _vehicle;
    } else {
        [1,"STR_Garage_Store_NotPersistent",true] remoteExecCall ["life_fnc_broadcast",_unit];
    };
    life_garage_store = false;
    (owner _unit) publicVariableClient "life_garage_store";
};

if !(_uid isEqualTo getPlayerUID _unit) exitWith {
    [1,"STR_Garage_Store_NoOwnership",true] remoteExecCall ["life_fnc_broadcast",_unit];
    life_garage_store = false;
    (owner _unit) publicVariableClient "life_garage_store";
};

// sort out whitelisted items!
private _trunk = _vehicle getVariable ["Trunk", [[], 0]];
_trunk params ["_itemList"];
private _totalWeight = 0;
private _items = [];
if (LIFE_SETTINGS(getNumber,"save_vehicle_virtualItems") isEqualTo 1) then {
    private _resourceItems = LIFE_SETTINGS(getArray,"save_vehicle_items");
    if (LIFE_SETTINGS(getNumber,"save_vehicle_illegal") isEqualTo 1) then {
        private _blacklist = false;
        private _profileQuery = format ["selectName:%1", _uid];
        private _profileName = [_profileQuery, 2] call HC_fnc_asyncCall;
        _profileName = _profileName select 0;

        {
            _x params ["_itemName","_itemCount"];
            private _isIllegal = M_CONFIG(getNumber,"VirtualItems",_itemName,"illegal");

            _isIllegal = _isIllegal isEqualTo 1;

            if ((_itemName in _resourceItems) || {_isIllegal}) then {
                _items pushBack [_itemName,_itemCount];
                private _weight = (ITEM_WEIGHT(_itemName)) * _itemCount;
                _totalWeight = _weight + _totalWeight;
            };
            if (_isIllegal) then {
                _blacklist = true;
            };

        } forEach _itemList;

        if (_blacklist) then {
            [_uid, _profileName, "481"] call life_fnc_wantedAdd;
            private _query = format ["updateVehicleBlacklistPlate:%1:%2", _uid, _vid];
            [_query, 1] call HC_fnc_asyncCall;
        };

    } else {
        {
            _x params ["_itemName","_itemCount"];
            if (_itemName in _resourceItems) then {
                _items pushBack [_itemName,_itemCount];
                private _weight = (ITEM_WEIGHT(_itemName)) * _itemCount;
                _totalWeight = _weight + _totalWeight;
            };
        } forEach _itemList;
    };

    _trunk = [_items, _totalWeight];
} else {
    _trunk = [[], 0];
};

private _cargo = [];
if (LIFE_SETTINGS(getNumber,"save_vehicle_inventory") isEqualTo 1) then {
    private _vehItems = getItemCargo _vehicle;
    private _vehMags = getMagazineCargo _vehicle;
    private _vehWeapons = getWeaponCargo _vehicle;
    private _vehBackpacks = getBackpackCargo _vehicle;

    if !((_vehItems select 0) isEqualTo [] && {(_vehMags select 0) isEqualTo [] && {(_vehWeapons select 0) isEqualTo [] && {(_vehBackpacks select 0) isEqualTo []}}}) then {
        _cargo = [_vehItems, _vehMags, _vehWeapons, _vehBackpacks];
    };
};

// update
private _query = format ["updateVehicleAll:%1:%2:%3:%4:%5:%6", _trunk, _cargo, _fuel, _damage, _uid, _vid];
[_query,1] call HC_fnc_asyncCall;

deleteVehicle _vehicle;

life_garage_store = false;
(owner _unit) publicVariableClient "life_garage_store";
[1,"STR_Garage_Store_Success",true] remoteExecCall ["life_fnc_broadcast",_unit];
