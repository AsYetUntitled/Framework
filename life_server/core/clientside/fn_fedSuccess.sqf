/*
	File: fn_fedSuccess.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Ugh coming up with a name for it was stupid but whatever.
	If the robbery was successful on the Federal reserve then punish
	everyone and take some money.

	Support for Bank Insurance is there.
*/
private["_funds"];
_funds = [_this,0,-1,[0]] call BIS_fnc_param;
if(_funds == -1) exitWith {};
if(!life_use_atm) exitWith {};
sleep 45;

if(_funds > life_atmcash) then
{
	hint "Due to the robbery on the Federal Reserve you have lost a percentage of your money but you have went bankrupt.\n\nNext time buy some banking insurance on your next visit to a ATM to better protect your assets!";
	life_atmcash = 0;
}
	else
{
	if(life_has_insurance) then
	{
		hint "The recent robbery on the Federal reserve has hit civilians where it hurts the most but thankfully you have banking insurance so you didn't lose a penny!\n\nHowever you have lost your banking insurance! Be sure to visit a ATM to renew your plan!";
		life_has_insurance = false;
	}
		else
	{
		hint format["Due to the recent robbery on the Federal Reserve you have lost $%1 from your bank account, next time buy some banking insurance!\n\nYou can buy banking insurance from a ATM!",[_funds] call life_fnc_numberText];
		life_atmcash = life_atmcash - _funds;
	};
};