/*
	File: fn_mresToArray.sqf
	Author: Bryan "Tonic" Boardwine";
	
	Description:
	Acts as a mres (MySQL Real Escape) for arrays so they
	can be properly inserted into the database without causing
	any problems. The return method is 'hacky' but it's effective.
*/
private["_array"];
_array = [_this,0,"",[""]] call BIS_fnc_param;
if(_array == "") exitWith {[]};
_array = toArray(_array);

for "_i" from 0 to (count _array)-1 do
{
	_sel = _array select _i;
	if(_sel == 96) then
	{
		_array set[_i,39];
	};
};

_array = toString(_array);
_array = call compile format["%1", _array];
_array;