#include "\life_server\script_macros.hpp"
/*
    File: fn_spawnVehicle.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sends the query request to the database, if an array is returned then it creates
    the vehicle if it's not in use or dead.
*/
params [
    ["_vid", -1, [0]],
    ["_pid", "", [""]],
    ["_sp", [], [[],""]],
    ["_unit", objNull, [objNull]],
    ["_price", 0, [0]],
    ["_dir", 0, [0]],
    ["_spawntext","",[""]]
];

private _unit_return = _unit;
private _name = name _unit;
private _side = side _unit;
_unit = owner _unit;

if (_vid isEqualTo -1 || {_pid isEqualTo ""}) exitWith {};
if (_vid in serv_sv_use) exitWith {};
serv_sv_use pushBack _vid;

private _servIndex = serv_sv_use find _vid;

private _query = format ["SELECT id, side, classname, type, pid, alive, active, plate, color, inventory, gear, fuel, damage, blacklist FROM vehicles WHERE id='%1' AND pid='%2'",_vid,_pid];

private _tickTime = diag_tickTime;
private _queryResult = [_query,2] call DB_fnc_asyncCall;

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Client Query Request -------------";
    diag_log format ["QUERY: %1",_query];
    diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
    diag_log format ["Result: %1",_queryResult];
    diag_log "------------------------------------------------";
};

if (_queryResult isEqualType "") exitWith {};

if (isNil "_queryResult") exitWith {serv_sv_use deleteAt _servIndex;};
if (count _queryResult isEqualTo 0) exitWith {serv_sv_use deleteAt _servIndex;};
_queryResult params ["_id", "_carSide", "_className", "_type", "_pid", "_alive", "_active","_plate", "_color", "_inventory", "_gear", "_fuel", "_damage", "_blacklist"];

if (_alive isEqualTo 0) exitWith {
    serv_sv_use deleteAt _servIndex;
    [1,"STR_Garage_SQLError_Destroyed",true,[_className]] remoteExecCall ["life_fnc_broadcast",_unit];
};

if (_plate isEqualTo 1) exitWith {
    serv_sv_use deleteAt _servIndex;
    [1,"STR_Garage_SQLError_Active",true,[_className]] remoteExecCall ["life_fnc_broadcast",_unit];
};

private _nearVehicles = if !(_sp isEqualType "") then {
    nearestObjects[_sp,["Car","Air","Ship"],10];
} else {
    [];
};

if (count _nearVehicles > 0) exitWith {
    serv_sv_use deleteAt _servIndex;
    [_price,_unit_return] remoteExecCall ["life_fnc_garageRefund",_unit];
    [1,"STR_Garage_SpawnPointError",true] remoteExecCall ["life_fnc_broadcast",_unit];
};

_query = format ["UPDATE vehicles SET active='1', damage='""[]""' WHERE pid='%1' AND id='%2'",_pid,_vid];

private _trunk = [_inventory] call DB_fnc_mresToArray;
private _gear = [_gear] call DB_fnc_mresToArray;
private _damage = [call compile _damage] call DB_fnc_mresToArray;
_blacklist = _blacklist isEqualTo 1;

[_query,1] call DB_fnc_asyncCall;

private "_vehicle";
if (_sp isEqualType "") then {
    _vehicle = createVehicle[_className,[0,0,999],[],0,"NONE"];
    waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
    _vehicle allowDamage false;
    _hs = nearestObjects[getMarkerPos _sp,["Land_Hospital_side2_F"],50] select 0;
    _vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
    uiSleep 0.6;
} else {
    _vehicle = createVehicle [_className,_sp,[],0,"NONE"];
    waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
    _vehicle allowDamage false;
    _vehicle setPos _sp;
    _vehicle setVectorUp (surfaceNormal _sp);
    _vehicle setDir _dir;
};
_vehicle allowDamage true;
//Send keys over the network.
[_vehicle] remoteExecCall ["life_fnc_addVehicle2Chain",_unit];
[_pid,_side,_vehicle,1] call TON_fnc_keyManagement;
_vehicle lock 2;
//Reskin the vehicle
[_vehicle,_color] remoteExecCall ["life_fnc_colorVehicle",_unit];
_vehicle setVariable ["vehicle_info_owners",[[_pid,_name]],true];
_vehicle setVariable ["dbInfo",[_pid,_plate],true];
_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
[_vehicle] call life_fnc_clearVehicleAmmo;

if (LIFE_SETTINGS(getNumber,"save_vehicle_virtualItems") isEqualTo 1) then {

    _vehicle setVariable ["Trunk",_trunk,true];
    
    if (_blacklist) then {
        private _refPoint = if (_sp isEqualType "") then {getMarkerPos _sp;} else {_sp;};
        
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
        [1,"STR_NOTF_BlackListedVehicle",true,[_location,_name]] remoteExecCall ["life_fnc_broadcast",west];

        _query = format ["UPDATE vehicles SET blacklist='0' WHERE id='%1' AND pid='%2'",_vid,_pid];
        [_query,1] call DB_fnc_asyncCall;
    };
} else {
    _vehicle setVariable ["Trunk",[[],0],true];
};

if (LIFE_SETTINGS(getNumber,"save_vehicle_fuel") isEqualTo 1) then {
    _vehicle setFuel _fuel;
} else {
    _vehicle setFuel 1;
};

if (count _gear > 0 && (LIFE_SETTINGS(getNumber,"save_vehicle_inventory") isEqualTo 1)) then {
    _gear params ["_items", "_mags", "_weapons", "_backpacks"];

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

if (count _damage > 0 && (LIFE_SETTINGS(getNumber,"save_vehicle_damage") isEqualTo 1)) then {
    _parts = getAllHitPointsDamage _vehicle;

    for "_i" from 0 to ((count _damage) - 1) do {
        _vehicle setHitPointDamage [format ["%1",((_parts select 0) select _i)],_damage select _i];
    };
};

//Sets of animations
if (_carSide isEqualTo "civ" && _className isEqualTo "B_Heli_Light_01_F" && !(_color isEqualTo 13)) then {
    [_vehicle,"civ_littlebird",true] remoteExecCall ["life_fnc_vehicleAnimate",_unit];
};

if (_carSide isEqualTo "cop" && _className in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","B_Heli_Light_01_F","B_Heli_Transport_01_F"]) then {
    [_vehicle,"cop_offroad",true] remoteExecCall ["life_fnc_vehicleAnimate",_unit];
};

if (_carSide isEqualTo "med" && _className isEqualTo "C_Offroad_01_F") then {
    [_vehicle,"med_offroad",true] remoteExecCall ["life_fnc_vehicleAnimate",_unit];
};

[1,_spawntext] remoteExecCall ["life_fnc_broadcast",_unit];
serv_sv_use deleteAt _servIndex;
