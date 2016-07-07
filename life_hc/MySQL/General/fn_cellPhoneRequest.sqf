/*
    Author: GetSomePanda / Panda
    SteamID: 76561198145366418
    File Name: fn_cellPhoneRequest.sqf
    Information: Get phone information from db.
    
    HC SIDE
*/
private["_queryResult","_query","_player","_playerName","_playerUid","_cleanMsgs"];

_player = _this select 0;
_playerName = name _player;
_playerUid = getPlayerUid _player;

_query = format["SELECT pid, playerName, messages FROM cellphone WHERE pid='%1'",_playerUid];

_queryResult = [_query,2] call HC_fnc_asyncCall;

if(typeName _queryResult == "STRING") exitWith 
{
    _cleanMsgs = [(_queryResult select 2)] call HC_fnc_mresToArray;
    _queryResult set[2,_cleanMsgs];
    [_queryResult] remoteExecCall ["life_fnc_setupCellPhone",(owner _player)];
};

if(count _queryResult != 0) exitWith 
{
    _cleanMsgs = [(_queryResult select 2)] call HC_fnc_mresToArray;
    _queryResult set[2,_cleanMsgs];
    [_queryResult] remoteExecCall ["life_fnc_setupCellPhone",(owner _player)];
};

_query = format["INSERT INTO cellphone (pid, playerName, messages) VALUES('%1', '%2', '""[]""')",
    _playerUid,
    _playerName
];

[_query,1] call HC_fnc_asyncCall;
_queryResult = [];
[_queryResult] remoteExecCall ["life_fnc_setupCellPhone",(owner _player)];
