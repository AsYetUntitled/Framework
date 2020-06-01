/*
    File: fn_playerQuery.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    pass local variables to admin
*/
if (!isRemoteExecuted) exitWith {};

[life_atmbank,life_cash,owner player,player,profileNameSteam,getPlayerUID player,playerSide] remoteExecCall ["life_fnc_adminInfo",remoteExecutedOwner];
