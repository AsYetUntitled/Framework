/*
	Copyright © 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	File: fn_insert.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Inserts the player and his/her information into our MySQL Database.
*/
private["_uid","_name","_side","_money","_bank","_misc","_query","_result","_array"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_side = [_this,2,civilian,[sideUnknown]] call BIS_fnc_param;
_money = [_this,3,"0",[""]] call BIS_fnc_param;
_bank = [_this,4,"2500",[""]] call BIS_fnc_param;
_misc = [_this,5,[],[[],false]] call BIS_fnc_param;

//Error checks
if((_uid == "") OR (_name == "")) exitWith {};
_query = format["SELECT name, aliases FROM players WHERE playerid='%1'",_uid];

/*
	If result shows player was found then exit the function and check if the playername is different,
	if so then update the table with additional playernames. On a side note, this function is only to be
	called when the initial client was told there wasn't a search result found for him, if so then why
	is this being executed again?
*/
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life', '%1']", _query];
_result = call compile format["%1", _result];
if(!isNil {((_result select 0) select 0)}) exitWith
{
	_result = ((_result select 0) select 0);
	_array = (_result select 1);
	_array = [_array] call DB_fnc_mresToArray;
	_array = call compile format["%1", _array];
	if(!(_name in _array)) then
	{
		private["_aliases"];
		_aliases = _array;
		_aliases set[count _aliases, _name];
		_aliases = [_aliases] call DB_fnc_mresArray;
		_query = format["UPDATE players SET aliases='%1' WHERE playerid='%2'",_aliases,_uid];
		_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life', '%1']", _query];
	};
};

_alias = [[_name]] call DB_fnc_mresArray;
//Setup data handling by which side the player is being inserted into the database by.
switch (_side) do
{
	case west:
	{
		_misc = [_misc] call DB_fnc_mresArray;
		_query = format["INSERT INTO players (playerid, name, cash, bankacc, cop_gear, aliases) VALUES('%1', '%2', '%3', '%4', '%5', '%6')",_uid,_name,_money,_bank,_misc,_alias];
	};
	
	case civilian:
	{
		if(typeName _misc == "BOOL") then {_misc = [_misc] call DB_fnc_bool;};
		_query = format["INSERT INTO players (playerid, name, cash, bankacc, arrested, aliases, civ_gear) VALUES('%1', '%2', '%3', '%4', '%5', '%6','""[]""')",
		_uid, //1
		_name, //2 
		_money,//3
		_bank, //4
		_misc,  //5
		_alias //6
		];
	};
};

//Execute our SQL statement
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life', '%1']", _query];
waitUntil {typeName _sql == "STRING"};