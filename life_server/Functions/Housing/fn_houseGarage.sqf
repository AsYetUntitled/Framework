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

if (_uid isEqualTo "" || isNull _house || _mode isEqualTo -1) exitWith {};

private _housePos = getPosATL _house;

if (_mode isEqualTo 0) then {
    [format ["UPDATE houses SET garage='1' WHERE pid='%1' AND pos='%2'",_uid,_housePos],1] call DB_fnc_asyncCall;
    if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
        diag_log format ["Query: UPDATE houses SET garage='1' WHERE pid='%1' AND pos='%2'",_uid,_housePos];
    };
} else {
    [format ["UPDATE houses SET garage='0' WHERE pid='%1' AND pos='%2'",_uid,_housePos],1] call DB_fnc_asyncCall;
    if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
        diag_log format ["Query: UPDATE houses SET garage='0' WHERE pid='%1' AND pos='%2'",_uid,_housePos];
    };
};
