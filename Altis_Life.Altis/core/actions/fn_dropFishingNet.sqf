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
titleText["Dropping fishing net....","PLAIN"];
sleep 5;
if(count _fish == 0) exitWith {titleText["Didn't catch any fish...","PLAIN"]; life_net_dropped = false;};
{
	if(_x isKindOf "Fish_Base_F") then
	{
		switch(true) do
		{
			case ((typeOf _x) == "Salema_F"): {_type = "salema"};
			case ((typeOf _x) == "Ornate_random_F") : {_type = "ornate"};
			case ((typeOf _x) == "Mackerel_F") : {_type = "mackerel"};
			case ((typeOf _x) == "Tuna_F") : {_type = "tuna"};
			case ((typeOf _x) == "Mullet_F") : {_type = "mullet"};
			case ((typeOf _x) == "Catshark_F") : {_type = "catshark"};
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
titleText["Fishing net pulled up.","PLAIN"];
life_net_dropped = false;