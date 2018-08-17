/*
    File: fn_mresArray.sqf
    Author: Bryan "Tonic" Boardwine";

    Description:
    Acts as a mres (MySQL Real Escape) for arrays so they
    can be properly inserted into the database without causing
    any problems. The return method is 'hacky' but it's effective.
*/

params ["_array"];

private _input = str _array;

str ((_input splitString '"') joinString "`")
