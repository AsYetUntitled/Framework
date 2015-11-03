#include "..\..\script_macros.hpp"
/*
	File: fn_settingsMenu
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Setup the settings menu.
*/
if(isNull (findDisplay 2900)) then {
	if(!createDialog "SettingsMenu") exitWith {hint "Something went wrong, the menu won't open?"};
};

disableSerialization;

ctrlSetText[2902, format["%1", life_vdFoot]];
ctrlSetText[2912, format["%1", life_vdCar]];
ctrlSetText[2922, format["%1", life_vdAir]];

/* Set up the sliders */
{
	slidersetRange [SEL(_x,0),100,12000];
	CONTROL(2900,SEL(_x,0)) sliderSetSpeed [100,100,100];
	sliderSetPosition [SEL(_x,0),SEL(_x,1)];
} foreach [[2901,life_vdFoot],[2911,life_vdCar],[2921,life_vdAir]];

if(isNil "life_tagson") then {
	life_sidechat = true;
	life_tagson = true;
	life_revealObjects = true;
};

CONTROL(2900,2971) cbSetChecked life_sidechat;
CONTROL(2900,2970) cbSetChecked life_tagson;
CONTROL(2900,2972) cbSetChecked life_revealObjects;
