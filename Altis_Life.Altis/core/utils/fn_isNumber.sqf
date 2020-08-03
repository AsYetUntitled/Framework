/*
    File: fn_isNumber.sqf
    Author: Bryan "Tonic" Boardwine

    Description: determines whether or not a string represents a valid number
*/
params [
    ["_string","",[""]]
];
if (_string isEqualTo "") exitWith {false};
private _array = _string splitString "";

(_array findIf {!(_x in ["0","1","2","3","4","5","6","7","8","9"])}) isEqualTo -1;
