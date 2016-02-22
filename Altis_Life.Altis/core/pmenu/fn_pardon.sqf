#include "..\..\script_macros.hpp"
/*
	File: fn_pardon.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Pardons the selected player.
*/
private["_display","_list","_uid"];
disableSerialization;
if(playerside != west) exitWith {};

_display = findDisplay 2400;
_list = _display displayCtrl 2402;
_data = lbData[2401,(lbCurSel 2401)];
_data = call compile format["%1", _data];
if(isNil "_data") exitWith {};
if(typeName _data != "ARRAY") exitWith {};
if(count _data == 0) exitWith {};

_uid = _data select 0;

if(life_HC_isActive) then {
	[_uid] remoteExecCall ["HC_fnc_wantedRemove",HC_Life];
} else {
	[_uid] remoteExecCall ["life_fnc_wantedRemove",RSERV];
};
