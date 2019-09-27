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
if (isNull _house || _uid isEqualTo "") exitWith {};

private _housePos = getPosATL _house;

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log format ["Query: Added new house, owner: %1 at position %2",_uid,_housePos];
};

[format ["INSERT INTO houses (pid, pos, owned) VALUES('%1', '%2', '1')",_uid,_housePos],1] call DB_fnc_asyncCall;

uiSleep 0.3;

_queryResult = [format ["SELECT id FROM houses WHERE pos='%1' AND pid='%2' AND owned='1'",_housePos,_uid],2] call DB_fnc_asyncCall;
_house setVariable ["house_id",(_queryResult select 0),true];
