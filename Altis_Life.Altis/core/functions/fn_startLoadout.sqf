#include "..\..\script_macros.hpp"
/*
    File: fn_startLoadout.sqf
    Author: Casperento

    Description:
    Loads a custom loadout on player when he got a new life
*/
private _side = call {
    if (playerSide isEqualTo civilian) exitWith {"civ"};
    if (playerSide isEqualTo west) exitWith {"cop"};
    if (playerSide isEqualTo independent) exitWith {"med"};
    if (playerSide isEqualTo east) exitWith {"east"};
};

if (_side isEqualTo "civ") then {
    if (life_is_arrested) exitWith {
        player setUnitLoadout (missionConfigFile >> "Loadouts" >> "civ_level_arrested");
    };

    private _civLoadout = getUnitLoadout (missionConfigFile >> "Loadouts" >> "civ_level_random");
    if (getNumber(missionConfigFile >> "Loadouts" >> "civilian_randomClothing") isEqualTo 1) then {
        private _arr = getArray(missionConfigFile >> "Loadouts" >> "civRandomClothing");
        (_civLoadout select 3) set [0, selectRandom _arr];
    };
    player setUnitLoadout _civLoadout;
} else {
    private _level = call {
        if (_side isEqualTo "cop") exitWith {FETCH_CONST(life_coplevel)};
        if (_side isEqualTo "med") exitWith {FETCH_CONST(life_mediclevel)};
        if (_side isEqualTo "east") exitWith {0};
    };
    player setUnitLoadout (missionConfigFile >> "Loadouts" >> format["%1_level_%2", _side, _level]);
};

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;
