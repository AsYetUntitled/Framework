/*
	File: fn_queryRequest.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles the incoming request and sends an asynchronous query 
	request to the database.
	
	Return:
	ARRAY - If array has 0 elements it should be handled as an error in client-side files.
	STRING - The request had invalid handles or an unknown error and is logged to the RPT.
*/
private["_uid","_side","_query","_return","_queryResult","_qResult","_handler","_thread"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
_ownerID = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _ownerID) exitWith {};
_ownerID = owner _ownerID;
//if(_uid == "" || _side == sideUnknown) exitWith {"The UID or side passed had invalid inputs."};

_handler = {
	private["_thread"];
	_thread = [_this select 0,true,_this select 1] spawn DB_fnc_asyncCall;
	waitUntil {scriptDone _thread};
};

//compile our query request
_query = switch(_side) do {
	case west: {format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, cop_licenses, coplevel, cop_gear, blacklist FROM players WHERE playerid='%1'",_uid];};
	case civilian: {format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, civ_licenses, arrested, civ_gear FROM players WHERE playerid='%1'",_uid];};
	case independent: {format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, med_licenses, mediclevel FROM players WHERE playerid='%1'",_uid];};
};

waitUntil{!DB_Async_Active};

while {true} do {
	_thread = [_query,_uid] spawn _handler;
	waitUntil {scriptDone _thread};
	sleep 0.2;
	_queryResult = missionNamespace getVariable format["QUERY_%1",_uid];
	if(!isNil "_queryResult") exitWith {};
};

missionNamespace setVariable[format["QUERY_%1",_uid],nil]; //Unset the variable.

if(typeName _queryResult == "STRING") exitWith {
	[[],"SOCK_fnc_insertPlayerInfo",_ownerID,false,true] spawn life_fnc_MP;
};


//Parse licenses (Always index 6)
_new = [(_queryResult select 6)] call DB_fnc_mresToArray;
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
_queryResult set[6,_new];

//Convert tinyint to boolean
_old = _queryResult select 6;
for "_i" from 0 to (count _old)-1 do
{
	_data = _old select _i;
	_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
};

_queryResult set[6,_old];
//Parse data for specific side.
switch (_side) do {
	case west: {
		_new = [(_queryResult select 8)] call DB_fnc_mresToArray;
		if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
		_queryResult set[8,_new];
	};
	
	case civilian: {
		_new = [(_queryResult select 8)] call DB_fnc_mresToArray;
		if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
		_queryResult set[8,_new];
	};
};

[_queryResult,"SOCK_fnc_requestReceived",_ownerID,false] spawn life_fnc_MP;