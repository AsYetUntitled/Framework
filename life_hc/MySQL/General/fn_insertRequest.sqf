#include "\life_hc\hc_macros.hpp"
/*
    File: fn_insertRequest.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Adds a player to the database upon first joining of the server.
    Recieves information from core\sesison\fn_insertPlayerInfo.sqf
*/

params [
    "_uid",
    "_name",
    ["_money",-1,[0]],
    ["_bank",-1,[0]],
    ["_returnToSender",objNull,[objNull]]
];

//Error checks
if (_uid isEqualTo "" || {_name isEqualTo ""}) exitWith {systemChat "Bad UID or name";}; //Let the client be 'lost' in 'transaction'
if (isNull _returnToSender) exitWith {systemChat "ReturnToSender is Null!";}; //No one to send this to!

private _query = format ["checkPlayerExists:%1", _uid];
private _queryResult = [_query, 2] call HC_fnc_asyncCall;

//Double check to make sure the client isn't in the database...
if (_queryResult isEqualType "" || {!(_queryResult isEqualTo [])}) exitWith {
    [] remoteExecCall ["SOCK_fnc_dataQuery", _returnToSender];
};

private _alias = [_name];

//Prepare the query statement..
_query = format ["insertNewPlayer:%1:%2:%3:%4:%5",
    _uid,
    _name,
    _money,
    _bank,
    _alias
];

[_query, 1] call HC_fnc_asyncCall;
[] remoteExecCall ["SOCK_fnc_dataQuery", _returnToSender];
