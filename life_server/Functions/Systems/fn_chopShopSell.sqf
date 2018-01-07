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
    ["_price",500,[0]],
    ["_cash",0,[0]]
];

//Error checks
if (isNull _vehicle || {isNull _unit}) exitWith {
    life_action_inUse = false;
    owner _unit publicVariableClient "life_action_inUse";
};

private _displayName = FETCH_CONFIG2(getText,"CfgVehicles",typeOf _vehicle, "displayName");
_unit = owner _unit;

private _dbInfo = _vehicle getVariable ["dbInfo",[]];
if !(_dbInfo isEqualTo []) then {
    _dbInfo params ["_uid", "_plate"];

    private _query = format ["UPDATE vehicles SET alive='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];

    [_query,1] call DB_fnc_asyncCall;
};

deleteVehicle _vehicle;
life_action_inUse = false;
_unit publicVariableClient "life_action_inUse";
CASH = _cash;
_unit publicVariableClient "life_cash";
[2,"STR_NOTF_ChopSoldCar",true,[_displayName,[_price] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",_unit];
