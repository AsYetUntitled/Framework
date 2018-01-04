/*
    File: fn_updateRequest.sqf
    Author: Bryan "Tonic" Boardwine

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
    ["_position", [], [[]]],
];

//Get to those error checks.
if (_uid isEqualTo "" || {_name isEqualTo ""}) exitWith {};

//Parse and setup some data.
_name = [_name] call DB_fnc_mresString;
_gear = [_gear] call DB_fnc_mresArray;
_stats = [_stats] call DB_fnc_mresArray;
_cash = [_cash] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;
_position = if (_side isEqualTo civilian) then {[_position] call DB_fnc_mresArray} else {[]};

//Does something license related but I can't remember I only know it's important?
for "_i" from 0 to count(_licenses)-1 do {
    _bool = [(_licenses select _i) select 1] call DB_fnc_bool;
    _licenses set[_i,[(_licenses select _i) select 0,_bool]];
};

_licenses = [_licenses] call DB_fnc_mresArray;

//PLAYTIME
_playtime = [_uid] call TON_fnc_getPlayTime;
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
_playtime_update = [_playtime_update] call DB_fnc_mresArray;

private _query = switch (_side) do {
    case west: {format ["updateWest:%1:%2:%3:%4:%5:%6:%7:%8", _name, _cash, _bank, _gear, _licenses, _stats, _playtime_update, _uid];};
    case civilian: {format ["updateCiv:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11", _name, _cash, _bank, _licenses, _gear, [_arrested] call DB_fnc_bool, _stats, [_alive] call DB_fnc_bool, _position, _playtime_update, _uid];};
    case independent: {format ["updateIndep:%1:%2:%3:%4:%5:%6:%7:%8", _name, _cash, _bank, _licenses, _gear, _stats, _playtime_update, _uid];};
};


_queryResult = [_query, 1] call DB_fnc_asyncCall;
