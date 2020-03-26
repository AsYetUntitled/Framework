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
if (isNull objectParent player) then {
    private _nearVehicles = nearestObjects[getPos _garage,["Car","Air","Ship"],30]; //Fetch vehicles within 30m.
    if !(_nearVehicles isEqualTo []) then {
        {
            _vehData = _x getVariable ["vehicle_info_owners",[]];
            if !(_vehData  isEqualTo []) then {
                _vehOwner = ((_vehData select 0) select 0);
                if ((getPlayerUID player) == _vehOwner) exitWith {
                    _vehicle = _x;
                };
            };
        } forEach _nearVehicles;
    };
};

if (isNull _vehicle) exitWith {hint localize "STR_Garage_NoNPC"};
if (!alive _vehicle) exitWith {hint localize "STR_Garage_SQLError_Destroyed"};

if (life_HC_isActive) then {
    [_vehicle,false,_unit] remoteExec ["HC_fnc_vehicleStore",HC_Life];
} else {
    [_vehicle,false,_unit] remoteExec ["TON_fnc_vehicleStore",RSERV];
};

hint localize "STR_Garage_Store_Server";
life_garage_store = true;
