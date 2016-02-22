#include "\life_hc\hc_macros.hpp"
/*
	File: fn_asyncCall.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Commits an asynchronous call to ExtDB

	Parameters:
		0: STRING (Query to be ran).
		1: INTEGER (1 = ASYNC + not return for update/insert, 2 = ASYNC + return for query's).
		3: BOOL (True to return a single array, false to return multiple entries mainly for garage).
*/
private["_queryStmt","_mode","_multiarr","_queryResult","_key","_return","_loop"];
_queryStmt = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,1,[0]] call BIS_fnc_param;
_multiarr = [_this,2,false,[false]] call BIS_fnc_param;

_key = EXTDB format["%1:%2:%3",_mode,FETCH_CONST(life_sql_id),_queryStmt];

if(EQUAL(_mode,1)) exitWith {true};

_key = call compile format["%1",_key];
_key = SEL(_key,1);

//What the heck is going on with the double while loop? I don't remember this...
_queryResult = "";
_loop = true;
while{_loop} do {
	_queryResult = EXTDB format["4:%1", _key];
	if (EQUAL(_queryResult,"[5]")) then {
		// extDB2 returned that result is Multi-Part Message
		_queryResult = "";
		while{true} do {
			_pipe = EXTDB format["5:%1", _key];
			if(_pipe == "") exitWith {_loop = false};
			_queryResult = _queryResult + _pipe;
		};
	} else {
		if (!(EQUAL(_queryResult,"[3]"))) then {
			_loop = false;
		};
	};
};
_queryResult = call compile _queryResult;
if(EQUAL(SEL(_queryResult,0),0)) exitWith {diag_log format ["extDB2: Protocol Error: %1", _queryResult]; []};
_return = SEL(_queryResult,1);
if(!_multiarr && count _return > 0) then {
	_return = SEL(_return,0);
};

_return;
