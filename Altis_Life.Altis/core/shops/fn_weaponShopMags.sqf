#include "..\..\script_macros.hpp"
/*
    File: fn_weaponShopMags.sqf
    Author: Daniel Stuart

    Description:
    Set Weapon Shop in magazine mode
*/
disableSerialization;

if ((uiNamespace getVariable ["Weapon_Magazine",0]) isEqualTo 0) then {
    private["_weapon"];
    _weapon = lbData[38403,lbCurSel (38403)];
    _weapon = FETCH_CONFIG2(getArray,"CfgWeapons",_weapon,"magazines");
    uiNamespace setVariable["Magazine_Array",_weapon];
    uiNamespace setVariable["Weapon_Magazine",1];
} else {
    uiNamespace setVariable["Weapon_Magazine",0];
};
