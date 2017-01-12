#include "..\..\script_macros.hpp"
/*
    File: fn_weaponShopMags.sqf
    Author: Daniel Stuart

    Description:
    Set Weapon Shop in magazine mode
*/
disableSerialization;

private ["_muzzles","_eglArray","_magArray","_weapon"];
if ((uiNamespace getVariable ["Weapon_Magazine",0]) isEqualTo 0) then {
    _weapon = lbData[38403,lbCurSel (38403)];
    _magArray = FETCH_CONFIG2(getArray,"CfgWeapons",_weapon,"magazines");
    _muzzles = FETCH_CONFIG2(getArray,"CfgWeapons",_weapon,"muzzles");
    if ("EGLM" in _muzzles) then {
        _eglArray = FETCH_CONFIG(getArray,"CfgWeapons",_weapon,"EGLM","magazines");
        _magArray append _eglArray;
    };
    if ("GL_3GL_F" in _muzzles) then {
        _eglArray = FETCH_CONFIG(getArray,"CfgWeapons",_weapon,"GL_3GL_F","magazines");
        _magArray append _eglArray;
    };
    uiNamespace setVariable ["Magazine_Array",_magArray];
    uiNamespace setVariable ["Weapon_Magazine",1];
} else {
    uiNamespace setVariable ["Weapon_Magazine",0];
};
