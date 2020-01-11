#include "..\..\script_macros.hpp"
/*
    File: fn_settingsMenu
    Author: Bryan "Tonic" Boardwine

    Description:
    Setup the settings menu.
*/
if (isNull (findDisplay 2900)) then {
    if (!createDialog "SettingsMenu") exitWith {hint localize "STR_NOTF_menuWillNotOpen";};
};

disableSerialization;

ctrlSetText[2902, format ["%1", life_settings_viewDistanceFoot]];
ctrlSetText[2912, format ["%1", life_settings_viewDistanceCar]];
ctrlSetText[2922, format ["%1", life_settings_viewDistanceAir]];

/* Set up the sliders */
{
    slidersetRange [(_x select 0),100,8000];
    CONTROL(2900,(_x select 0)) sliderSetSpeed [100,100,100];
    sliderSetPosition [(_x select 0),(_x select 1)];
} forEach [[2901,life_settings_viewDistanceFoot],[2911,life_settings_viewDistanceCar],[2921,life_settings_viewDistanceAir]];


if (isNil "life_settings_enableNewsBroadcast") then {
    life_settings_enableNewsBroadcast = profileNamespace setVariable ["life_enableNewsBroadcast",true];
    life_settings_enableSidechannel = profileNamespace setVariable ["life_enableSidechannel",true];
};

CONTROL(2900,2971) cbSetChecked life_settings_enableSidechannel;
CONTROL(2900,2973) cbSetChecked life_settings_enableNewsBroadcast;
CONTROL(2900,2970) cbSetChecked (profileNamespace getVariable ["life_settings_tagson",true]);
CONTROL(2900,2972) cbSetChecked (profileNamespace getVariable ["life_settings_revealObjects",true]);
