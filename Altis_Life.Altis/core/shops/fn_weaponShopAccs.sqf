#include "..\..\script_macros.hpp"
/*
    File: fn_weaponShopAccs.sqf
    Author: Daniel Stuart

    Description:
    Set Weapon Shop in accessories mode
*/
disableSerialization;

if ((uiNamespace getVariable ["Weapon_Accessories",0]) isEqualTo 0) then {
    private["_weapon","_slotArray","_weaponArray"];
    _weapon = lbData[38403,lbCurSel (38403)];
    _slotArray = [];
    _weaponArray = [];

    if (isArray (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems")) then {
        _slotArray = FETCH_CONFIG3(getArray,"CfgWeapons",_weapon,"WeaponSlotsInfo","CowsSlot","compatibleItems");
        {
            _weaponArray pushBack _x;
        } forEach _slotArray;
    };
    if (isArray (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems")) then {
        _slotArray = FETCH_CONFIG3(getArray,"CfgWeapons",_weapon,"WeaponSlotsInfo","MuzzleSlot","compatibleItems");
        {
            _weaponArray pushBack _x;
        } forEach _slotArray;
    };
    if (isArray (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems")) then {
        _slotArray = FETCH_CONFIG3(getArray,"CfgWeapons",_weapon,"WeaponSlotsInfo","PointerSlot","compatibleItems");
        {
            _weaponArray pushBack _x;
        } forEach _slotArray;
    };
    if (isArray (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems")) then {
        _slotArray = FETCH_CONFIG3(getArray,"CfgWeapons",_weapon,"WeaponSlotsInfo","UnderBarrelSlot","compatibleItems");
        {
            _weaponArray pushBack _x;
        } forEach _slotArray;
    };
    uiNamespace setVariable["Accessories_Array",_weaponArray];
    uiNamespace setVariable["Weapon_Accessories",1];
} else {
    uiNamespace setVariable["Weapon_Accessories",0];
};
