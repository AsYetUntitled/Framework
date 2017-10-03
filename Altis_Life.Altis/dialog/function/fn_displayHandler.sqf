/*
    File: fn_displayHandler.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master display handler
*/
private _handled = false;

//Esc Key Handler
if ((_this select 1) isEqualTo 1) then {_handled = true;};

_handled;
