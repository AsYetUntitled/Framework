#include "..\..\script_macros.hpp"
/*
    File: fn_jailTime.sqf
    Author: Yeiij

    Description: setting jail time
*/

private ["_time"];
if (isNil "life_jailing_unit") exitWith {};
if (isNull life_jailing_unit) exitWith {};

disableSerialization;
_time = parseNumber(ctrlText 1400);
closeDialog 0;

if (!(_time isEqualType 0)) exitWith { hint localize "STR_Cop_Jail_Time_Number"; };
if (_time < 5 || _time > 60) exitWith { hint localize "STR_Cop_Jail_Time_Limits"; };

[life_jailing_unit, _time] call life_fnc_arrestAction;
