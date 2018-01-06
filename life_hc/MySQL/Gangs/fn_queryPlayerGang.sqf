/*
    File: fn_queryPlayerGang.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Queries to see if the player belongs to any gang.
*/

private _pid = format ["%2%1%2", _this, "%"];
private _query = format ["selectPlayerGang:%1", _pid];
private _queryResult = [_query,2] call HC_fnc_asyncCall;

if !(_queryResult isEqualTo []) then {
    _tmp = [_queryResult select 5] call HC_fnc_mresToArray;
    if (_tmp isEqualType "") then {_tmp = call compile format ["%1", _tmp];};
    _queryResult set[5, _tmp];
};
missionNamespace setVariable [format ["gang_%1", _this], _queryResult];
