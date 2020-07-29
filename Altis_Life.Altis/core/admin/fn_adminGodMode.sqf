#include "..\..\script_macros.hpp"
/*
    File: fn_adminGodMode.sqf
    Author: Tobias 'Xetoxyc' Sittenauer

    Description: Enables God mode for Admin
*/

if (FETCH_CONST(life_adminlevel) < 4) exitWith {
    closeDialog 0;
    hint localize "STR_ANOTF_ErrorLevel";
};

closeDialog 0;

if (life_god) then {
    titleText [localize "STR_ANOTF_godModeOff","PLAIN"];
} else {
    titleText [localize "STR_ANOTF_godModeOn","PLAIN"];
};
titleFadeOut 2;

player allowDamage life_god;
life_god = !life_god;
