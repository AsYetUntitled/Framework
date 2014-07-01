/*
	File: fn_dropFishingNet.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Drops a virtual fishing net from the boat.
*/
private["_fish","_type","_typeName"];
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
			case ((typeOf _x) == "Salema_F"): {_typeName = localize "STR_ANIM_Salema"; _type = "salema";};
			case ((typeOf _x) == "Ornate_random_F") : {_typeName = localize "STR_ANIM_Ornate"; _type = "ornate";};
			case ((typeOf _x) == "Mackerel_F") : {_typeName = localize "STR_ANIM_Mackerel"; _type = "mackerel";};
			case ((typeOf _x) == "Tuna_F") : {_typeName = localize "STR_ANIM_Tuna"; _type = "tuna";};
			case ((typeOf _x) == "Mullet_F") : {_typeName = localize "STR_ANIM_Mullet"; _type = "mullet";};
			case ((typeOf _x) == "CatShark_F") : {_typeName = localize "STR_ANIM_Catshark"; _type = "catshark";};
			default {_type = "";};
		};
		
		sleep 3;
		
		if(([true,_type,1] call life_fnc_handleInv)) then
		{
			deleteVehicle _x;
			titleText[format[(localize "STR_NOTF_Fishing"),_typeName],"PLAIN"];
		};
	};
} foreach (_fish);

sleep 1.5;
titleText[localize "STR_NOTF_NetUp","PLAIN"];
life_net_dropped = false;