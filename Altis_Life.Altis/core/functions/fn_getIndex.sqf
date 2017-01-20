#include "..\..\script_macros.hpp"
/*
    File: fn_getIndex.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: Daniel Stuart (Moved to client-side & optimized)

    Description:
    Return the index for the array with respective item in an array.

    Parameter(s):
        0: ANYTHING - Value to search for
        1: ARRAY - array with an array inside.

    Returns:
    NUMBER
*/
params [
    "_value",
    ["_array",[[]],[[]]]
];

_return = -1;
{
    if (_value in _x) then {
        _return = _forEachIndex;
        breakOut "";
    };
} forEach _array;

_return;
