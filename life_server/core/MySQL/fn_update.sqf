/*
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

_name = [_name] call DB_fnc_mresString; //Clense the name of bad chars.

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