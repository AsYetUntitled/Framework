/*
	File: fn_queryVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Queries the database and checks if the selected vehicle is able to be called.
*/
private["_vid","_pid","_query","_result","_ret"];
_vid = [_this,0,-1,[0]] call BIS_fnc_param;
_pid = [_this,1,"",[""]] call BIS_fnc_param;

if(_vid == -1 OR _pid == "") exitWith {[]};
_ret = [];

_query = format["SELECT * FROM vehicles WHERE id='%1' AND pid='%2'",_vid,_pid];
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life', '%1']", _query];
_result = call compile format["%1", _result];
if(isNil {((_result select 0) select 0)}) then
{
	_ret = [];
}
	else
{
	_ret = ((_result select 0) select 0);
};

_ret;