private ["_params","_script"];

_params = [];
_script = [_this,0,"",["",[]]] call bis_fnc_param;

if (typename _script == typename []) then {
	_params = [_this,0,[]] call bis_fnc_param;
	_script = [_this,1,"",[""]] call bis_fnc_param;
};

_params execvm _script