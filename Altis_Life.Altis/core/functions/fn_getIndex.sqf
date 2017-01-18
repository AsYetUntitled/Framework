#include "..\..\script_macros.hpp"
/*
    File: fn_getIndex.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: Daniel Stuart (Moved to client-side and added support for simple arrays)

    Description:
    Return the index for the respective item in an array.

    Parameter(s):
        0: ANYTHING - Value to search for
        1: ARRAY - array to be searched

    Returns:
    NUMBER
*/
params [
    "_value",
    ["_array",[],[[]]]
];

_return = -1;
{
    if ((_x isEqualType [] && {_value in _x}) || {_value isEqualTo _x}) then {
        _return = _forEachIndex;
        breakOut "";
    };
} forEach _array;

_return;
