/*
	File: fn_gatherCocaine.sqf
	
	Description:
	Gathers cocaine?
*/
private["_sum"];
_sum = ["cocaine",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_in_use = true;
	titleText["Gathering Cocaine...","PLAIN"];
	titleFadeOut 5;
	sleep 5;
	if(([true,"cocaine",1] call life_fnc_handleInv)) then
	{
		titleText["You have collected some Cocaine.","PLAIN"];
	};
};

life_action_in_use = false;