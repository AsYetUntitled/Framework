private ["_params","_fsm"];

_params = [];
_fsm = [_this,0,"",["",[]]] call bis_fnc_param;

if (typename _fsm == typename []) then {
	_params = [_this,0,[]] call bis_fnc_param;
	_fsm = [_this,1,"",[""]] call bis_fnc_param;

};

_params execfsm _fsm