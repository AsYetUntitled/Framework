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
private _active = ["0", "1"] select (_mode isEqualTo 0);
private _query = format ["updateGarage:%1:%2:%3", _active, _uid, _housePos];

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log format ["Query: %1", _query];
};

[_query, 1] call DB_fnc_asyncCall;
