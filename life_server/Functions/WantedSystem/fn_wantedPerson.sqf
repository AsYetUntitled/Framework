/*
    File: fn_wantedPerson.sqf
    Author: Bryan "Tonic" Boardwine"
    Database Persistence By: ColinM
    Assistance by: Paronity
    Stress Tests by: Midgetgrimm

    Description:
    Fetches a specific person from the wanted array.
*/

params [
    ["_unit", objNull, [objNull]]
];

if (isNull _unit) exitWith {[]};

private _uid = getPlayerUID _unit;
private _query = format ["selectWantedBounty:%1", _uid];
private _queryResult = [_query,2] call DB_fnc_asyncCall;

if (_queryResult isEqualTo []) exitWith {[]};
_queryResult;
