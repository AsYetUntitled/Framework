#include "\life_server\script_macros.hpp"
/*
    File: fn_houseGarage.sqf
    Author: BoGuu
    Description:
    Database functionality for house garages.
*/

params [
    ["_uid","",[""]],
    ["_house",objNull,[objNull]],
    ["_mode",-1,[0]]
];

if (_uid isEqualTo "") exitWith {};
if (isNull _house) exitWith {};
if (_mode isEqualTo -1) exitWith {};

private _housePos = getPosATL _house;
private "_query";

if (_mode isEqualTo 0) then {
    _query = format ["UPDATE houses SET garage='1' WHERE pid='%1' AND pos='%2'",_uid,_housePos];
} else {
    _query = format ["UPDATE houses SET garage='0' WHERE pid='%1' AND pos='%2'",_uid,_housePos];
};

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log format ["Query: %1",_query];
};

[_query,1] call DB_fnc_asyncCall;