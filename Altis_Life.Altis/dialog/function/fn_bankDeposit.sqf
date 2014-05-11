/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_AIM_notnumeric"};
if(_value > life_cash) exitWith {hint "You do not have that much cash on you."};

life_cash = life_cash - _value;
life_atmcash = life_atmcash + _value;

hint format["You have deposited $%1 into your bank account",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[] call SOCK_fnc_updateRequest; //Silent Sync