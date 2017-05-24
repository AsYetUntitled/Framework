/*
    File: fn_jailTimeAction.sqf
    Author: Yeiij

    Description:
    Starts the jail time dialog

*/
params [
    ["_unit",objNull,[objNull]]
];
if (!(createDialog "life_jail_time")) exitWith {hint localize "STR_Jail_Time_Failed"};
if (isNull _unit || !isPlayer _unit) exitWith {};
life_jailing_unit = _unit;
