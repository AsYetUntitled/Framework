/*
	Author: Karel Moricky

	Description:
	Executes a function on server every time a player connects the mission.
	Passed arguments are [player:Object,arguments]

	Parameter(s):
		0: STRING or CODE - function variable or code to be executed
		1: ANY - optional arguments passed to the function
	
	Returns:
	BOOL
*/

private ["_function","_args","_execute"];
_args = [_this,1,[]] call bis_fnc_param;
_execute = [_this,2,false,[false]] call bis_fnc_param;

if !(_execute) then {

	if (isserver) then {
		_function = [_this,0,"",["",{}]] call bis_fnc_param;

		//--- Code input; convert to function
		if (typename _function == typename {}) then {
			private ["_code"];
			_code = _function;
			_function = "BIS_fnc_onPlayerConnected_function" + str (["BIS_fnc_onPlayerConnected_function",1] call bis_fnc_counter);
			missionnamespace setvariable [_function,_code];
		};

		//--- Register
		[
			[_function,_args,true],
			"BIS_fnc_onPlayerConnected",
			true,
			true
		] call bis_fnc_mp;
		true
	} else {
		"BIS_fnc_onPlayerConnected can be called only on server." call bis_fnc_error;
		false
	};
} else {
	_function = [_this,0,"",[""]] call bis_fnc_param;

	//--- Execute
	[
		[player,_args],
		_function,
		false,
		false
	] call bis_fnc_mp;
	true
};