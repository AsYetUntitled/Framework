#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Deposits money into the players gang bank.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);
_gFund = grpPlayer getVariable ["gang_bank",0];

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > _gFund) exitWith {hint localize "STR_ATM_NotEnoughFundsG"};
if(_val < 100 && _gFund > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

SUB(_gFund,_value);
ADD(CASH,_value);
grpPlayer setVariable ["gang_bank",_gFund,true];

hint format [localize "STR_ATM_WithdrawSuccessG",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;
[1,grpPlayer] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
