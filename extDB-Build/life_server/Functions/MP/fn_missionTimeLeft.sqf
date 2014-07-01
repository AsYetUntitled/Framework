/*
	Author: Karel Moricky

	Description:
	Returns time in seconds until the mission end.
	Remaining time can be set using 'estimatedTimeLeft' command or using BIS_fnc_countdown

	Parameter(s): None
	
	Returns:
	NUMBER - time in seconds. -1 when no time was set yet.
*/

private ["_value"];
_value = [] call bis_fnc_countdown;
if (_value <= 0 && ismultiplayer) then {
	_value = if (estimatedEndServerTime != 0) then {
		((estimatedEndServerTime - servertime) max 0)
	} else {
		-1
	};
};
_value