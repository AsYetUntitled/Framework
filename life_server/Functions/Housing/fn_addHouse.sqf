#include "\life_server\script_macros.hpp"
/*
    File: fn_addHouse.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Inserts the players newly bought house in the database.
*/

params [
    ["_uid","",[""]],
    ["_house",objNull,[objNull]]
];

if (isNull _house || {_uid isEqualTo ""}) exitWith {};

private _housePos = getPosATL _house;

private _query = format ["insertHouse:%1:%2", _uid, _housePos];
if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log format ["Query: %1",_query];
};

[_query, 1] call DB_fnc_asyncCall;

uiSleep 0.3;

_query = format ["selectHouseID:%1:%2", _housePos, _uid];
_queryResult = [_query, 2] call DB_fnc_asyncCall;
//systemChat format ["House ID assigned: %1", _queryResult select 0];
_house setVariable ["house_id", _queryResult select 0, true];
