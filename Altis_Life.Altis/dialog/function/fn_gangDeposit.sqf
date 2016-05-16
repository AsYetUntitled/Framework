#include "..\..\script_macros.hpp"
/*
    Author: Bryan "Tonic" Boardwine

    Description:
    Deposits money into the players gang bank.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);
group player setVariable["gbank_in_use_by",player,true];

//Series of stupid checks
if (_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if (_value < 0) exitWith {};
if (!([str(_value)] call TON_fnc_isnumber)) exitWith {hint localize "STR_ATM_notnumeric"};
if (_value > CASH) exitWith {hint localize "STR_ATM_NotEnoughCash"};
if ((group player getVariable ["gbank_in_use_by",player]) != player) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Check if it's in use.

CASH = CASH - _value;
_gFund = GANG_FUNDS;
_gFund = _gFund + _value;
group player setVariable ["gang_bank",_gFund,true];

if (life_HC_isActive) then {
    [1,group player] remoteExecCall ["HC_fnc_updateGang",HC_Life];
} else {
    [1,group player] remoteExecCall ["TON_fnc_updateGang",RSERV];
};

hint format[localize "STR_ATM_DepositSuccessG",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial; //Silent Sync

if (LIFE_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        money_log = format ["deposited $%1 into their gang bank. Gang Bank Balance: $%2  Bank Balance: $%3  On Hand Balance: $%4",_value,[_gFund] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    } else {
        money_log = format ["%1 - %2 deposited $%3 into their gang bank. Gang Bank Balance: $%4  Bank Balance: $%5  On Hand Balance: $%6",profileName,(getPlayerUID player),_value,[_gFund] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    };
    publicVariableServer "money_log";
};
