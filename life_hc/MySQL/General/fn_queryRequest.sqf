#include "\life_hc\hc_macros.hpp"
/*
	File: fn_queryRequest.sqf
	Author: Bryan "Tonic" Boardwine

	This file is for Nanou's HeadlessClient.

	Description:
	Handles the incoming request and sends an asynchronous query
	request to the database.

	Return:
	ARRAY - If array has 0 elements it should be handled as an error in client-side files.
	STRING - The request had invalid handles or an unknown error and is logged to the RPT.
*/
private["_uid","_side","_query","_return","_queryResult","_qResult","_handler","_thread","_tickTime","_loops","_returnCount"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
_ownerID = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _ownerID) exitWith {};

/*
	_returnCount is the count of entries we are expecting back from the async call.
	The other part is well the SQL statement.
*/
_query = switch(_side) do {
	case west: {_returnCount = 11; format["SELECT playerid, name, cash, bankacc, adminlevel, donorlevel, cop_licenses, coplevel, cop_gear, blacklist, cop_stats, playtime FROM players WHERE playerid='%1'",_uid];};
	case civilian: {_returnCount = 12; format["SELECT playerid, name, cash, bankacc, adminlevel, donorlevel, civ_licenses, arrested, civ_gear, civ_stats, civ_alive, civ_position, playtime FROM players WHERE playerid='%1'",_uid];};
	case independent: {_returnCount = 10; format["SELECT playerid, name, cash, bankacc, adminlevel, donorlevel, med_licenses, mediclevel, med_gear, med_stats, playtime FROM players WHERE playerid='%1'",_uid];};
};


_tickTime = diag_tickTime;
_queryResult = [_query,2] call HC_fnc_asyncCall;

if(typeName _queryResult == "STRING") exitWith {
	[] remoteExecCall ["SOCK_fnc_insertPlayerInfo",_ownerID];
};

if(count _queryResult == 0) exitWith {
	[] remoteExecCall ["SOCK_fnc_insertPlayerInfo",_ownerID];
};

//Blah conversion thing from a2net->extdb
private["_tmp"];
_tmp = _queryResult select 2;
_queryResult set[2,[_tmp] call HC_fnc_numberSafe];
_tmp = _queryResult select 3;
_queryResult set[3,[_tmp] call HC_fnc_numberSafe];

//Parse licenses (Always index 6)
_new = [(_queryResult select 6)] call HC_fnc_mresToArray;
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
_queryResult set[6,_new];

//Convert tinyint to boolean
_old = _queryResult select 6;
for "_i" from 0 to (count _old)-1 do
{
	_data = _old select _i;
	_old set[_i,[_data select 0, ([_data select 1,1] call HC_fnc_bool)]];
};

_queryResult set[6,_old];

_new = [(_queryResult select 8)] call HC_fnc_mresToArray;
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
_queryResult set[8,_new];
//Parse data for specific side.
switch (_side) do {
	case west: {
		_queryResult set[9,([_queryResult select 9,1] call HC_fnc_bool)];

		//Parse Stats
		_new = [(_queryResult select 10)] call HC_fnc_mresToArray;
		if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
		_queryResult set[10,_new];

		//Playtime
		_new = [(_queryResult select 11)] call HC_fnc_mresToArray;
		if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
		_index = TON_fnc_playtime_values_request find [_uid, _new];
		if(_index != -1) then {
			TON_fnc_playtime_values_request set[_index,-1];
			TON_fnc_playtime_values_request = TON_fnc_playtime_values_request - [-1];
			TON_fnc_playtime_values_request pushBack [_uid, _new];
		} else {
			TON_fnc_playtime_values_request pushBack [_uid, _new];
		};
		_new = _new select 0;
		[_uid, _new] call HC_fnc_setPlayTime;
	};

	case civilian: {
		_queryResult set[7,([_queryResult select 7,1] call HC_fnc_bool)];

		//Parse Stats
		_new = [(_queryResult select 9)] call HC_fnc_mresToArray;
		if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
		_queryResult set[9,_new];

		//Position
		_queryResult set[10,([_queryResult select 10,1] call HC_fnc_bool)];
		_new = [(_queryResult select 11)] call HC_fnc_mresToArray;
		if(typeName _new == "STRING") then {_new = call compile format["%1",_new];};
		_queryResult set[11,_new];

		//Playtime
		_new = [(_queryResult select 12)] call HC_fnc_mresToArray;
		if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
		_index = TON_fnc_playtime_values_request find [_uid, _new];
		if(_index != -1) then {
			TON_fnc_playtime_values_request set[_index,-1];
			TON_fnc_playtime_values_request = TON_fnc_playtime_values_request - [-1];
			TON_fnc_playtime_values_request pushBack [_uid, _new];
		} else {
			TON_fnc_playtime_values_request pushBack [_uid, _new];
		};
		_new = _new select 2;
		[_uid, _new] call HC_fnc_setPlayTime;

		_houseData = _uid spawn HC_fnc_fetchPlayerHouses;
		waitUntil {scriptDone _houseData};
		_queryResult pushBack (missionNamespace getVariable[format["houses_%1",_uid],[]]);
		_gangData = _uid spawn HC_fnc_queryPlayerGang;
		waitUntil{scriptDone _gangData};
		_queryResult pushBack (missionNamespace getVariable[format["gang_%1",_uid],[]]);
	};

	case independent: {
		//Parse Stats
		_new = [(_queryResult select 9)] call HC_fnc_mresToArray;
		if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
		_queryResult set[9,_new];
		//Playtime
		_new = [(_queryResult select 10)] call HC_fnc_mresToArray;
		if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
		_index = TON_fnc_playtime_values_request find [_uid, _new];
		if(_index != -1) then {
			TON_fnc_playtime_values_request set[_index,-1];
			TON_fnc_playtime_values_request = TON_fnc_playtime_values_request - [-1];
			TON_fnc_playtime_values_request pushBack [_uid, _new];
		} else {
			TON_fnc_playtime_values_request pushBack [_uid, _new];
		};
		_new = _new select 1;
		[_uid, _new] call HC_fnc_setPlayTime;
	};
};

life_keyreceived = false;
life_keyreceivedvar = [];
[_uid,_side] remoteExecCall ["TON_fnc_recupkeyforHC",RSERV];
waitUntil {life_keyreceived};
_keyArr = life_keyreceivedvar;
_queryResult set[15,_keyArr];

_queryResult remoteExec ["SOCK_fnc_requestReceived",_ownerID];
