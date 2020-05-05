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
    if (playerSide isEqualTo independent) exitWith {"east"};
};

if (_side isEqualTo "civ") exitWith {
    if (life_is_arrested) then {
        player setUnitLoadout (missionConfigFile >> "Loadouts" >> "civ_level_arrested");
    } else {
		private _civLoadout = getUnitLoadout (missionConfigFile >> "Loadouts" >> "civ_level_random");
        if (getNumber(missionConfigFile >> "Loadouts" >> "civilian_randomClothing") isEqualTo 1) then {
            private _arr = getArray(missionConfigFile >> "Loadouts" >> "civRandomClothing");
            (_civLoadout select 3) set [0, (selectRandom _arr)];
        };
        player setUnitLoadout _civLoadout;
    };

    [] call life_fnc_playerSkins;
    [] call life_fnc_saveGear;
};

if (_side isEqualTo "cop") exitWith {
    player setUnitLoadout (missionConfigFile >> "Loadouts" >> format["%1_level_%2", _side, FETCH_CONST(life_coplevel)]);
    [] call life_fnc_playerSkins;
    [] call life_fnc_saveGear;
};

if (_side isEqualTo "med") exitWith {
    player setUnitLoadout (missionConfigFile >> "Loadouts" >> format["%1_level_%2", _side, FETCH_CONST(life_mediclevel)]);
    [] call life_fnc_playerSkins;
    [] call life_fnc_saveGear;
};

if (_side isEqualTo "east") exitWith {
    player setUnitLoadout (missionConfigFile >> "Loadouts" >> "east_level_0");
    [] call life_fnc_playerSkins;
    [] call life_fnc_saveGear;
};
