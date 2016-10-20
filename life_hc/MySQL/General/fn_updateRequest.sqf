/*
    File: fn_updateRequest.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Updates ALL player information in the database.
    Information gets passed here from the client side file: core\session\fn_updateRequest.sqf
*/
private ["_uid","_side","_cash","_bank","_licenses","_gear","_stats","_name","_alive","_position","_query"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_side = [_this,2,sideUnknown,[civilian]] call BIS_fnc_param;
_cash = [_this,3,0,[0]] call BIS_fnc_param;
_bank = [_this,4,5000,[0]] call BIS_fnc_param;
_licenses = [_this,5,[],[[]]] call BIS_fnc_param;
_gear = [_this,6,[],[[]]] call BIS_fnc_param;
_stats = [_this,7,[100,100],[[]]] call BIS_fnc_param;
_alive = [_this,9,false,[true]] call BIS_fnc_param;
_position = [_this,10,[],[[]]] call BIS_fnc_param;

//Get to those error checks.
if ((_uid isEqualTo "") || (_name isEqualTo "")) exitWith {};

//Parse and setup some data.
_name = [_name] call HC_fnc_mresString;
_gear = [_gear] call HC_fnc_mresArray;
_stats = [_stats] call HC_fnc_mresArray;
_cash = [_cash] call HC_fnc_numberSafe;
_bank = [_bank] call HC_fnc_numberSafe;
_position = if (_side isEqualTo civilian) then {[_position] call HC_fnc_mresArray} else {[]};

//Does something license related but I can't remember I only know it's important?
for "_i" from 0 to count(_licenses)-1 do {
    _bool = [(_licenses select _i) select 1] call HC_fnc_bool;
    _licenses set[_i,[(_licenses select _i) select 0,_bool]];
};

_licenses = [_licenses] call HC_fnc_mresArray;

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
_playtime_update = [_playtime_update] call HC_fnc_mresArray;

switch (_side) do {
    case west: {_query = format ["UPDATE players SET name='%1', cash='%2', bankacc='%3', cop_gear='%4', cop_licenses='%5', cop_stats='%6', playtime='%7' WHERE pid='%8'",_name,_cash,_bank,_gear,_licenses,_stats,_playtime_update,_uid];};
    case civilian: {_query = format ["UPDATE players SET name='%1', cash='%2', bankacc='%3', civ_licenses='%4', civ_gear='%5', arrested='%6', civ_stats='%7', civ_alive='%8', civ_position='%9', playtime='%10' WHERE pid='%11'",_name,_cash,_bank,_licenses,_gear,[_this select 8] call HC_fnc_bool,_stats,[_alive] call HC_fnc_bool,_position,_playtime_update,_uid];};
    case independent: {_query = format ["UPDATE players SET name='%1', cash='%2', bankacc='%3', med_licenses='%4', med_gear='%5', med_stats='%6', playtime='%7' WHERE pid='%8'",_name,_cash,_bank,_licenses,_gear,_stats,_playtime_update,_uid];};
};

_queryResult = [_query,1] call HC_fnc_asyncCall;
