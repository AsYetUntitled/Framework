#include "..\..\script_macros.hpp"
/*
    File: fn_demoChargeTimer.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the "Demo" timer for the police.
*/

disableSerialization;

"lifeTimer" cutRsc ["life_timer","PLAIN"];

private _uiDisp = uiNamespace getVariable "life_timer";
private _timer = _uiDisp displayCtrl 38301;
private _time = LIFE_SETTINGS(getNumber,"fed_chargeTime") * 60;

for "_i" from _time to 0 step -1 do {
    if (isNull _uiDisp) then {
        "lifeTimer" cutRsc ["life_timer","PLAIN"];
        _uiDisp = uiNamespace getVariable "life_timer";
        _timer = _uiDisp displayCtrl 38301;
    };
    if !(fed_bank getVariable ["chargeplaced",false]) exitWith {};
    _timer ctrlSetText ([_i,"MM:SS"] call BIS_fnc_secondsToString);
    uiSleep 1;
};

"lifeTimer" cutText ["","PLAIN"];
