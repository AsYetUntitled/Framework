/*
		File : fn_getPlayTime.sqf
		Author : NiiRoZz

		This file is for Nanou's HeadlessClient.

		Description :
		Gets playtime for player with UID

		GATHERED - Loaded from DB and NOT changed
		JOIN - Time, the player joined - the newly gathered playtime will be calculated using difference

*/
private["_uid", "_time_gathered", "_time_join","_time"];

_uid = _this select 0;
_time_gathered = -1;
_time_join = -1;

{
	if((_x select 0) == _uid) exitWith
	{
		_time_gathered = _x select 1;
		_time_join = _x select 2;
	};
} foreach TON_fnc_playtime_values;

if(_time_gathered < 0 || _time_join < 0) then
{
	_time_gathered = 0;
	_time_join = time;
	TON_fnc_playtime_values pushBack [_uid, _time_gathered, _time_join];
};

_time = (time - _time_join); //return time
_time = _time + _time_gathered;
_time = round (_time/60);

_time;
