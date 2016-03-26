#include "..\..\script_macros.hpp"
/*
	File: fn_adminMarkers.sqf
	Sourced from Lystics Player Markers Loop
	Author:

	Description:

*/
private["_PlayerMarkers","_FinishedLoop"];
if(FETCH_CONST(life_adminlevel) < 4) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
if (isNil "life_PlayerMarkers") then { life_PlayerMarkers = false };

if (!life_PlayerMarkers) then
{
	life_PlayerMarkers = true;
	hint "Player Markers ON";
}
	else
{
	life_PlayerMarkers = false;
	hint "Player Markers OFF";
};

setGroupIconsVisible [true, false]; // Refer to https://community.bistudio.com/wiki/setGroupIconsVisible
while {life_PlayerMarkers} do
{
	{
		if (isPlayer _x && _x != player) then
		{
			private ["_groupIcon", "_iconColor"];
			switch (side _x) do
			{
				case BLUFOR:      { _groupIcon = "b_inf"; _iconColor = [0, 0, 1, 1] };
				case OPFOR:       { _groupIcon = "o_inf"; _iconColor = [1, 0, 0, 1] };
				case INDEPENDENT: { _groupIcon = "n_inf"; _iconColor = [1, 1, 0, 1] };
				default           { _groupIcon = "c_unknown"; _iconColor = [1, 1, 1, 1] };
			};
			clearGroupIcons group _x;
			group _x addGroupIcon [_groupIcon];
			group _x setGroupIconParams [_iconColor, format ["%1", name _x], 1, true];
		};
	} forEach playableUnits;
	sleep 0.5;
};
{ clearGroupIcons group _x } forEach playableUnits;
