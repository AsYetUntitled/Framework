#include "..\..\script_macros.hpp"
/*
    File: fn_weaponShopMags.sqf
    Authors: Daniel Stuart, Faron, TaktischerSpeck
     

    Description:
    Set Weapon Shop in magazine mode
*/
disableSerialization;

if ((uiNamespace getVariable ["Weapon_Magazine",0]) isEqualTo 0) then {
    private _weapon = 0;
    private _magArray = [];
    private _magWell = [];
    private _subClass = 0;
    private _muzzles = [];
    private _subCfgClass = 0;

    _weapon = lbData[38403,lbCurSel (38403)];
    _magArray = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");
    
    _magWell = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazineWell");
    {
        _subClass = _x;
        _subCfgClass = configProperties [configFile >> "CfgMagazineWells" >> _subClass];
        
        {
            _magArray append getArray _x;
            true;
        } count _subCfgClass;
        true;
    } count _magWell;
    
    //GL and stuff
    _muzzles = (getArray (configFile >> "CfgWeapons" >> _weapon >> "muzzles")) - ["this"];
    if (_muzzles isEqualTo []) then {
        {
            _magArray append getArray (configFile >> "CfgWeapons" >> _weapon >> _x >> "magazines");
            _magWell = getArray (configFile >> "CfgWeapons" >> _weapon >> _x >> "magazineWell");
            {
                _subClass = _x;
                _subCfgClass = configProperties [configFile >> "CfgMagazineWells" >> _subClass];
                
                {
                    _magArray append getArray _x;
                    true;
                } count _subCfgClass;
                true;
            } count _magWell;
            true;
        } count _muzzles;
    };
    
    uiNamespace setVariable ["Magazine_Array",_magArray];
    uiNamespace setVariable ["Weapon_Magazine",1];
} else {
    uiNamespace setVariable ["Weapon_Magazine",0];
};