/*
	File: fn_insertRequest.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something with inserting... Don't have time for
	descriptions... Need to write it...
*/
private["_uid","_name","_side","_money","_bank","_licenses","_handler","_thread","_queryResult","_query","_alias"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_money = [_this,2,0,[""]] call BIS_fnc_param;
_bank = [_this,3,2500,[""]] call BIS_fnc_param;
_returnToSender = [_this,4,ObjNull,[ObjNull]] call BIS_fnc_param;

_handler = {
	private["_thread"];
	_thread = [_this select 0,true,_this select 1] spawn DB_fnc_asyncCall;
	waitUntil {scriptDone _thread};
};

//Error checks
if((_uid == "") OR (_name == "")) exitWith {systemChat "Bad UID or name";}; //Let the client be 'lost' in 'transaction'
if(isNull _returnToSender) exitWith {systemChat "ReturnToSender is Null!";}; //No one to send this to!

_query = format["SELECT playerid, name FROM players WHERE playerid='%1'",_uid];

waitUntil{!DB_Async_Active}; //Wait for an available chance..
while {true} do {
	_thread = [_query,_uid] spawn _handler;
	waitUntil {scriptDone _thread};
	sleep 0.2;
	_queryResult = missionNamespace getVariable format["QUERY_%1",_uid];
	if(!isNil "_queryResult") exitWith {};
};

missionNamespace setVariable [format["QUERY_%1",_uid],nil]; //Unset the variable.

//Double check to make sure the client isn't in the database...
if(typeName _queryResult != "STRING") exitWith {[[],"SOCK_fnc_dataQuery",(owner _returnToSender),false] spawn life_fnc_MP;}; //There was an entry!

//Clense and prepare some information.
_name = [_name] call DB_fnc_mresString; //Clense the name of bad chars.
_alias = [[_name]] call DB_fnc_mresArray;
_money = [_money] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;

//Prepare the query statement..
_query = format["INSERT INTO players (playerid, name, cash, bankacc, aliases, cop_licenses, med_licenses, civ_licenses, civ_gear, cop_gear) VALUES('%1', '%2', '%3', '%4', '%5','""[]""','""[]""','""[]""','""[]""','""[]""')",
	_uid,
	_name,
	_money,
	_bank,
	_alias
];

waitUntil {!DB_Async_Active};
_thread = [_query,false] spawn DB_fnc_asyncCall;
waitUntil {scriptDone _thread};
[[],"SOCK_fnc_dataQuery",(owner _returnToSender),false] spawn life_fnc_MP;