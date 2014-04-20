/*
	File: fn_asyncCall.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Commits an asynchronous call to Arma2MySQL
*/
if(DB_Async_Active) then {
	while {DB_Async_Active} do {if(!DB_Async_Active) exitWith {};};
};

DB_Async_Active = true; //Block the rest of the SQL queue's off.
private["_queryStmt","_queryResult"];
_queryStmt = [_this,0,"",[""]] call BIS_fnc_param;
_key = [_this,1,"",[""]] call BIS_fnc_param;
if(_queryStmt == "") exitWith {_queryStmt};

_queryResult = "";
while {true} do {
	_queryResult = "Arma2Net.Unmanaged" callExtension format["Arma2NETMySQLCommandAsync ['%1', '%2']", (call LIFE_SCHEMA_NAME), _queryStmt];
	if(_queryResult != "") exitWith {};
	sleep 0.35;
};

DB_Async_Active = false; //Unlock the async caller
call compile format["%1", _queryResult];