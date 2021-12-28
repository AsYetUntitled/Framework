#include "..\..\script_macros.hpp"
/*
    File: fn_storeVehicle.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Stores the vehicle in the garage.
*/
params [
    ["_garage",objNull,[objNull]],
    ["_unit",objNull,[objNull]]
];

private _vehicle = objNull;
if !(isNull objectParent player) then {
    _vehicle = vehicle player;
} else {
    private _nearVehicles = nearestObjects[getPos _garage,["Car","Air","Ship"],30]; //Fetch vehicles within 30m.
    if !(_nearVehicles isEqualTo []) then {
        {
            if (!isNull _vehicle) exitWith {}; //Kill the loop.
            private _vehData = _x getVariable ["vehicle_info_owners",[]];
            if !(_vehData isEqualTo []) then {
                (_vehData select 0) params ["_ownerUID"];
                if ((getPlayerUID player) isEqualTo _ownerUID) exitWith {
                    _vehicle = _x;
                };
            };
        } forEach _nearVehicles;
    };
};

if (isNull _vehicle) exitWith {
    hint localize "STR_Garage_NoNPC"
};
if !(alive _vehicle) exitWith {
    hint localize "STR_Garage_SQLError_Destroyed"
};

if (life_HC_isActive) then {
    [_vehicle,false,_unit] remoteExecCall ["HC_fnc_vehicleStore",HC_Life];
} else {
    [_vehicle,false,_unit] remoteExecCall ["TON_fnc_vehicleStore",RSERV];
};

hint localize "STR_Garage_Store_Server";
life_garage_store = true;
