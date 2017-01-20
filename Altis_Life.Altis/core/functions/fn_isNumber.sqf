/*
    File: fn_isNumber.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: Daniel Stuart (Moved to client-side & got rid of KRON)

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
_array = toArray _array;

_return = true;
{
    if (_x < 48 || _x > 57) then {
        _return = false;
        breakOut "";
    };
} count _array;

_return;
