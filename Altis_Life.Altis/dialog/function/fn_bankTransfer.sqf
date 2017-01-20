#include "..\..\script_macros.hpp"
/*
    File: fn_bankTransfer.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Figure it out again.
*/
private ["_value","_unit","_tax"];
_value = ctrlText 2702;
if (!([_value] call life_fnc_isNumber)) exitWith {hint localize "STR_ATM_notnumeric"};
_value = parseNumber(_value);
if ((lbCurSel 2703) isEqualTo -1) exitWith {hint localize "STR_ATM_NoneSelected"};
_unit = call compile format ["%1",(lbData[2703,(lbCurSel 2703)])];

//Series of stupid checks
if (isNil "_unit" || {isNull _unit}) exitWith {hint localize "STR_ATM_DoesntExist"};
if (_value > (LIFE_SETTINGS(getNumber,"maxvalue_ATM"))) exitWith {hint format [localize "STR_ATM_TransferMax",[LIFE_SETTINGS(getNumber,"maxvalue_ATM")] call life_fnc_numberText];};
if (_value < 1) exitWith {};
if (_value > BANK) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
_tax = _value * LIFE_SETTINGS(getNumber,"bank_transferTax");
if ((_value + _tax) > BANK) exitWith {hint format [localize "STR_ATM_SentMoneyFail",_value,_tax]};

BANK = BANK - (_value + _tax);
[_value,profileName] remoteExecCall ["life_fnc_wireTransfer",_unit];
[] call life_fnc_atmMenu;
[1] call SOCK_fnc_updatePartial;
hint format [localize "STR_ATM_SentMoneySuccess",[_value] call life_fnc_numberText,_unit getVariable ["realname",name _unit],[_tax] call life_fnc_numberText];


if (LIFE_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        money_log = format [localize "STR_DL_ML_transferredBank_BEF",_value,_unit getVariable ["realname",name _unit],[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    } else {
        money_log = format [localize "STR_DL_ML_transferredBank",profileName,(getPlayerUID player),_value,_unit getVariable ["realname",name _unit],[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    };
    publicVariableServer "money_log";
};
