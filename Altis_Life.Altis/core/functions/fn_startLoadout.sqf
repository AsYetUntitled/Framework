#include "..\..\script_macros.hpp"
/*
    File: fn_startLoadout.sqf
    Author: Casperento

    Description:
    Loads a custom loadout on player when he got a new life
*/

private "_cfg";
private "_index";
private "_pUniform";
{
    _index = _forEachIndex;
    _cfg = (M_CONFIG(getArray,"Loadouts",str(playerSide),_x)) select {!(_x isEqualTo []) && {!((_x select 0) isEqualTo "") && {([(_x select (count _x - 1))] call life_fnc_levelCheck)}}};

    // Uniform
    if (_index isEqualTo 0) then {
        _pUniform = if (playerSide isEqualTo civilian) then {(selectRandom _cfg) select 0} else {(_cfg select 0) select 0};
        player forceAddUniform _pUniform;
    } else {
        _cfg apply {
            switch (_index) do {
                // Headgear
                case 1: {
                    player addHeadgear (_x select 0);
                };
                // Vest
                case 2: {
                    player addVest (_x select 0);
                };
                // Backpack
                case 3: {
                    player addBackpack (_x select 0);
                };
                // Weapon
                case 4: {
                    player addWeapon (_x select 0);
                };
                // Mags
                case 5: {
                    if (_x select 1 > 0) then {
                        player addMagazines [(_x select 0),(_x select 1)];
                    };
                };
                // Items
                case 6: {
                    if (_x select 1 > 0) then {
                        for "_i" from 1 to (_x select 1) step 1 do {player addItem (_x select 0)};
                    };
                };
                // Linked Items
                case 7: {
                    player linkItem (_x select 0);
                };
            };
        };
    };
} forEach ["uniform","headgear","vest","backpack","weapon","mags","items","linkedItems"];

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;
