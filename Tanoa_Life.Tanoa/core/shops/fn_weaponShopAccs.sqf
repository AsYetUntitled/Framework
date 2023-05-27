#include "..\..\script_macros.hpp"
/*
    File: fn_weaponShopAccs.sqf
    Author: Daniel Stuart

    Description:
    Set Weapon Shop in accessories mode
*/
disableSerialization;

if ((uiNamespace getVariable ["Weapon_Accessories", 0]) isEqualTo 0) then {
    private _weapon = lbData [38403, lbCurSel (38403)];
    private _compatibleItems = _weapon call BIS_fnc_compatibleItems; //Fetch all compatible Items for the weapons.
    uiNamespace setVariable ["Accessories_Array", _compatibleItems];
    uiNamespace setVariable ["Weapon_Accessories", 1];
} else {
    uiNamespace setVariable ["Weapon_Accessories", 0];
};
