#include "\life_hc\hc_macros.hpp"
/*
    File: fn_chopShopSell.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Checks whether or not the vehicle is persistent or temp and sells it.
*/

params [
    ["_unit", objNull, [objNull]],
    ["_vehicle", objNull, [objNull]],
    ["_price", 500, [0]],
    ["_cash", 0, [0]]
];

_ownerUnit = _ownerUnit getVariable "life_clientID";

//Error checks
if (isNull _vehicle || {isNull _unit}) exitWith  {
    life_action_inUse = false;
    _ownerUnit publicVariableClient "life_action_inUse";
};

_displayName = FETCH_CONFIG2(getText, "CfgVehicles", typeOf _vehicle, "displayName");

_dbInfo = _vehicle getVariable ["dbInfo", []];
if !(_dbInfo isEqualTo []) then {
    _uid = (_dbInfo select 0);
    _plate = (_dbInfo select 1);

    _query = format ["deleteVehicle:%1:%2", _uid, _plate];
    _sql = [_query, 1] call HC_fnc_asyncCall;
};

deleteVehicle _vehicle;
life_action_inUse = false;
_ownerUnit publicVariableClient "life_action_inUse";
CASH = _cash;
_ownerUnit publicVariableClient "life_cash";
[2, "STR_NOTF_ChopSoldCar", true, [_displayName, [_price] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast", _unit];


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
    private _query = format ["deleteVehicle:%1:%2", _uid, _plate];
    [_query,1] call HC_fnc_asyncCall;
};

deleteVehicle _vehicle;

[_price,_displayName] remoteExecCall ["life_fnc_chopShopSold", remoteExecutedOwner];
