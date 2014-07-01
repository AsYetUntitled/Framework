_code = [_this,0,{},[{}]] call bis_fnc_param;
_codeVar = "BIS_fnc_initPlayable_code" + str (["BIS_fnc_initPlayable_code",1] call bis_fnc_counter);

//--- Execute on JIPped
_exec = compile format [
	"
		_unit = _this select 0;
		if !(_unit getvariable ['%1',false]) then {
			_function = missionnamespace getvariable ['%1',{}];
			[_unit] spawn _function;
			_unit setvariable ['%1',true,true];
		};

	",
	_codeVar
];
missionnamespace setvariable [_codeVar,_code];
_exec call bis_fnc_onPlayerConnected;

//--- Execute on existing
{
	[_x] spawn _exec;
} foreach (playableunits + switchableunits);