/*
    File: fn_displayHandler.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master display handler
*/
params [
    ["_ctrl",displayNull,[displayNull]],
    ["_code",-1,[0]]
];
private _handled = false;

//Esc Key Handler
if (_code isEqualTo 1) then {_handled = true};

_handled;
