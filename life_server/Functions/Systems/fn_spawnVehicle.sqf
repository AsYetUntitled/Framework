#include "\life_server\script_macros.hpp"
/*
    File: fn_spawnVehicle.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Attempts to create the selected vehicle, returning error messages if required.
*/
params [
    ["_unit",objNull,[objNull]],
    ["_vid",-1,[""]],
    ["_spawnPoint","",[""]],
    ["_dir",-1,[0]]
];
if (isNull _unit || {_vid isEqualTo -1}) exitWith {};

private _name = name _unit;
private _side = side _unit;
private _pid = getPlayerUID _unit;

private _query = format ["selectVehiclesMore:%1:%2", _vid, _pid];
private _tickTime = diag_tickTime;
private _queryResult = [_query, 2] call DB_fnc_asyncCall;

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Client Query Request -------------";
    diag_log format ["QUERY: %1",_query];
    diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
    diag_log format ["Result: %1",_queryResult];
    diag_log "------------------------------------------------";
};

if (_queryResult isEqualType "" || {_queryResult isEqualTo []}) exitWith {};
_queryResult params ["_className","_plate","_color","_trunk","_gear","_fuel","_damage","_wasIllegal","_active","_alive"];

if (_alive isEqualTo 0) exitWith {
    [1,"STR_Garage_SQLError_Destroyed",true,[_className]] remoteExecCall ["life_fnc_broadcast",_unit];
};

if (_active isEqualTo 1) exitWith {
    [1,"STR_Garage_SQLError_Active",true,[_className]] remoteExecCall ["life_fnc_broadcast",_unit];
};

private _nearVehicles = nearestObjects[_spawnPoint,["Car","Air","Ship"],6]; //last check for nearby vehicles

if !(_nearVehicles isEqualTo []) exitWith {
    [_price] remoteExecCall ["life_fnc_garageRefund",_unit];
};

_query = format ["updateVehicle:%1:%2", _pid, _vid];
[_query, 1] call DB_fnc_asyncCall;

private _vehicle = createVehicle [_className,getMarkerPos _spawnPoint,[],0];
if (_dir isEqualTo -1) then {
    _dir = markerDir _spawnPoint;
};
_vehicle setDir _dir;

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;
_vehicle lock 2;
_vehicle disableTIEquipment true;

[_vehicle,_color] call life_fnc_colorVehicle;
[_vehicle] call life_fnc_clearVehicleAmmo;

_vehicle setVariable ["trunk_in_use",false,true];
_vehicle setVariable ["vehicle_info_owners",[[_pid,name _unit]],true];
_vehicle setPlateNumber _plate;
_vehicle setVariable ["plate", _plate, true]; //'Air' don't work properly for setPlateNumber
_vehicle setVariable ["vehID",_vid];

switch _side do {
    case west: {
        if (_className in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","B_Heli_Light_01_F","B_Heli_Transport_01_F"]) then {
            [_vehicle,"cop_offroad",true] call TON_fnc_vehicleAnimate;
        };
    };
    case civilian: {
        if (_className isEqualTo "B_Heli_Light_01_F" && !(_color isEqualTo "Digi Green")) then {
            [_vehicle,"civ_littlebird",true] call TON_fnc_vehicleAnimate;
        };
    };
    case independent: {
        if (_className isEqualTo "C_Offroad_01_F") then {
            [_vehicle,"med_offroad",true] call TON_fnc_vehicleAnimate;
        };
    };
};

[_pid,_side,_vehicle,1] call TON_fnc_keyManagement;
[_vehicle] remoteExecCall ["life_fnc_addVehicle2Chain",_unit];

if (LIFE_SETTINGS(getNumber,"save_vehicle_virtualItems") isEqualTo 1) then {
    _vehicle setVariable ["Trunk",_trunk,true];

    if (_wasIllegal isEqualTo 1) then {
        private _refPoint = getMarkerPos _spawnPoint;

        private _distance = 100000;
        private "_location";

        {
            private _tempLocation = nearestLocation [_refPoint, _x];
            private _tempDistance = _refPoint distance _tempLocation;

            if (_tempDistance < _distance) then {
                _location = _tempLocation;
                _distance = _tempDistance;
            };
            false

        } count ["NameCityCapital", "NameCity", "NameVillage"];

        _location = text _location;
        [1, "STR_NOTF_BlackListedVehicle", true, [_location, _name]] remoteExecCall ["life_fnc_broadcast", west];

        _query = format ["updateVehicleBlacklist:%1:%2", _vid, _pid];
        [_query, 1] call DB_fnc_asyncCall;
    };
} else {
    _vehicle setVariable ["Trunk", [[], 0], true];
};

if (LIFE_SETTINGS(getNumber,"save_vehicle_fuel") isEqualTo 1) then {
    _vehicle setFuel _fuel;
} else {
    _vehicle setFuel 1;
};

if (!(_gear isEqualTo []) && (LIFE_SETTINGS(getNumber,"save_vehicle_inventory") isEqualTo 1)) then {
    _gear params ["_items","_mags","_weapons","_backpacks"];

    for "_i" from 0 to ((count (_items select 0)) - 1) do {
        _vehicle addItemCargoGlobal [((_items select 0) select _i), ((_items select 1) select _i)];
    };
    for "_i" from 0 to ((count (_mags select 0)) - 1) do {
        _vehicle addMagazineCargoGlobal [((_mags select 0) select _i), ((_mags select 1) select _i)];
    };
    for "_i" from 0 to ((count (_weapons select 0)) - 1) do {
        _vehicle addWeaponCargoGlobal [((_weapons select 0) select _i), ((_weapons select 1) select _i)];
    };
    for "_i" from 0 to ((count (_backpacks select 0)) - 1) do {
        _vehicle addBackpackCargoGlobal [((_backpacks select 0) select _i), ((_backpacks select 1) select _i)];
    };
};

if (!(_damage isEqualTo []) && (LIFE_SETTINGS(getNumber,"save_vehicle_damage") isEqualTo 1)) then {
    private _parts = getAllHitPointsDamage _vehicle;

    for "_i" from 0 to ((count _damage) - 1) do {
        _vehicle setHitPointDamage [format ["%1",((_parts select 0) select _i)],_damage select _i];
    };
};

[1,"STR_Garage_spawn_Success",true] remoteExecCall ["life_fnc_broadcast",_unit];
