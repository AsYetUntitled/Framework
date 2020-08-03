#include "..\..\script_macros.hpp"
/*
    File: fn_gangWithdraw.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Withdraws money from the gang bank.
*/
params [
    ["_deposit",false,[false]]
];

private _value = parseNumber(ctrlText 2702);
private _gFund = GANG_FUNDS;
if ((time - life_action_delay) < 0.5) exitWith {hint localize "STR_NOTF_ActionDelay"};

//Series of stupid checks
if (isNil {(group player) getVariable "gang_name"}) exitWith {hint localize "STR_ATM_NotInGang"}; // Checks if player isn't in a gang
if (_value > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if (_value < 1) exitWith {};
if (!([str(_value)] call life_util_fnc_isNumber)) exitWith {hint localize "STR_ATM_notnumeric"};
if (_deposit && _value > CASH) exitWith {hint localize "STR_ATM_NotEnoughCash"};
if (!_deposit && _value > _gFund) exitWith {hint localize "STR_ATM_NotEnoughFundsG"};

if (_deposit) then {
    CASH = CASH - _value;
    [] call life_fnc_atmMenu;
};

if (life_HC_isActive) then {
    [1,group player,_deposit,_value,player,CASH] remoteExecCall ["HC_fnc_updateGang",HC_Life]; //Update the database.
} else {
    [1,group player,_deposit,_value,player,CASH] remoteExecCall ["TON_fnc_updateGang",RSERV]; //Update the database.
};

life_action_delay = time;