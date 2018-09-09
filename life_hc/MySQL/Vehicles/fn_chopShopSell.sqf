#include "\life_hc\hc_macros.hpp"
/*
    File: fn_chopShopSell.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Checks whether or not the vehicle is persistent or temp and sells it.
*/
params [
    ["_vehicle",objNull,[objNull]],
    ["_price",500,[0]],
    ["_cash",0,[0]]
];
private _unit = remoteExecutedOwner;
if (_unit isEqualTo 0) exitWith {};

//Error checks
if (isNull _vehicle || {isNull _unit}) exitWith {
    life_action_inUse = false;
    _unit publicVariableClient "life_action_inUse";
};

private _displayName = FETCH_CONFIG2(getText,"CfgVehicles",typeOf _vehicle, "displayName");

(_vehicle getVariable ["dbInfo",[]]) params [
    ["_uid","",[""]],
    ["_plate",0,[0]]
];
if !(_uid isEqualTo "") then {
    private _query = format ["UPDATE vehicles SET alive='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];
    [_query,1] call HC_fnc_asyncCall;
};

deleteVehicle _vehicle;
life_action_inUse = false;
_unit publicVariableClient "life_action_inUse";
CASH = _cash;
_unit publicVariableClient "life_cash";
[2,"STR_NOTF_ChopSoldCar",true,[_displayName,[_price] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",_unit];
