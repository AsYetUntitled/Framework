#include "..\..\script_macros.hpp"
/*
    File: fn_surrender.sqf
    Author:

    Description: Causes player to put their hands on their head.
*/
if (player getVariable ["restrained",false]) exitWith {};
if (player getVariable ["Escorting",false]) exitWith {};
if (!isNull objectParent player) exitWith {};
if (speed player > 1) exitWith {};

private _currentState = player getVariable ["playerSurrender",false];
player setVariable ["playerSurrender", !_currentState, true];

while {player getVariable ["playerSurrender",false]} do {
    player playMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
    if (!alive player || {!isNull objectParent player}) then {
        player setVariable ["playerSurrender",false,true];
    };
};

player playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
