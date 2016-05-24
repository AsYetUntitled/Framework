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
private ["_number","_mod","_digots","_digitsCount","_modBase","_numberText"];

_number = [_this,0,0,[0]] call bis_fnc_param;
_mod = [_this,1,3,[0]] call bis_fnc_param;

_digits = _number call bis_fnc_numberDigits;
_digitsCount = count _digits - 1;

_modBase = _digitsCount % _mod;
_numberText = "";
{
    _numberText = _numberText + str _x;
    if ((_foreachindex - _modBase) % (_mod) isEqualTo 0 && _foreachindex != _digitsCount) then {_numberText = _numberText + "";};
} forEach _digits;
_numberText