#include "..\..\script_macros.hpp"
/*
    File: fn_storeVehicle.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Stores the vehicle in the garage.
*/
private ["_nearVehicles","_vehicle","_room","_vehiclesLimit","_exit"];
if (vehicle player != player) then {
    _vehicle = vehicle player;
} else {
    _nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air","Ship"],30]; //Fetch vehicles within 30m.
    if (count _nearVehicles > 0) then {
        {
            if (!isNil "_vehicle") exitWith {}; //Kill the loop.
            _vehData = _x getVariable ["vehicle_info_owners",[]];
            if (count _vehData  > 0) then {
                _vehOwner = ((_vehData select 0) select 0);
                if ((getPlayerUID player) == _vehOwner) exitWith {
                    _vehicle = _x;
                };
            };
        } forEach _nearVehicles;
    };
};

if (isNil "_vehicle") exitWith {hint localize "STR_Garage_NoNPC"};
if (isNull _vehicle) exitWith {};
if (!alive _vehicle) exitWith {hint localize "STR_Garage_SQLError_Destroyed"};
if (!(isNil "counts")) then {
private ["_sel"];
_type = [_vehicle] call life_fnc_vehicleKind;
switch (_type) do {
case "Air" : {_sel = 0;};
case "Car" : {_sel = 1;};
case "Ship" : {_sel = 2;};
};
_count = counts select _sel;
switch (playerSide) do {
    case east : { _vehiclesLimit = LIFE_SETTINGS(getNumber,"garage_limit_OPFOR"); };
    case west : { _vehiclesLimit = LIFE_SETTINGS(getNumber,"garage_limit_COP"); };
    case civilian : { _vehiclesLimit = LIFE_SETTINGS(getNumber,"garage_limit_CIVILIAN"); };
    case independent : {_vehiclesLimit = LIFE_SETTINGS(getNumber,"garage_limit_MEDIC"); };
};
_room = ((_count <= _vehiclesLimit) OR (isNil "counts"));
if (!_room) then { _exit = true };
};

if (!isNil "_exit") exitWith {hint format [localize "STR_NOTF_TooManyVehicles",_vehiclesLimit]};
_storetext = localize "STR_Garage_Store_Success";

if (life_HC_isActive) then {
    [_vehicle,false,(_this select 1),_storetext] remoteExec ["HC_fnc_vehicleStore",HC_Life];
} else {
    [_vehicle,false,(_this select 1),_storetext] remoteExec ["TON_fnc_vehicleStore",RSERV];
};

hint localize "STR_Garage_Store_Server";
life_garage_store = true;
