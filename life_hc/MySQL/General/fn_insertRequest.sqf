#include "\life_hc\hc_macros.hpp"
/*
	File: fn_insertRequest.sqf
	Author: Bryan "Tonic" Boardwine

	This file is for Nanou's HeadlessClient.
	
	Description:
	Does something with inserting... Don't have time for
	descriptions... Need to write it...
*/
private["_handler","_thread","_queryResult","_query","_alias"];
params [
	"_uid",
	"_name",
	["_money",0],
	["_bank",2500],
	["_returnToSender",objNull,[objNull]]
];

//Error checks
if((_uid == "") OR (_name == "")) exitWith {};
if(isNull _returnToSender) exitWith {};

_query = format["SELECT playerid, name FROM players WHERE playerid='%1'",_uid];

_tickTime = diag_tickTime;
_queryResult = [_query,2] call HC_fnc_asyncCall;

//Double check to make sure the client isn't in the database...
if(typeName _queryResult == "STRING") exitWith {[] remoteExecCall ["SOCK_fnc_dataQuery",_returnToSender];}; //There was an entry!
if(count _queryResult != 0) exitWith {[] remoteExecCall ["SOCK_fnc_dataQuery",_returnToSender];};

//Clense and prepare some information.
_name = [_name] call HC_fnc_mresString; //Clense the name of bad chars.
_alias = [[_name]] call HC_fnc_mresArray;
_money = [_money] call HC_fnc_numberSafe;
_bank = [_bank] call HC_fnc_numberSafe;

//Prepare the query statement..
_query = format["INSERT INTO players (playerid, name, cash, bankacc, aliases, cop_licenses, med_licenses, civ_licenses, civ_gear, cop_gear, med_gear) VALUES('%1', '%2', '%3', '%4', '%5','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""')",
	_uid,
	_name,
	_money,
	_bank,
	_alias
];

[_query,1] call HC_fnc_asyncCall;
[] remoteExecCall ["SOCK_fnc_dataQuery",_returnToSender];
