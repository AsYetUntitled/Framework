#include "..\..\script_macros.hpp"

/*
    File: fn_useItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main function for item effects and functionality through the player menu.
*/

disableSerialization;

if ((lbCurSel 2005) isEqualTo -1) exitWith {
    hint localize "STR_ISTR_SelectItemFirst";
};

private _item = CONTROL_DATA(2005);
private _edible = M_CONFIG(getNumber, "VirtualItems", _item, "edible");
private _drinkable = M_CONFIG(getNumber, "VirtualItems", _item, "drinkable");

if (_edible > -1 || _drinkable > -1) exitWith {
    if ([false, _item, 1] call life_fnc_handleInv) then {
        if (_edible > -1) then {
            private _sum = life_hunger + _edible;
            life_hunger = (_sum max 5) min 100; // never below 5 or above 100
        };

        if (_drinkable > -1) then {
            private _sum = life_thirst + _drinkable;

            life_thirst = (_sum max 5) min 100; // never below 5 or above 100

            if (LIFE_SETTINGS(getNumber, "enable_fatigue") isEqualTo 1) then {
                player setFatigue 0;
            };
            if (_item isEqualTo "redgull" && {LIFE_SETTINGS(getNumber, "enable_fatigue") isEqualTo 1}) then {
                [] spawn {
                    life_redgull_effect = time;
                    titleText [localize "STR_ISTR_RedGullEffect", "PLAIN"];
                    player enableFatigue false;
                    waitUntil {!alive player || ((time - life_redgull_effect) > (3 * 60))};
                    player enableFatigue true;
                };
            };
        };
    };

    [] call life_fnc_p_updateMenu;
    [] call life_fnc_hudUpdate;
};

switch (_item) do {
    case "boltcutter": {
        [cursorObject] spawn life_fnc_boltcutter;
        closeDialog 0;
    };

    case "blastingcharge": {
        player reveal fed_bank;
        (group player) reveal fed_bank;
        [cursorObject] spawn life_fnc_blastingCharge;
        closeDialog 0;
    };

    case "defusekit": {
        [cursorObject] spawn life_fnc_defuseKit;
        closeDialog 0;
    };

    case "storagesmall": {
        [false] call life_fnc_storageBox;
    };

    case "storagebig": {
        [true] call life_fnc_storageBox;
    };

    case "spikeStrip": {
        if (!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"; closeDialog 0};
        if ([false, _item, 1] call life_fnc_handleInv) then {
            [] spawn life_fnc_spikeStrip;
            closeDialog 0;
        };
    };

    case "fuelFull": {
        if !(isNull objectParent player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
        [] spawn life_fnc_jerryRefuel;
        closeDialog 0;
    };

    case "fuelEmpty": {
        [] spawn life_fnc_jerryCanRefuel;
        closeDialog 0;
    };

    case "lockpick": {
        [] spawn life_fnc_lockpick;
        closeDialog 0;
    };

    default {
        hint localize "STR_ISTR_NotUsable";
    };
};

[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;
