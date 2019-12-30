/*
    File: fn_queryPlayerGang.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Queries to see if the player belongs to any gang.
*/

private _pid = format ["%2%1%2", _this, "%"];
private _query = format ["selectPlayerGang:%1", _pid];
private _queryResult = [_query, 2] call DB_fnc_asyncCall;

missionNamespace setVariable [format ["gang_%1", _this], _queryResult];
