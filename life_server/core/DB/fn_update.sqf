/*
	Copyright © 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	File: fn_update.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Update the players information in the MySQL Database
*/
private["_uid","_name","_side","_money","_bank","_licenses","_misc","_query","_result","_array","_civGear"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_side = [_this,2,civilian,[civilian]] call BIS_fnc_param;
_money = [_this,3,"0",[""]] call BIS_fnc_param;
_bank = [_this,4,"2500",[""]] call BIS_fnc_param;
_licenses = [_this,5,[],[[]]] call BIS_fnc_param;
_civGear = [_this,7,[],[[]]] call BIS_fnc_param;

switch (_side) do
{
	case west: {_misc = [_this,6,[],[[]]] call BIS_fnc_param;};
	case civilian: {_misc = [_this,6,false,[false]] call BIS_fnc_param;};
};

//Error checks
if((_uid == "") OR (_name == "")) exitWith {systemChat "MySQL: Query Request - Error uid or name is empty.";};
_query = format["SELECT name, aliases FROM players WHERE playerid='%1'",_uid];
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
_result = call compile format["%1", _result];
if(isNil {((_result select 0) select 0)}) exitWith {systemChat "MySQL: Query Request - No entries found";}; //Player not found?
_result = ((_result select 0) select 0);
//Check if the currently saved name doesn't match the playerUID and if it's not in the other used aliases.
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
	_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
};

switch (_side) do
{
	case west:
	{
		private["_air","_cg"];
		
		for "_i" from 0 to (count _licenses)-1 do
		{
			_bool = [(_licenses select _i) select 1] call DB_fnc_bool;
			_licenses set[_i,[(_licenses select _i) select 0,_bool]];
		};
		_licenses = [_licenses] call DB_fnc_mresArray;
		_misc = [_misc] call DB_fnc_mresArray;
		_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', cop_gear='%4', cop_licenses='%5' WHERE playerid='%6'",_name,_money,_bank,_misc,_licenses,_uid];
	};
	
	case civilian:
	{
		private["_car","_boat","_dive","_air","_oil","_truck","_gang","_gun","_reb","_d_h","_weed","_weed_med"];
		for "_i" from 0 to (count _licenses)-1 do
		{
			_bool = [(_licenses select _i) select 1] call DB_fnc_bool;
			_licenses set[_i,[(_licenses select _i) select 0,_bool]];
		};
		_licenses = [_licenses] call DB_fnc_mresArray;
		if(typeName _misc == "BOOL") then {_misc = [_misc] call DB_fnc_bool;};
		
		_civGear = [_civGear] call DB_fnc_mresArray;
		_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', civ_licenses='%4', civ_gear='%6', arrested='%7' WHERE playerid='%5'",
		_name,_money,_bank,_licenses,_uid,_civGear,_misc];
	};
};

//Execute SQL Statement
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];