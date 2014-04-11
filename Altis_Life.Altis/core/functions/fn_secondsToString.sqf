/*
	File: fn_secondsToString.sqf
	Author: Sa-Matra
	
	Description:
	Converts seconds to HH:MM:SS
*/
private ["_h", "_m", "_s","_time"];
_h = floor(_this / 3600);
_m = floor((_this % 3600) / 60);
_s = floor(_this % 60);

if(_s < 10) then {_s = format["0%1", _s]} else {_s};
if(_m < 10) then {_m = format["0%1", _m]} else {_m};
if(_h > 0) then {
	format["%1:%2:%3", _h, _m, _s];
} else {
	format["%1:%2", _m, _s];
};