/*
	Author: NiiRoZz
	Description:
	Search for nearby pre-built objects like trees, brushes, stone in a nearestObjects-like manner.
	Use this function carefully as it is extremely slow.

	Parameter(s):
	0: ARRAY - Position of search center
	1: ARRAY of STRINGS - Array of classname
	2: SCALAR - Search range

	Returns:
	ARRAY - Array of objects. [] if no objects were found.

	Example
	//--- Find nearby animals
	_animal = [position player, ["Sheep_random_F","Goat_random_F","Hen_random_F","Cock_random_F"], 3.5] call life_fnc_nearestObjects;

*/
private ["_position", "_types", "_range", "_objs", "_colon", "_dot", "_allOfType", "_obj", "_arr", "_start", "_name", "_end"];

_position = [_this, 0, [0,0,0], [[]], [2,3]] call BIS_fnc_param;
_types = [_this, 1, ["All"], [[]]] call BIS_fnc_param;
_range = [_this, 2, 50, [0]] call BIS_fnc_param;

_objs = nearestObjects [_position, [], _range];
_allOfType = nearestObjects [_position, _types, _range];
_colon = 58;
_dot = 46;

for '_i' from 0 to ((count _types) - 1) do {
	_types set [_i, toLower (_types select _i)];
};

{
	_obj = _x;
	if (typeOf _obj isEqualTo "") then
	{
		_arr 	= toArray str(_obj);
		_start 	= _arr find 58;
		if !(_start < 0) then
		{
			_name = [];
			_end = _arr find 46;
			for "_k" from (_start + 2) to (_end - 1) do
			{
				_name pushBack [_arr select _k];
			};
			if (((toLower (toString _name)) in _types) or ((toLower('Land_' + (toString _name))) in _types) and (!(_obj in _allOfType))) then
			{
				_allOfType pushBack _obj;
			};
		};
	};
} forEach _objs;
_allOfType
