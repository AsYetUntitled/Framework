#include "\life_hc\hc_macros.hpp"
/*
    File: fn_chopShopSell.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

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
    private _query = format ["UPDATE vehicles SET alive='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];
    [_query,1] call HC_fnc_asyncCall;
};

deleteVehicle _vehicle;

[_price,_displayName] remoteExecCall ["life_fnc_chopShopSold", remoteExecutedOwner];