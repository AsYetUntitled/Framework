/*
    File: fn_numberText.sqf
    Author: Karel Moricky
    Edited by: Daniel Stuart (Localized number separator)

    Description:
    Convert a number into string (avoiding scientific notation)

    Parameter(s):
    0: NUMBER - Number that'll be converted to string

    Returns:
    STRING
*/
private ["_digots","_digitsCount","_modBase","_numberText","_mark"];
params [
    ["_number",0,[0]]
];

_digits = _number call bis_fnc_numberDigits;
_digitsCount = count _digits - 1;

_modBase = _digitsCount % 3;
_numberText = "";

_mark = ",";
if (!(language isEqualTo "English")) then { _mark = " "; };
{
    _numberText = _numberText + str _x;
    if (((_foreachindex - _modBase) % 3) isEqualTo 0 && !(_foreachindex isEqualTo _digitsCount)) then {
        _numberText = _numberText + _mark;
    };
} forEach _digits;

_numberText
