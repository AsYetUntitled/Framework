#include "..\..\script_macros.hpp"
/*
    File: fn_weaponShopMags.sqf
    Author: Daniel Stuart

    Description:
    Set Weapon Shop in magazine mode
*/
disableSerialization;

if ((uiNamespace getVariable ["Weapon_Magazine",0]) isEqualTo 0) then {
    private ["_magArray","_weapon"];
    _weapon = lbData[38403,lbCurSel (38403)];
    _magArray = FETCH_CONFIG2(getArray,"CfgWeapons",_weapon,"magazines");
    {
        if (_x in ["EGLM","GL_3GL_F"]) then {
            _magArray append FETCH_CONFIG(getArray,"CfgWeapons",_weapon,_x,"magazines");
        };
    } forEach FETCH_CONFIG2(getArray,"CfgWeapons",_weapon,"muzzles");
    uiNamespace setVariable ["Magazine_Array",_magArray];
    uiNamespace setVariable ["Weapon_Magazine",1];
} else {
    uiNamespace setVariable ["Weapon_Magazine",0];
};
