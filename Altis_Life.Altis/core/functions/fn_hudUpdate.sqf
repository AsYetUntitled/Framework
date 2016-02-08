#include "..\..\script_macros.hpp"
/*
	File: fn_hudUpdate.sqf
	Author: Daniel Stuart

	Description:
	Updates the HUD when it needs to.
*/
disableSerialization;

if(isNull LIFEdisplay) then {[] call life_fnc_hudSetup;};
LIFEctrl(2200) progressSetPosition (1 / (100 / life_hunger));
LIFEctrl(2201) progressSetPosition (1 - (damage player));
LIFEctrl(2202) progressSetPosition (1 / (100 / life_thirst));
