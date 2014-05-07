/*
	File: fn_silentSync.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Receives the silent sync and sends the query.
*/
private["_uid","_side","_cash","_bank","_gear","_query","_thread"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,civilian,[sideUnknown]] call BIS_fnc_param;
_cash = [_this,2,0,[0]] call BIS_fnc_param;
_bank = [_this,3,2500,[0]] call BIS_fnc_param;
_gear = [_this,4,[],[[]]] call BIS_fnc_param;

if(_uid == "") exitWith {};

//Is the headless client active? If so let him take over.
if(!isNil "hc_1" && {life_HC_isActive}) exitWith {
	private["_packet"];
	_packet = _this;
	[_packet,"HC_fnc_silentSync",(owner hc_1),FALSE] spawn BIS_fnc_MP;
};

_cash = [_cash] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;
_gear = [_gear] call DB_fnc_mresArray;

switch(_side) do
{
	case west: {
		_query = format["UPDATE players SET cash='%1', bankacc='%2', cop_gear='%3' WHERE playerid='%4'",_cash,_bank,_gear,_uid];
	};
	
	case civilian: {
		_query = format["UPDATE players SET cash='%1', bankacc='%2', civ_gear='%3' WHERE playerid='%4'",_cash,_bank,_gear,_uid];
	};
	
	case independent: {
		_query = format["UPDATE players SET cash='%1', bankacc='%2' WHERE playerid='%3'",_cash,_bank,_uid];
	};
};

//Execute SQL Statement

waitUntil {!DB_Async_Active};
_thread = [_query,false] spawn DB_fnc_asyncCall;
waitUntil {scriptDone _thread};

//_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];