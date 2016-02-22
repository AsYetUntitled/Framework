#include "..\..\script_macros.hpp"
/*
	File: fn_wantedAddP.sqf
	Author: 
	
	Description:
	
*/
private["_unit","_amount"];
if(playerSide != west) exitWith {hint "Who do you think you are?"};
if((lbCurSel 2406) == -1) exitWith {hint "You must select a perp."};
if((lbCurSel 2407) == -1) exitWith {hint "You must select a crime."};
_unit = lbData [2406,lbCurSel 2406];
_unit = call compile format["%1",_unit];
_amount = lbData [2407,lbCurSel 2407];
if(isNil "_unit") exitWith {};
//if(side _unit == west) exitWith {hint "What are ya trying to do, start a police war? Dickhead." };
//if(_unit == player) exitWith {hint "You can't make yourself wanted, dipshit";};
if(isNull _unit) exitWith {};

[1,"STR_Wanted_AddP",true,[_unit GVAR ["realname",name _unit],_amount,getPlayerUID _unit]] remoteExecCall ["life_fnc_broadcast",RCLIENT];

if(life_HC_isActive) then {
	[getPlayerUID _unit,_unit GVAR ["realname",name _unit],_amount] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
} else {
	[getPlayerUID _unit,_unit GVAR ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
};
