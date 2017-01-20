#include "..\..\script_macros.hpp"
/*
    File: fn_bankDeposit.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Figure it out.
*/
private "_value";
_value = ctrlText 2702;
if (!([_value] call life_fnc_isNumber)) exitWith {hint localize "STR_ATM_notnumeric"};
_value = parseNumber(_value);

//Series of stupid checks
if (_value > (LIFE_SETTINGS(getNumber,"maxvalue_ATM"))) exitWith {hint format [localize "STR_ATM_GreaterThan",[LIFE_SETTINGS(getNumber,"maxvalue_ATM")] call life_fnc_numberText];};
if (_value < 1) exitWith {};
if (_value > CASH) exitWith {hint localize "STR_ATM_NotEnoughCash"};

CASH = CASH - _value;
BANK = BANK + _value;

hint format [localize "STR_ATM_DepositSuccess",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;

if (LIFE_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        money_log = format [localize "STR_DL_ML_depositedBank_BEF",_value,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    } else {
        money_log = format [localize "STR_DL_ML_depositedBank",profileName,(getPlayerUID player),_value,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    };
    publicVariableServer "money_log";
};
