/*
    File: fn_updateRequest.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Updates ALL player information in the database.
    Information gets passed here from the client side file: core\session\fn_updateRequest.sqf
*/

params [
    ["_uid", "", [""]],
    ["_name", "", [""]],
    ["_side", sideUnknown, [civilian]],
    ["_cash", 0, [0]],
    ["_bank", 5000, [0]],
    ["_licenses", [], [[]]],
    ["_gear", [], [[]]],
    ["_stats", [100,100],[[]]],
    ["_arrested", false, [true]],
    ["_alive", false, [true]],
    ["_position", [], [[]]]
];

//Get to those error checks.
if (_uid isEqualTo "" || {_name isEqualTo ""}) exitWith {};

//Setup some data.
_position = if (_side isEqualTo civilian) then {_position} else {[]};
_arrested = [0, 1] select _arrested;
_alive = [0, 1] select _alive;

for "_i" from 0 to (count _licenses) -1 do {
    (_licenses select _i) params ["_license", "_owned"];
    _licenses set[_i, [_license, [0, 1] select _owned]];
};

//PLAYTIME
_playtime = [_uid] call HC_fnc_getPlayTime;
_playtime_update = [];
{
    if ((_x select 0) isEqualTo _uid) exitWith
    {
        _playtime_update pushBack [_x select 1];
    };
} forEach TON_fnc_playtime_values_request;
_playtime_update = (_playtime_update select 0) select 0;
switch (_side) do {
    case west: {_playtime_update set[0,_playtime];};
    case civilian: {_playtime_update set[2,_playtime];};
    case independent: {_playtime_update set[1,_playtime];};
};

private _query = switch (_side) do {
    case west: {format ["updateWest:%1:%2:%3:%4:%5:%6:%7:%8", _name, _cash, _bank, _gear, _licenses, _stats, _playtime_update, _uid];};
    case civilian: {format ["updateCiv:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11", _name, _cash, _bank, _licenses, _gear, _arrested, _stats, _alive, _position, _playtime_update, _uid];};
    case independent: {format ["updateIndep:%1:%2:%3:%4:%5:%6:%7:%8", _name, _cash, _bank, _licenses, _gear, _stats, _playtime_update, _uid];};
};


_queryResult = [_query, 1] call HC_fnc_asyncCall;
