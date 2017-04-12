/*
    File: fn_civLoadout.sqf
    Author: Tobias 'Xetoxyc' Sittenauer

    Description:
    Loads the civs out with the default gear, with randomized clothing.
*/

[] call life_fnc_stripDownPlayer;

private _clothings = [
    "U_C_Poloshirt_blue",
    "U_C_Poloshirt_burgundy",
    "U_C_Poloshirt_stripped",
    "U_C_Poloshirt_tricolour",
    "U_C_Poloshirt_salmon",
    "U_C_Poloshirt_redwhite",
    "U_C_Commoner1_1"
];

player addUniform (selectRandom _clothings);

/* ITEMS */
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;