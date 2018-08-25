#include "..\..\script_macros.hpp"
/*
    File: fn_inventoryClosed.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : NiiRoZz

    Description:
    1 : Used for syncing house container data but when the inventory menu
    is closed a sync request is sent off to the server.
    2 : Used for syncing vehicle inventory when save vehicle gear are activated
*/
params [
    "",
    ["_container", objNull, [objNull]]
];
if (isNull _container) exitWith {};

if ((typeOf _container) in ["Box_IND_Grenades_F", "B_supplyCrate_F"]) exitWith {
    if (life_HC_isActive) then {
        [_container] remoteExecCall ["HC_fnc_updateHouseContainers", HC_Life];
    } else {
        [_container] remoteExecCall ["TON_fnc_updateHouseContainers", RSERV];
    };

    [3] call SOCK_fnc_updatePartial;
};

if (LIFE_SETTINGS(getNumber, "save_vehicle_inventory") isEqualTo 1) exitWith {
    if (_container isKindOf "Car" || {_container isKindOf "Air"} || {_container isKindOf "Ship"}) then {
        if (life_HC_isActive) then {
            [_container, 1] remoteExecCall ["HC_fnc_vehicleUpdate", HC_Life];
        } else {
            [_container, 1] remoteExecCall ["TON_fnc_vehicleUpdate", RSERV];
        };
    };

    [3] call SOCK_fnc_updatePartial;
};
