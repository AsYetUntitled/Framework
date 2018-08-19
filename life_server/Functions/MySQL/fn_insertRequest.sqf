#include "\life_server\script_macros.hpp"
/*
    File: fn_insertRequest.sqf
    Author: Bryan "Tonic" Boardwine

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
_tickTime = diag_tickTime;
private _queryResult = [_query, 2] call DB_fnc_asyncCall;

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Insert Query Request -------------";
    diag_log format ["QUERY: %1", _query];
    diag_log format ["Time to complete: %1 (in seconds)", (diag_tickTime - _tickTime)];
    diag_log format ["Result: %1", _queryResult];
    diag_log "------------------------------------------------";
};

//Double check to make sure the client isn't in the database...
if (_queryResult isEqualType "" && !(_queryResult isEqualTo [])) exitWith {[] remoteExecCall ["SOCK_fnc_dataQuery", (owner _returnToSender)];};

private _alias = [_name];

//Prepare the query statement..
_query = format ["insertNewPlayer:%1:%2:%3:%4:%5",
    _uid,
    _name,
    _money,
    _bank,
    _alias
];

[_query, 1] call DB_fnc_asyncCall;
[] remoteExecCall ["SOCK_fnc_dataQuery", (owner _returnToSender)];
