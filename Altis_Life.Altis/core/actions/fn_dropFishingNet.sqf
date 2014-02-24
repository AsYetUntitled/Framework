/*
	File: fn_dropFishingNet.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Drops a virtual fishing net from the boat.
*/
private["_fish","_type"];
if(!(vehicle player isKindOf "Ship")) exitWith {};
_fish = (nearestObjects[getPos vehicle player,["Fish_Base_F"],20]);
life_net_dropped = true;
titleText[localize "STR_NOTF_NetDrop","PLAIN"];
sleep 5;
if(count _fish == 0) exitWith {titleText[localize "STR_NOTF_NetDropFail","PLAIN"]; life_net_dropped = false;};
{
	if(_x isKindOf "Fish_Base_F") then
	{
		switch(true) do
		{
			case ((typeOf _x) == "Salema_F"): {_type = localize "STR_ANIM_Salema"};
			case ((typeOf _x) == "Ornate_random_F") : {_type = localize "STR_ANIM_Ornate"};
			case ((typeOf _x) == "Mackerel_F") : {_type = localize "STR_ANIM_Mackerel"};
			case ((typeOf _x) == "Tuna_F") : {_type = localize "STR_ANIM_Tuna"};
			case ((typeOf _x) == "Mullet_F") : {_type = localize "STR_ANIM_Mullet"};
			case ((typeOf _x) == "CatShark_F") : {_type = localize "STR_ANIM_Catshark"};
			default {_type = ""};
		};
		
		sleep 3;
		
		if(([true,_type,1] call life_fnc_handleInv)) then
		{
			deleteVehicle _x;
			titleText[format["You caught a %1",_type],"PLAIN"];
		};
	};
} foreach (_fish);

sleep 1.5;
titleText[localize "STR_NOTF_NetUp","PLAIN"];
life_net_dropped = false;