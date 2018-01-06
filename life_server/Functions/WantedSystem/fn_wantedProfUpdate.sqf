#include "\life_server\script_macros.hpp"
/*
    File: fn_wantedProfUpdate.sqf
    Author: [midgetgrimm]
    Persistence by: ColinM
    Description:
    Updates name of player if they change profiles
*/

params [
    ["_uid","",[""]],
    ["_name","",[""]]
];

//Bad data check
if (_uid isEqualTo "" || {_name isEqualTo ""}) exitWith {};

private _wantedCheck = format ["selectWantedName:%1", _uid];
private _wantedQuery = [_wantedCheck, 2] call DB_fnc_asyncCall;
if (_wantedQuery isEqualTo []) exitWith {};

if !(_name isEqualTo (_wantedQuery select 0)) then {
    private _query = format ["updateWantedName:%1:%2", _name, _uid];
    [_query, 2] call DB_fnc_asyncCall;
};
