#include "\life_hc\hc_macros.hpp"
/*
    File: fn_chopShopSell.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Checks whether or not the vehicle is persistent or temp and sells it.
*/
private ["_unit","_vehicle","_price","_cash","_ownerUnit"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_vehicle = [_this,1,objNull,[objNull]] call BIS_fnc_param;
_price = [_this,2,500,[0]] call BIS_fnc_param;
_cash = [_this,3,0,[0]] call BIS_fnc_param;

_ownerUnit = _unit getVariable "life_clientID";

//Error checks
if (isNull _vehicle || isNull _unit) exitWith  {
    life_action_inUse = false;
    _ownerUnit publicVariableClient "life_action_inUse";
};

_displayName = FETCH_CONFIG2(getText,"CfgVehicles",typeOf _vehicle, "displayName");

_dbInfo = _vehicle getVariable ["dbInfo",[]];
if (count _dbInfo > 0) then {
    _uid = (_dbInfo select 0);
    _plate = (_dbInfo select 1);

    _query = format ["UPDATE vehicles SET alive='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];

    _sql = [_query,1] call HC_fnc_asyncCall;
};

deleteVehicle _vehicle;
life_action_inUse = false;
_ownerUnit publicVariableClient "life_action_inUse";
CASH = _cash;
_ownerUnit publicVariableClient "life_cash";
[2,"STR_NOTF_ChopSoldCar",true,[_displayName,[_price] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",_unit];