/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
[] spawn life_fnc_copMarkers;

if(life_blacklisted) exitWith
{
	endMission "Loser";
};

switch (true) do
{
	case (str(player) in ["Fed_1","Fed_2","Fed_3","Fed_4","Fed_5","_Fed_6"]):
	{
		if(life_adminlevel < 1)then {endMission "Loser"; } else
		{
			private["_handle"];
			//_handle = player execVM "core\client\fed_init.sqf";
			//waitUntil{scriptDone _handle};
		};
	};
	
	case (!(str(player) in ["cop_1","cop_2","cop_3","cop_4"])):
	{
		switch (true) do
		{
			case(life_coplevel > 0) : {}; // Do nothing
			case (life_adminlevel > 0) : {}; //Do nothing
			default {endMission "Loser";};
		};
	};
};

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.