/*
	File: fn_asyncCall.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Commits an asynchronous call to Arma2MySQL
*/
waitUntil{!DB_Async_Active};
private["_queryStmt","_queryResult","_key"];
_queryStmt = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,false,[true]] call BIS_fnc_param;

if(_queryStmt == "") exitWith {_queryStmt};
DB_Async_Active = true;

_queryResult = "";
while {true} do {
	_queryResult = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommandAsync ['%1', '%2']", (call LIFE_SCHEMA_NAME), _queryStmt];
	if(_queryResult != "") exitWith {};
	sleep 0.35;
};

DB_Async_Active = false; //Unlock the async caller

if(_mode) then {
	_queryResult = call compile format["%1",_queryResult];
	if(!isnil {_this select 3}) exitWith {
		if(!(_this select 3)) then {
			missionNamespace setVariable[format["QUERY_%1",_this select 2],_queryResult select 0];
		} else {
			_queryResult = (_queryResult select 0) select 0;
			if(count _queryResult == 0) exitWith {missionNamespace setVariable[format["QUERY_%1",_this select 2],"_NO_ENTRY_"];};
			missionNamespace setVariable[format["QUERY_%1",_queryResult select 4],_queryResult];
		};
	};
	
	if(isNil {((_queryResult select 0) select 0)}) exitWith {missionNamespace setVariable[format["QUERY_%1",_this select 2],"_NO_ENTRY_"];};
	_queryResult = (_queryResult select 0) select 0;
	if(count _queryResult == 0) exitWith {missionNamespace setVariable[format["QUERY_%1",_this select 2],"_NO_ENTRY_"];};
	missionNamespace setVariable[format["QUERY_%1",_queryResult select 0],_queryResult];
};