#include "..\..\script_macros.hpp"
/*
	File: fn_gangWithdraw.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Withdraws money from the gang bank.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);
sleep (random 1.5);
_gFund = GANG_FUNDS;

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > _gFund) exitWith {hint localize "STR_ATM_NotEnoughFundsG"};
if(_val < 100 && _gFund > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

SUB(_gFund,_value);
ADD(CASH,_value);
grpPlayer setVariable ["gang_bank",_gFund,true];

if(life_HC_isActive) then {
	[1,grpPlayer] remoteExec ["HC_fnc_updateGang",HC_Life]; //Update the database.
} else {
	[1,grpPlayer] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
};


hint format [localize "STR_ATM_WithdrawSuccessG",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;
