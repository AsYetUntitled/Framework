/*
    File: fn_terrainSort.sqf (TO BE CHANGED)
    Author: BoGuu

    Description:
    Gah.
*/


if !(params[["_array","",[[],0]]]) exitWith {};

scopeName "main";

{
    if (worldName == _x select 0) then {
        (_x select 1) breakOut "main";
    };
} count _array;

[0, []] select ((_array select 0) select 1 isEqualType []);
