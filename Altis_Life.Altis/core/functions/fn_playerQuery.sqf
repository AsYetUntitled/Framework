/*
    Author: Daniel Stuart
    File: fn_playerQuery.sqf

    Description:
    Get all the player's information and send it to admin.

    Parameter(s):
        0: Object - Admin who called it.

    Returns:
    NOTHING
*/
params [
    ["_ret",ObjNull,[ObjNull]]
];
if (isNull _ret) exitWith {};

[life_atmbank,life_cash,owner player,player,profileNameSteam,(getPlayerUID player),playerSide] remoteExecCall ["life_fnc_adminInfo",_ret];
