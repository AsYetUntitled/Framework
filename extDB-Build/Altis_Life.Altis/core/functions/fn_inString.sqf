/*
	Author: Killzone_Kid
	
	Description:
	Find a string within a string (case insensitive)
	
	Parameter(s):
	_this select 0: <string> string to be found
	_this select 1: <string> string to search in
	
	Returns:
	BooLean (true when string is found)
*/
private ["_needle","_haystack","_needleLen","_hay","_found"];
_needle = [_this, 0, "", [""]] call BIS_fnc_param;
_haystack = toArray ([_this, 1, "", [""]] call BIS_fnc_param);
_needleLen = count toArray _needle;
_hay = +_haystack; 
_hay resize _needleLen;
_found = false; 

for "_i" from _needleLen to count _haystack do {
	if (toString _hay == _needle) exitWith {_found = true};
	_hay set [_needleLen, _haystack select _i];
	_hay set [0, "x"];
	_hay = _hay - ["x"]
}; 
_found