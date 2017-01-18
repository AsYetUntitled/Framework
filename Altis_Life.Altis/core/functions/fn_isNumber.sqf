/*
    File: fn_isNumber.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: Daniel Stuart (Moved to client-side, got rid of KRON)

    Description:
    Return if the given string only contains numbers.

    Parameter(s):
        0: STRING - String to be analyzed

    Returns:
    BOOL
*/
params [
    ["_array","",[""]]
];
_array = _array splitString "";

_return = true;
{
    if (!(_x in ["0","1","2","3","4","5","6","7","8","9"])) exitWith {
        _return = false;
    };
} forEach _array;

_return;
