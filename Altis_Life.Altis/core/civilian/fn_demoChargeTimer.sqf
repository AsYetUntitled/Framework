#include "..\..\script_macros.hpp"
/*
	File: fn_demoChargeTimer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the "Demo" timer for the police.
*/
private["_uiDisp","_time","_timer"];
disableSerialization;
6 cutRsc ["life_timer","PLAIN"];
_uiDisp = GVAR_UINS "life_timer";
_timer = _uiDisp displayCtrl 38301;
_time = time + (5 * 60);

while {true} do {
	if(isNull _uiDisp) then {
		6 cutRsc ["life_timer","PLAIN"];
		_uiDisp = GVAR_UINS "life_timer";
		_timer = _uiDisp displayCtrl 38301;
	};
	if(round(_time - time) < 1) exitWith {};
	if(!(fed_bank GVAR ["chargeplaced",false])) exitWith {};
	_timer ctrlSetText format["%1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	sleep 0.08;
};
6 cutText["","PLAIN"];