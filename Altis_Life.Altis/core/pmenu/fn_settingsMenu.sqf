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

ctrlSetText[2902, format["%1", life_settings_viewDistanceFoot]];
ctrlSetText[2912, format["%1", life_settings_viewDistanceCar]];
ctrlSetText[2922, format["%1", life_settings_viewDistanceAir]];

/* Set up the sliders */
{
	slidersetRange [SEL(_x,0),100,8000];
	CONTROL(2900,SEL(_x,0)) sliderSetSpeed [100,100,100];
	sliderSetPosition [SEL(_x,0),SEL(_x,1)];
} foreach [[2901,life_settings_viewDistanceFoot],[2911,life_settings_viewDistanceCar],[2921,life_settings_viewDistanceAir]];


if(isNil "life_settings_tagson") then {
	life_settings_enableSidechannel = SVAR_PNAS["life_enableSidechannel",true];
	life_settings_tagson = SVAR_PNAS["life_settings_tagson",true];
	life_settings_revealObjects = SVAR_PNAS["life_settings_revealObjects",true];
};

CONTROL(2900,2971) cbSetChecked life_settings_enableSidechannel;
CONTROL(2900,2970) cbSetChecked life_settings_tagson;
CONTROL(2900,2972) cbSetChecked life_settings_revealObjects;
