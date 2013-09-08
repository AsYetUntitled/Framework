/*
	File: fn_processHeroin.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Processes heroin, obviously needs to be revised with system changes
	to increase realism if I dare even call it that.
*/
private["_amount"];
_amount = life_inv_heroinu;
if(life_inv_heroinu <= 0) exitWith {};

if(([false,"heroinu",_amount] call life_fnc_handleInv)) then
{
	titleText["Processing Heroin...","PLAIN"];
	titleFadeOut 9.5;
	sleep 10;
	if(([true,"heroinp",_amount] call life_fnc_handleInv)) then
	{
		titleText[format["You have processed %1 heroin.",_amount],"PLAIN"];
	};
};