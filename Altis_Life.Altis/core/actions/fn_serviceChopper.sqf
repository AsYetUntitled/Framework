#include "..\..\script_macros.hpp"
/*
    File: fn_serviceChopper.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main functionality for the chopper service paid, to be replaced in later version.
*/

disableSerialization;

if (life_action_inUse) exitWith {hint localize "STR_NOTF_Action"};

private _serviceCost = LIFE_SETTINGS(getNumber,"service_chopper");
private _search = nearestObjects [getPos air_sp, ["Air"], 10];

if (_search isEqualTo []) exitWith {
    hint localize "STR_Service_Chopper_NoAir"
};
if (CASH < _serviceCost) exitWith {
    hint format [localize "STR_Service_Chopper_NotEnough", _serviceCost];
};

life_action_inUse = true;
"progressBar" cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable "life_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format [localize "STR_Service_Chopper_Servicing","waiting..."];
_progress progressSetPosition 0.01;
private _cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    uiSleep  0.2;
    _cP = _cP + 0.01;
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format [localize "STR_Service_Chopper_Servicing",round(_cP * 100)];
    if (_cP >= 1) exitWith {};
};

_search params ["_nearestChopper"];

if (!alive _nearestChopper || {_nearestChopper distance air_sp > 15}) exitWith {
    life_action_inUse = false;
    hint localize "STR_Service_Chopper_Missing"
};

CASH = CASH - _serviceCost;
if (!local _nearestChopper) then {
    [_nearestChopper,1] remoteExecCall ["life_fnc_setFuel",_nearestChopper];
} else {
    _nearestChopper setFuel 1;
};

_nearestChopper setDamage 0;

"progressBar" cutText ["","PLAIN"];
titleText [localize "STR_Service_Chopper_Done","PLAIN"];
life_action_inUse = false;
