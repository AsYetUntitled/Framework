#include "..\..\script_macros.hpp"
/*
	File: fn_surrender.sqf
	Author: 

	Description: Causes player to put their hands on their head.
*/
if( player GVAR ["restrained",false] ) exitWith {};
if( player GVAR ["Escorting",false] ) exitWith {};
if( vehicle player != player ) exitWith {};
if( speed player > 1 ) exitWith {};

if(player GVAR ["playerSurrender",false]) then {
	player SVAR ["playerSurrender",false,true];
} else {
	player SVAR ["playerSurrender",true,true];
};

while {player GVAR ["playerSurrender",false]} do {
	player playMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
	if(!alive player OR (vehicle player) != player) then { player SVAR ["playerSurrender",false,true]; };
};

player playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
