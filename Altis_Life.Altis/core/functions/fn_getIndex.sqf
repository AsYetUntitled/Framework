/*
    Author: Daniel Stuart
    File: fn_getIndex.sqf

    Description:
    Return the index for the respective value in an array.

    Parameter(s):
        0: ANYTHING - Value to search for
        1: ARRAY - array to be searched (Should contain other arrays inside it)

    Returns:
    NUMBER
*/
params [
    "_value",
    ["_array",[],[[]]]
];

_return = -1;
{
    if (_x isEqualType []) then {
        if (_value in _x) exitWith {
            _return = _forEachIndex;
        };
    };
} forEach _array;

_return;
