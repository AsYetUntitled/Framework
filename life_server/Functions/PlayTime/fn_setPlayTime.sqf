/*
		File : fn_setPlayTime.sqf
		Author : NiiRoZz

		Description :
		Sets gathered time of player

		GATHERED - Loaded from DB and NOT changed
		JOIN - Time, the player joined - the newly gathered playtime will be calculated using difference

*/

private["_uid", "_time_gathered"];

_uid = _this select 0;
_time_gathered = _this select 1;
_time_gathered = (_time_gathered*60);

//create value using get
[_uid] call TON_fnc_getPlayTime;

//set value no 1
{
	if((_x select 0) == _uid) exitWith
	{
		_x set [1, _time_gathered];
		_x set [2, time];
	};
} foreach TON_fnc_playtime_values;
