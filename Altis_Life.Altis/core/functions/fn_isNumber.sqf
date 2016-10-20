/*
    Author: Daniel Stuart
    File: fn_isNumber.sqf

    Description:
    Return if the given string only has numbers.

    Parameter(s):
        0: STRING - String to be analyzed

    Returns:
    BOOL
*/
private "_array";
params [
    ["_string","",[""]]
];
_array = _string splitString "";
_return = true;

{
    if (!(_x in ["0","1","2","3","4","5","6","7","8","9"])) exitWith {
        _return = false;
    };
} forEach _array;

_return;
