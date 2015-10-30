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
private["_queryStmt","_queryResult","_key","_mode","_return","_loop"];

_queryStmt = param [0,"",[""]];
_mode = param [1,1,[0]];
_multiarr = param [2,false,[false]];

_key = "extDB2" callExtension format["%1:%2:%3",_mode,(call life_sql_id),_queryStmt];

if(_mode == 1) exitWith {true};

_key = call compile format["%1",_key];
_key = _key select 1;

// Get Result via 4:x (single message return)  v19 and later
_queryResult = "";
_loop = true;
while{_loop} do
{
  _queryResult = "extDB2" callExtension format["4:%1", _key];

  if (_queryResult isEqualTo "[5]") then {
    // extDB2 returned that result is Multi-Part Message
    _queryResult = "";
    while{true} do {
      _pipe = "extDB2" callExtension format["5:%1", _key];
      if(_pipe == "") exitWith {_loop = false};
        _queryResult = _queryResult + _pipe;
      };
  } else {
    if (_queryResult isEqualTo "[3]") then
    {
      diag_log format ["extDB2: uisleep [4]: %1", diag_tickTime];
      uisleep 0.1;
    } else {
      _loop = false;
    };
  };
};
_queryResult = call compile _queryResult;
if ((_queryResult select 0) isEqualTo 0) exitWith {diag_log format ["extDB2: Protocol Error: %1", _queryResult]; []};
_return = (_queryResult select 1);
if(!_multiarr && count _return > 0) then
{
  _return = _return select 0;
};

_return;
