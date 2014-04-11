/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
if(hmd player != "") then {
	player unlinkItem (hmd player);
};