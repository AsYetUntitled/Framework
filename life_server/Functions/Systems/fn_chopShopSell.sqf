#include "\life_server\script_macros.hpp"
/*
    File: fn_chopShopSell.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Checks whether or not the vehicle is persistent or temp and sells it.
*/
params [
    ["_unit",objNull,[objNull]],
    ["_vehicle",objNull,[objNull]],
    ["_price",500,[0]]
];

//Error checks
if (isNull _vehicle || isNull _unit) exitWith  {
    [] remoteExecCall ["life_fnc_chopShopSold", remoteExecutedOwner];
};

private _displayName = FETCH_CONFIG2(getText,"CfgVehicles",typeOf _vehicle, "displayName");

private _dbInfo = _vehicle getVariable ["dbInfo",[]];
if (count _dbInfo > 0) then {
    _dbInfo params ["_uid","_plate"];
    _query = format ["deleteVehicle:%1:%2", _uid, _plate];
    [_query,1] call DB_fnc_asyncCall;
};

deleteVehicle _vehicle;

[_price,_displayName] remoteExecCall ["life_fnc_chopShopSold", remoteExecutedOwner];