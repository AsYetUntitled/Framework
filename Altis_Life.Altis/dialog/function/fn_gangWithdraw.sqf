#include "..\..\script_macros.hpp"
/*
    File: fn_gangWithdraw.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Withdraws money from the gang bank.
*/
private ["_value","_gFund"];
_value = ctrlText 2702;
if (!([_value] call life_fnc_isNumber)) exitWith {hint localize "STR_ATM_notnumeric"};
_value = parseNumber(_value);
group player setVariable ["gbank_in_use_by",player,true];

//Series of stupid checks
if (_value > (LIFE_SETTINGS(getNumber,"maxvalue_ATM"))) exitWith {hint format [localize "STR_ATM_WithdrawMax",[LIFE_SETTINGS(getNumber,"maxvalue_ATM")] call life_fnc_numberText];};
if (_value < 1) exitWith {};
if (_value > (GANG_FUNDS)) exitWith {hint localize "STR_ATM_NotEnoughFundsG"};
if (_val < 100 && _gFund > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.
if ((group player getVariable ["gbank_in_use_by",player]) != player) exitWith {hint localize "STR_ATM_WithdrawInUseG"}; //Check if it's in use.

_gFund = (GANG_FUNDS) - _value;
group player setVariable ["gang_bank",_gFund,true];
CASH = CASH + _value;

if (life_HC_isActive) then {
    [1,group player] remoteExec ["HC_fnc_updateGang",HC_Life]; //Update the database.
} else {
    [1,group player] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
};

hint format [localize "STR_ATM_WithdrawSuccessG",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;

if (LIFE_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        money_log = format [localize "STR_DL_ML_withdrewGang_BEF",_value,[_gFund] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    } else {
        money_log = format [localize "STR_DL_ML_withdrewGang",profileName,(getPlayerUID player),_value,[_gFund] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    };
    publicVariableServer "money_log";
};
