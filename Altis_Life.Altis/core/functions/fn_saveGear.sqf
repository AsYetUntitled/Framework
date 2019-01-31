#include "..\..\script_macros.hpp"
/*
    File: fn_saveGear.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Saves the players gear for syncing to the database for persistence..
*/
private _return = getUnitLoadout player;
private _yItems = [];
private _savedVirtualItems = LIFE_SETTINGS(getArray,"saved_virtualItems");

{
    _val = ITEM_VALUE(_x);
    if (_val > 0) then {
        _yItems pushBack [_x,_val];
    };
} forEach _savedVirtualItems;

_return pushBack _yItems;
life_gear = _return;
