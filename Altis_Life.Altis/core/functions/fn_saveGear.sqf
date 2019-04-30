#include "..\..\script_macros.hpp"
/*
    File: fn_saveGear.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Saves the players gear for syncing to the database for persistence..
*/

private _playerLoadout = getUnitLoadout player;
private _yItems = [];

if (LIFE_SETTINGS(getNumber, "save_virtualItems") isEqualTo 1) then {
    {
        _val = ITEM_VALUE(_x);
        if (_val > 0) then {
            _yItems pushBack [_x,_val];
        };
    } forEach LIFE_SETTINGS(getArray, "saved_virtualItems");
};

_playerLoadout pushBack _yItems;
life_gear = _playerLoadout;
