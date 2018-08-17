/*
    File: fn_numberSafe.sqf
    Author: Karel Moricky

    Description:
    Convert a number into string (avoiding scientific notation)

    Parameter(s):
    _this: NUMBER

    Returns:
    STRING
*/
params ["_number"];

_number toFixed 0;
