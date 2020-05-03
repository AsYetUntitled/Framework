#include "..\..\script_macros.hpp"
/*
    File: fn_startLoadout.sqf
    Author: Casperento

    Description:
    Loads a custom loadout on player when he got a new life
*/
private _level = call {
    if (playerSide isEqualTo civilian) exitWith {
        if (life_is_arrested) then {
            "arrested"
        } else {
            floor(random (count(missionConfigFile >> "Loadouts" >> str(playerSide))-1))
        };
    };
    if (playerSide isEqualTo west) exitWith {
        FETCH_CONST(life_coplevel)
    };
    if (playerSide isEqualTo independent) exitWith {
        FETCH_CONST(life_mediclevel)
    };
};

player setUnitLoadout (missionConfigFile >> "Loadouts" >> str(playerSide) >> format["lvl_%1",_level]);

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;