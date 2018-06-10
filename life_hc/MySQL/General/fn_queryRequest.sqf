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

params [
    ["_uid", "", [""]],
    ["_side", sideUnknown, [civilian]],
    ["_ownerID", objNull, [objNull]]
];

if (isNull _ownerID) exitWith {};

private _query = switch (_side) do {
    // West - 11 entries returned
    case west: {format ["selectWest:%1", _uid];};
    // Civilian - 12 entries returned
    case civilian: {format ["selectCiv:%1", _uid];};
    // Independent - 10 entries returned
    case independent: {format ["selectIndep:%1",_uid];};
};

private _tickTime = diag_tickTime;
private _queryResult = [_query,2] call DB_fnc_asyncCall;

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Client Query Request -------------";
    diag_log format ["QUERY: %1",_query];
    diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
    diag_log format ["Result: %1",_queryResult];
    diag_log "------------------------------------------------";
};

if (_queryResult isEqualType "" || _queryResult isEqualTo []) exitWith {
    [] remoteExecCall ["SOCK_fnc_insertPlayerInfo",_ownerID];
};

private _licenses = _queryResult select 6;

for "_i" from 0 to (count _licenses) -1 do {
    (_licenses select _i) params ["_license", "_owned"];
    _licenses set[_i, [_license, [false, true] select _owned]];
};

private "_playTimes";

switch (_side) do {
  case civilian: {
      _queryResult set[7, [false, true] select (_queryResult select 7)];
      _queryResult set[10, [false, true] select (_queryResult select 10)];

      _playTimes = _queryResult select 12;

      /* Make sure nothing else is added under here */
      _houseData = _uid spawn TON_fnc_fetchPlayerHouses;
      waitUntil {scriptDone _houseData};
      _queryResult pushBack (missionNamespace getVariable [format ["houses_%1",_uid],[]]);
      _gangData = _uid spawn TON_fnc_queryPlayerGang;
      waitUntil {scriptDone _gangData};
      _queryResult pushBack (missionNamespace getVariable [format ["gang_%1",_uid],[]]);
  };

  case west: {
    _queryResult set[9, [false, true] select (_queryResult select 9)];
    _playTimes = _queryResult select 11;
  };

  case independent: {
    _playTimes = _queryResult select 10;
  };
};

_index = TON_fnc_playtime_values_request find [_uid, _playTimes];

if (_index != -1) then {
    TON_fnc_playtime_values_request set[_index,-1];
    TON_fnc_playtime_values_request = TON_fnc_playtime_values_request - [-1];
    TON_fnc_playtime_values_request pushBack [_uid, _playTimes];
} else {
    TON_fnc_playtime_values_request pushBack [_uid, _playTimes];
};

[_uid, _playTimes select 2] call TON_fnc_setPlayTime;
publicVariable "TON_fnc_playtime_values_request";

life_keyreceived = false;
life_keyreceivedvar = [];
[_uid, _side] remoteExecCall ["TON_fnc_recupKeyForHC", RSERV];
waitUntil {life_keyreceived};
_keyArr = life_keyreceivedvar;
_queryResult pushBack _keyArr;

_queryResult remoteExec ["SOCK_fnc_requestReceived",_ownerID];
