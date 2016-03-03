#include "..\..\..\script_macros.hpp"
/*
	File: fn_movesMenu.sqf
	Author: Jack "Scarso" Farhall
*/

private["_display","_list","_moves"];
disableSerialization;

_moves = [
    ["Kung Fu","AmovPercMstpSnonWnonDnon_exerciseKata"],
	["Push Ups","AmovPercMstpSnonWnonDnon_exercisePushup"],
	["Knee Bends (Fast)","AmovPercMstpSnonWnonDnon_exercisekneeBendB"],
	["Knee Bends (Normal)","AmovPercMstpSnonWnonDnon_exercisekneeBendA"],
	["Swimming On Land","AswmPercMrunSnonWnonDf_AswmPercMstpSnonWnonDnon"],
	["Scared","AmovPercMstpSnonWnonDnon_Scared"],
	["Take a Piss","Acts_AidlPercMstpSlowWrflDnon_pissing"],
	["Drunk Walk","AcinPercMstpSnonWnonDnon_agony"]
	];

waitUntil {!isNull (findDisplay 2900)};
_display = findDisplay 2900;
_list = _display displayCtrl 2902;
lbClear _list;

{
	
	_list lbAdd format["%1", _x select 0];
	_list lbSetdata [(lbSize _list)-1,str(_x select 1)];
} foreach _moves;