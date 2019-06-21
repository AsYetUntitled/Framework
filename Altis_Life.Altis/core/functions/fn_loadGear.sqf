#include "..\..\script_macros.hpp"
/*
    File: fn_loadGear.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Loads saved civilian gear, this is limited for a reason and that's balance.
*/
private _items = life_gear;
waitUntil {!(isNull (findDisplay 46))};

if (count _items isEqualTo 0) exitWith {
    call life_fnc_stripDownPlayer;

    switch (playerSide) do {
        case west: {
            call life_fnc_copLoadout;
        };

        case civilian: {
            call life_fnc_civLoadout;
        };

        case independent: {
            call life_fnc_medicLoadout;
        };
    };
};

_items params [
    ["_gear",[]],
    ["_vItems",[]]
];

player setUnitLoadout _gear;

life_maxWeight = if (backpack player isEqualTo "") then {LIFE_SETTINGS(getNumber,"total_maxWeight")} else {LIFE_SETTINGS(getNumber,"total_maxWeight") + round(FETCH_CONFIG2(getNumber,"CfgVehicles",(backpack player),"maximumload") / 4)};
{
    [true,(_x select 0),(_x select 1)] call life_fnc_handleInv;
} forEach (_vItems);

call life_fnc_playerSkins;
