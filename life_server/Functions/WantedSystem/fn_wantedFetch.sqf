#include "\life_server\script_macros.hpp"
/*
	File: fn_wantedFetch.sqf
	Author: Bryan "Tonic" Boardwine"

	Description:
	Displays wanted list information sent from the server.
*/
private["_list","_jailedUnits"];
params [
	["_ret",ObjNull,[objNull]]
];
if(isNull _ret) exitWith {};

_ret = owner _ret;
_jailedUnits = [];
{if(_x distance (getMarkerPos "jail_marker") < 120) then {_jailedUnits pushBack getPlayerUID _x}} forEach playableUnits;

_list = [];
{
	_uid = _x select 1;
	if([_uid] call life_fnc_isUIDActive) then {
		if(!(_uid in _jailedUnits)) then {
			_list pushBack _x;
		};
	};
} foreach life_wanted_list;
[_list] remoteExec ["life_fnc_wantedList",_ret];
