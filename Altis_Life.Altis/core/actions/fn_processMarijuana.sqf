/*
	File: fn_processMarijuana.sqf
	
	Description:
	Processes it, needs to be redone.
*/
private["_amount"];
_amount = life_inv_cannabis;
if(life_inv_cannabis <= 0) exitWith {};

if(([false,"cannabis",_amount] call life_fnc_handleInv)) then
{
	titleText["Processing Cannabis...","PLAIN"];
	titleFadeOut 9.5;
	sleep 10;
	if(([true,"marijuana",_amount] call life_fnc_handleInv)) then
	{
		titleText[format["You have processed %1 Cannabis into %1 Marijuana.",_amount],"PLAIN"];
	};
};