#include "..\..\script_macros.hpp"
/*
    File: fn_startLoadout.sqf
    Author: Casperento

    Description:
    Loads a custom loadout on player when he got a new life
*/
private _pUniform = M_CONFIG(getArray,"Loadouts",str(playerSide),"uniform");
private _pHeadgear = M_CONFIG(getArray,"Loadouts",str(playerSide),"headgear");
private _pVest = M_CONFIG(getArray,"Loadouts",str(playerSide),"vest");
private _pBackpack = M_CONFIG(getArray,"Loadouts",str(playerSide),"backpack");
private _pWeapon = M_CONFIG(getArray,"Loadouts",str(playerSide),"weapon");
private _pMagazines = M_CONFIG(getArray,"Loadouts",str(playerSide),"mags");
private _pItems = M_CONFIG(getArray,"Loadouts",str(playerSide),"items");
private _linkedItems = M_CONFIG(getArray,"Loadouts",str(playerSide),"linkedItems");

if !(_pUniform isEqualTo []) then {
    if (playerSide isEqualTo civilian) then {
        _pUniform = selectRandom _pUniform;
        if (!(_pUniform isEqualTo []) && {!((_pUniform select 0) isEqualTo "") && {([(_pUniform select 1)] call life_fnc_levelCheck)}}) then {
            player forceAddUniform (_pUniform select 0);
        };
    } else {
        _pUniform apply {
            if (!(_x isEqualTo []) && {!((_x select 0) isEqualTo "") && {([(_x select 1)] call life_fnc_levelCheck)}}) then {
                player forceAddUniform (_x select 0);
            };
        };
    };
};

if !(_pHeadgear isEqualTo []) then {
    _pHeadgear apply {
        if (!(_x isEqualTo []) && {!((_x select 0) isEqualTo "") && {([(_x select 1)] call life_fnc_levelCheck)}}) then {
            player addHeadgear (_x select 0);
        };
    };
};

if !(_pVest isEqualTo []) then {
    _pVest apply {
        if (!(_x isEqualTo []) && {!((_x select 0) isEqualTo "") && {([(_x select 1)] call life_fnc_levelCheck)}}) then {
            player addVest (_x select 0);
        };
    };
};

if !(_pBackpack isEqualTo []) then {
    _pBackpack apply {
        if (!(_x isEqualTo []) && {!((_x select 0) isEqualTo "") && {([(_x select 1)] call life_fnc_levelCheck)}}) then {
            player addBackpack (_x select 0);
        };
    };
};

if !(_pWeapon isEqualTo []) then {
    _pWeapon apply {
        if (!(_x isEqualTo []) && {!((_x select 0) isEqualTo "") && {([(_x select 1)] call life_fnc_levelCheck)}}) then {
            player addWeapon (_x select 0);
        };
    };
};

if !(_pMagazines isEqualTo []) then {
    _pMagazines apply {
        if (!(_x isEqualTo []) && {!((_x select 0) isEqualTo "") && {((_x select 1) > 0) && {([(_x select 2)] call life_fnc_levelCheck)}}}) then {
            player addMagazines [(_x select 0),(_x select 1)];
        };
    };
};

if !(_pItems isEqualTo []) then {
    _pItems apply {
        if (!(_x isEqualTo []) && {!((_x select 0) isEqualTo "") && {((_x select 1) > 0) && {([(_x select 2)] call life_fnc_levelCheck)}}}) then {
            for "_i" from 1 to (_x select 1) step 1 do {player addItem (_x select 0)};
        };
    };
};

if !(_linkedItems isEqualTo []) then {
    _linkedItems apply {
        if (!(_x isEqualTo []) && {!((_x select 0) isEqualTo "") && {([(_x select 1)] call life_fnc_levelCheck)}}) then {
            player linkItem (_x select 0);
        };
    };
};

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;
