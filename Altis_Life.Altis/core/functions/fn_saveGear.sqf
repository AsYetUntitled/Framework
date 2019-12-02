#include "..\..\script_macros.hpp"
/*
    File: fn_saveGear.sqf
    Author: Bryan "Tonic" Boardwine
    Full Gear/Y-Menu Save by Vampire
    Edited: Itsyuka

    Description:
    Saves the players gear for syncing to the database for persistence..
*/
private _return = [];
private _yItems = [];
private _savedVirtualItems = LIFE_SETTINGS(getArray,"saved_virtualItems");

_return pushBack (getUnitLoadout player);

if (LIFE_SETTINGS(getNumber,"save_virtualItems") isEqualTo 1) then {
    {
        private _val = ITEM_VALUE(_x);
        if (_val > 0) then {
            _yItems pushBack [_x,_val];
        };
        true
    } count _savedVirtualItems;
};
_return pushBack _yItems;

life_gear = _return;
