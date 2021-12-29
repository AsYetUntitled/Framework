/*
    File: fn_sideToString.sqf
    Author: DomT602
    Description:
    Translates a side to a string representing the side.
    To-do - add to spyglass
*/
params [
    ["_unit",objNull,[objNull]],
    ["_lowerCase",false,[true]]
];
if (isNull _unit) exitWith {};

private _sideText = switch (side _unit) do {
    case west: {"Cop"};
    case civilian: {"Civ"};
    case independent: {"Med"};
    case east: {"East"};
    default {"Unknown"};
};

if (_lowerCase) then {
    _sideText = toLower _sideText;
};

_sideText;
