#include "..\..\script_macros.hpp"
/*
    File: fn_weaponShopMags.sqf
    Author: Daniel Stuart

    Description:
    Set Weapon Shop in magazine mode
*/
disableSerialization;

if ((uiNamespace getVariable ["Weapon_Magazine",0]) isEqualTo 0) then {
    private _weapon = lbData[38403,lbCurSel (38403)];
    private _magArray = FETCH_CONFIG2(getArray,"CfgWeapons",_weapon,"magazines");
    {
        if (_x in FETCH_CONFIG2(getArray,"CfgWeapons",_weapon,"muzzles")) then {
            _magArray append FETCH_CONFIG(getArray,"CfgWeapons",_weapon,_x,"magazines");
        };
    } count ["EGLM", "GL_3GL_F"];
    uiNamespace setVariable ["Magazine_Array",_magArray];
    uiNamespace setVariable ["Weapon_Magazine",1];
} else {
    uiNamespace setVariable ["Weapon_Magazine",0];
};
