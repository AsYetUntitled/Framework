/*
	File: fn_processOil.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Processes it, will be overhauled with fuel system implementation.
*/
private["_amount"];
_target = _this select 0;
_amount = life_inv_oilu;
if(life_inv_oilu <= 0) exitWith {};

if(([false,"oilu",_amount] call life_fnc_handleInv)) then
{
	titleText["Processing Oil...","PLAIN"];
	titleFadeOut 15;
	sleep 15;
	if(player distance _target > 5) exitWith {hint "You need to be next to the oil processing guy to process oil.";[true,"oilu",_amount] call life_fnc_handleInv;};
	if(([true,"oilp",_amount] call life_fnc_handleInv)) then
	{
		titleText[format["You have processed %1 oil.",_amount],"PLAIN"];
	};
};