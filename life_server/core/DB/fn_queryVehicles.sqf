/*
	File: fn_queryVehicles.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Queries all vehicles from the database with a specific type, pid and side and returns them.
*/
private["_pid","_side","_type","_query","_result","_ret"];
_pid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[west]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;

if(_pid == "" OR _side == sideUnknown OR _type == "") exitWith {[]};

_side = switch(_side) do
{
	case west:{"cop"};
	case civilian: {"civ"};
	default {"Error"};
};
_query = format["SELECT * FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND side='%2' AND type='%3'",_pid,_side,_type];
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life', '%1']", _query];
_result = call compile format["%1", _result];
if(isNil {((_result select 0) select 0)}) then
{
	_ret = [];
}
	else
{
	_ret = (_result select 0);
};

_ret;
