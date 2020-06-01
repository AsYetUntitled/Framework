#include "..\..\script_macros.hpp"
/*
    File: fn_adminCompensate.sqf
    Author: ColinM9991

    Description:
    Gives compensation money to the local player
*/

if (FETCH_CONST(life_adminlevel) < 2) exitWith {
    closeDialog 0;
    hint localize "STR_ANOTF_ErrorLevel";
};

private _value = parseNumber(ctrlText 9922);

if (_value < 0) exitWith {};
if (_value > 999999) exitWith {
    hint localize "STR_ANOTF_Fail"
};

private _action = [
    format [localize "STR_ANOTF_CompWarn",[_value] call life_fnc_numberText],
    localize "STR_Admin_Compensate",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
    CASH = CASH + _value;
    hint format [localize "STR_ANOTF_Success",[_value] call life_fnc_numberText];
} else {
    hint localize "STR_NOTF_ActionCancel";
};

closeDialog 0;
