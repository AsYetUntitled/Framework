#include "\life_server\script_macros.hpp"
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
params [
    ["_uid","",[""]],
    ["_side",sideUnknown,[civilian]],
    ["_ownerID",objNull,[objNull]]
];

if (isNull _ownerID) exitWith {};
if (LIFE_SETTINGS(getNumber,"player_deathLog") isEqualTo 1) then {
    _ownerID addMPEventHandler ["MPKilled", {_this call fn_whoDoneIt}];
};
_ownerID = owner _ownerID;
private _tickTime = diag_tickTime;
private "_queryResult";
switch (_side) do {
    // West - 11 entries returned
    case west: {_queryResult = [format ["SELECT pid, name, cash, bankacc, adminlevel, donorlevel, cop_licenses, coplevel, cop_gear, blacklist, cop_stats, playtime FROM players WHERE pid='%1'",_uid],2] call DB_fnc_asyncCall;};
    // Civilian - 12 entries returned
    case civilian: {_queryResult = [format ["SELECT pid, name, cash, bankacc, adminlevel, donorlevel, civ_licenses, arrested, civ_gear, civ_stats, civ_alive, civ_position, playtime FROM players WHERE pid='%1'",_uid],2] call DB_fnc_asyncCall;};
    // Independent - 10 entries returned
    case independent: {_queryResult = [format ["SELECT pid, name, cash, bankacc, adminlevel, donorlevel, med_licenses, mediclevel, med_gear, med_stats, playtime FROM players WHERE pid='%1'",_uid],2] call DB_fnc_asyncCall;};
};

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Client Query Request -------------";
    switch (_side) do {
        case west: {diag_log format ["QUERY: SELECT pid, name, cash, bankacc, adminlevel, donorlevel, cop_licenses, coplevel, cop_gear, blacklist, cop_stats, playtime FROM players WHERE pid='%1'",_uid];};
        case civilian: {diag_log format ["QUERY: SELECT pid, name, cash, bankacc, adminlevel, donorlevel, civ_licenses, arrested, civ_gear, civ_stats, civ_alive, civ_position, playtime FROM players WHERE pid='%1'",_uid];};
        case independent: {diag_log format ["QUERY: SELECT pid, name, cash, bankacc, adminlevel, donorlevel, med_licenses, mediclevel, med_gear, med_stats, playtime FROM players WHERE pid='%1'",_uid];};
    };
    diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
    diag_log format ["Result: %1",_queryResult];
    diag_log "------------------------------------------------";
};

if (_queryResult isEqualType "") exitWith {
    remoteExecCall ["SOCK_fnc_insertPlayerInfo",_ownerID];
};

if (count _queryResult isEqualTo 0) exitWith {
    remoteExecCall ["SOCK_fnc_insertPlayerInfo",_ownerID];
};

//Blah conversion thing from a2net->extdb
_queryResult set[2,[(_queryResult select 2)] call DB_fnc_numberSafe];
_queryResult set[3,[(_queryResult select 3)] call DB_fnc_numberSafe];

//Parse licenses (Always index 6)
private _new = [(_queryResult select 6)] call DB_fnc_mresToArray;
if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
_queryResult set[6,_new];

//Convert tinyint to boolean
private _old = _queryResult select 6;
for "_i" from 0 to (count _old)-1 do {
    _old set[_i,[(_old select _i) select 0, ([(_old select _i) select 1,1] call DB_fnc_bool)]];
};

_queryResult set[6,_old];

_new = [(_queryResult select 8)] call DB_fnc_mresToArray;
if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
_queryResult set[8,_new];
//Parse data for specific side.
switch (_side) do {
    case west: {
        _queryResult set[9,([_queryResult select 9,1] call DB_fnc_bool)];

        //Parse Stats
        _new = [(_queryResult select 10)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[10,_new];

        //Playtime
        _new = [(_queryResult select 11)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        private _index = TON_fnc_playtime_values_request find [_uid, _new];
        if (_index != -1) then {
            TON_fnc_playtime_values_request set[_index,-1];
            TON_fnc_playtime_values_request = TON_fnc_playtime_values_request - [-1];
            TON_fnc_playtime_values_request pushBack [_uid, _new];
        } else {
            TON_fnc_playtime_values_request pushBack [_uid, _new];
        };
        [_uid,_new select 0] call TON_fnc_setPlayTime;
    };

    case civilian: {
        _queryResult set[7,([_queryResult select 7,1] call DB_fnc_bool)];

        //Parse Stats
        _new = [(_queryResult select 9)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[9,_new];

        //Position
        _queryResult set[10,([_queryResult select 10,1] call DB_fnc_bool)];
        _new = [(_queryResult select 11)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[11,_new];

        //Playtime
        _new = [(_queryResult select 12)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        private _index = TON_fnc_playtime_values_request find [_uid, _new];
        if (_index != -1) then {
            TON_fnc_playtime_values_request set[_index,-1];
            TON_fnc_playtime_values_request = TON_fnc_playtime_values_request - [-1];
            TON_fnc_playtime_values_request pushBack [_uid, _new];
        } else {
            TON_fnc_playtime_values_request pushBack [_uid, _new];
        };
        [_uid,_new select 2] call TON_fnc_setPlayTime;

        /* Make sure nothing else is added under here */
        waitUntil {scriptDone (_uid spawn TON_fnc_fetchPlayerHouses)};
        _queryResult pushBack (missionNamespace getVariable [format ["houses_%1",_uid],[]]);
        waitUntil{scriptDone (_uid spawn TON_fnc_queryPlayerGang)};
        _queryResult pushBack (missionNamespace getVariable [format ["gang_%1",_uid],[]]);
    };

    case independent: {
        //Parse Stats
        _new = [(_queryResult select 9)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[9,_new];

        //Playtime
        _new = [(_queryResult select 10)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        private _index = TON_fnc_playtime_values_request find [_uid, _new];
        if !(_index isEqualTo -1) then {
            TON_fnc_playtime_values_request set[_index,-1];
            TON_fnc_playtime_values_request = TON_fnc_playtime_values_request - [-1];
            TON_fnc_playtime_values_request pushBack [_uid, _new];
        } else {
            TON_fnc_playtime_values_request pushBack [_uid, _new];
        };
        [_uid,_new select 1] call TON_fnc_setPlayTime;
    };
};

publicVariable "TON_fnc_playtime_values_request";

_queryResult pushBack (missionNamespace getVariable [format ["%1_KEYS_%2",_uid,_side],[]]);

_queryResult remoteExec ["SOCK_fnc_requestReceived",_ownerID];
