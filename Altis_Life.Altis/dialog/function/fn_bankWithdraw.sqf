#include "..\..\script_macros.hpp"
/*
    File: fn_bankWithdraw.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Withdraws money from the players account
*/
private["_value"];
_value = parseNumber(ctrlText 2702);
if (_value > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if (_value < 0) exitWith {};
if (!([str(_value)] call TON_fnc_isnumber)) exitWith {hint localize "STR_ATM_notnumeric"};
if (_value > BANK) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if (_value < 100 && BANK > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

CASH = CASH + _value;
BANK = BANK - _value;
hint format [localize "STR_ATM_WithdrawSuccess",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;

if (LIFE_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        money_log = format ["withdrew $%1 from their bank. Bank Balance: $%2  On Hand Balance: $%3",_value,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    } else {
        money_log = format ["%1 - %2 withdrew $%3 from their bank. Bank Balance: $%4  On Hand Balance: $%5",profileName,(getPlayerUID player),_value,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    };
    publicVariableServer "money_log";
};
