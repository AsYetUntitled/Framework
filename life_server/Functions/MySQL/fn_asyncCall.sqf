/*
	File: fn_asyncCall.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Commits an asynchronous call to Arma2MySQL
	
	Parameters:
		0: STRING (Query to be ran).
		1: BOOL (True to return for query's, false to not return for update/insert).
		2: STRING (Unique ID that is stored as QUERY_UNIQUEID so it can be fetched).
		3: BOOL (True to return a single array, false to return multiple entries mainly for garage).
*/
waitUntil{!DB_Async_Active};
private["_queryStmt","_queryResult","_key","_loops"];
_queryStmt = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,false,[true]] call BIS_fnc_param;

if(_queryStmt == "") exitWith {_queryStmt};
DB_Async_Active = true;

_queryResult = "";
_loops = 0;
while {true} do {
	_queryResult = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommandAsync ['%1', '%2']", (call LIFE_SCHEMA_NAME), _queryStmt];
	if(_queryResult != "") exitWith {};
	if(_loops >= 10) exitWith {}; //Why is it taking that long? ABORT!
	sleep 0.35;
	_loops = _loops + 1;
};

DB_Async_Active = false; //Unlock the async caller

if(_mode) then {
	if(_queryResult == "") exitWith {
		missionNamespace setVariable [format["QUERY_%1",_this select 2],"_LOOP_EXCEEDS_"];
	};
	
	_queryResult = call compile format["%1",_queryResult];
	if(!isnil {_this select 3}) exitWith {
		if(!(_this select 3)) then {
			missionNamespace setVariable[format["QUERY_%1",_this select 2],_queryResult select 0];
		} else {
			_queryResult = (_queryResult select 0) select 0;
			if(isNil "_queryResult") exitWith {missionNamespace setVariable[format["QUERY_%1",_this select 2],"_NO_ENTRY_"];};
			if(count _queryResult == 0) exitWith {missionNamespace setVariable[format["QUERY_%1",_this select 2],"_NO_ENTRY_"];};
			missionNamespace setVariable[format["QUERY_%1",_queryResult select 4],_queryResult];
		};
	};
	
	if(isNil {((_queryResult select 0) select 0)}) exitWith {missionNamespace setVariable[format["QUERY_%1",_this select 2],"_NO_ENTRY_"];};
	_queryResult = (_queryResult select 0) select 0;
	if(count _queryResult == 0) exitWith {missionNamespace setVariable[format["QUERY_%1",_this select 2],"_NO_ENTRY_"];};
	missionNamespace setVariable[format["QUERY_%1",_queryResult select 0],_queryResult];
};