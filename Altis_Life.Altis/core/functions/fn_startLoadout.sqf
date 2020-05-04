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
};

private _level = call {
    if (_side isEqualTo "civ") exitWith {
        if (life_is_arrested) then {
            "arrested"
        } else {
            "random"
        };
    };
    if (_side isEqualTo "cop") exitWith {
        FETCH_CONST(life_coplevel)
    };
    if (_side isEqualTo "med") exitWith {
        FETCH_CONST(life_mediclevel)
    };
};

if (_side isEqualTo "civ" && _level isEqualTo "random") then {
    private _civLoadout = getUnitLoadout (missionConfigFile >> "Loadouts" >> "civ_level_random");
    private _arr = [
        "U_C_Poloshirt_blue",
        "U_C_Poloshirt_burgundy",
        "U_C_Poloshirt_stripped",
        "U_C_Poloshirt_tricolour",
        "U_C_Poloshirt_salmon",
        "U_C_Poloshirt_redwhite",
        "U_C_Commoner1_1"
    ];
	_civLoadout set [3, [(selectRandom _arr), []]];
    player setUnitLoadout _civloadout;
} else {
    player setUnitLoadout (missionConfigFile >> "Loadouts" >> format["%1_level_%2", _side, _level]);
};

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;