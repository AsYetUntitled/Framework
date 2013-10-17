/*
	Copyright © 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	File: fn_query.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Queries the MySQL data for the player information, if entry is not found
	the result will return an empty array.
*/
private["_uid","_side","_sql","_query","_old"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,civilian,[civilian]] call BIS_fnc_param;

//Error checks
if(_uid == "") exitWith {"Invalid UID"};

switch (_side) do
{
	case west:
	{
		/*
			When add new additional licenses, positions, etc to the cop side please add the rows to the database and add those rows in here and adjust the client-side receivers,
			If you do not adjust both server-side & client side receivers your new added in content will be broken and a waste of time.
		*/
		_query = format["SELECT playerid, name, cash, bankacc, coplevel, cop_licenses, cop_gear, adminlevel, blacklist FROM players WHERE playerid='%1'",_uid];
	};
	
	case civilian:
	{
		/*
			The same applies from the above statement!
		*/
		_query = format["SELECT playerid, name, cash, bankacc, civ_licenses, arrested, adminlevel, donatorlvl, civ_gear FROM players WHERE playerid='%1'",_uid];
	};
};
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life', '%1']", _query];
_sql = call compile format["%1", _sql];
if(isNil {((_sql select 0) select 0)}) then
{
	[];
}
	else
{
	_ret = ((_sql select 0) select 0);
	if(count _ret == 0) exitWith {[]};
	switch(_side) do
	{
		case west:
		{
			_new = [(_ret select 6)] call DB_fnc_mresToArray;
			if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
			_ret set[6,_new];
			_new = [(_ret select 5)] call DB_fnc_mresToArray;
			if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
			_ret set[5,_new];
			
			//Convert tinyint to boolean
			_old = _ret select 5;
			for "_i" from 0 to (count _old)-1 do
			{
				_data = _old select _i;
				_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
			};
			_ret set[5,_old];
		};
		
		case civilian:
		{
			_new = [(_ret select 8)] call DB_fnc_mresToArray;
			if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
			_ret set[8,_new];
			
			_new = [(_ret select 4)] call DB_fnc_mresToArray;
			if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
			_ret set[4,_new];
			
			//Convert tinyint to boolean
			_old = _ret select 4;
			for "_i" from 0 to (count _old)-1 do
			{
				_data = _old select _i;
				_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
			};
			
			_ret set[4,_old];
		};
	};
	_ret;
};