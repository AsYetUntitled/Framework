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

if (_uid isEqualTo "" || {isNull _house} || {_mode isEqualTo -1}) exitWith {};

private _housePos = getPosATL _house;

private _garage = ['0', '1'] select _mode;
private _query = format ["UPDATE houses SET garage='%1' WHERE pid='%2' AND pos='%3'", _garage, _uid, _housePos];

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log format ["Query: %1",_query];
};

[_query,1] call DB_fnc_asyncCall;