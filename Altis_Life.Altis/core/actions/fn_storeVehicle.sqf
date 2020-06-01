#include "..\..\script_macros.hpp"
/*
    File: fn_storeVehicle.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Stores the vehicle in the garage.
*/
params [
    ["_garage", objNull, [objNull]],
    ["_unit", objNull, [objNull]]
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
            if (count _vehData  > 0) then {
                private _vehOwner = ((_vehData select 0) select 0);
                if (getPlayerUID player isEqualTo _vehOwner) exitWith {
                    _vehicle = _x;
                };
            };
            true
        } count _nearVehicles;
    };
};

if (isNull _vehicle) exitWith {
    hint localize "STR_Garage_NoNPC"
};
if (!alive _vehicle) exitWith {
    hint localize "STR_Garage_SQLError_Destroyed"
};

private _storetext = localize "STR_Garage_Store_Success";

if (life_HC_isActive) then {
    [_vehicle,false,_unit,_storetext] remoteExec ["HC_fnc_vehicleStore",HC_Life];
} else {
    [_vehicle,false,_unit,_storetext] remoteExec ["TON_fnc_vehicleStore",RSERV];
};

hint localize "STR_Garage_Store_Server";
life_garage_store = true;
