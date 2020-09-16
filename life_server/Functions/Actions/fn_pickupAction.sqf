#include "\life_server\script_macros.hpp"
/*
    File: fn_pickupAction.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Validates that the cash is not a lie
*/
private _target = param [0, objNull, [objNull]];

if (!isRemoteExecuted) exitWith {};
if (isNull _obj) exitWith {};
private _item = _target getVariable "item";
if (isNil "_item") exitWith {};

if !(_obj getVariable ["inUse",false]) exitWith {
    _target setVariable ["inUse",true,true];

    if (_target getVariable "item" select 0 isEqualTo "cash") then {
        _target remoteExecCall ["life_fnc_pickupMoney", remoteExecutedOwner];
    } else {
        _target remoteExecCall ["life_fnc_pickupItem", remoteExecutedOwner];
    };
};
