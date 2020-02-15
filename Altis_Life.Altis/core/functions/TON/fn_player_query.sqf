/*
    File: fn_player_query.sqf
    Author: Bryan "Tonic" Boardwine

    Description: TODO
*/
private ["_ret"];
_ret = _this select 0;
if (isNull _ret) exitWith {};
if (isNil "_ret") exitWith {};

[life_atmbank,life_cash,owner player,player,profileNameSteam,getPlayerUID player,playerSide] remoteExecCall ["life_fnc_adminInfo",_ret];
