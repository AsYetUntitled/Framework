/*
    File: fn_jailTimeAction.sqf
    Author: Yeiij

    Description:
    Starts the jail time dialog

*/
params [
    ["_unit",objNull,[objNull]]
];
if (isNull _unit || !isPlayer _unit) exitWith {};
life_jailing_unit = _unit;
