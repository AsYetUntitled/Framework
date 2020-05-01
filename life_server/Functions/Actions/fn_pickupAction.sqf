#include "\life_server\script_macros.hpp"
/*
    File: fn_pickupAction.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Validates that the cash is not a lie
*/
private _target = param [0, objNull, [objNull]];

if (!isRemoteExecuted) exitWith { ["Not remote executed"] call BIS_fnc_error };
if (isNull _obj) exitWith { ["Target object is NULL"] call BIS_fnc_error };

if (!(_obj getVariable ["inUse",false])) exitWith {
    _obj setVariable ["inUse",true,true];

    if (_target getVariable "item" select 0 isEqualTo "cash") then {
        _obj remoteExecCall ["life_fnc_pickupMoney", remoteExecutedOwner];
    } else {
        _obj remoteExecCall ["life_fnc_pickupItem", remoteExecutedOwner];
    };
} else {
    [ "Attempt to pick up money twice!" ] call BIS_fnc_error;
};
