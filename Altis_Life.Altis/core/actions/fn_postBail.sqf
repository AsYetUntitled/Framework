/*
	File: fn_postBail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when the player attempts to post bail.
	Needs to be revised.
*/
private["_unit"];
_unit = _this select 1;
if(life_bail_paid) exitWith {};
if(isNil {life_bail_amount}) then {life_bail_amount = 3500;};
if(!isNil "life_canpay_bail") exitWith {hint "You must wait at least 3 minutes in jail before paying a bail."};
if(life_atmcash < life_bail_amount) exitWith {hint format["You do not have $%1 in your bank account to pay bail.",life_bail_amount];};

life_atmcash = life_atmcash - life_bail_amount;
life_bail_paid = true;
[[0,format["%1 has posted bail!", name _unit]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;