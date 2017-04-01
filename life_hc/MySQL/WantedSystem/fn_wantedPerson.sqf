/*
    File: fn_wantedPerson.sqf
    Author: Bryan "Tonic" Boardwine"
    Database Persistence By: ColinM
    Assistance by: Paronity
    Stress Tests by: Midgetgrimm

    This file is for Nanou's HeadlessClient.

    Description:
    Fetches a specific person from the wanted array.
*/
params [
    ["_unit",objNull,[objNull]]
];

if (isNull _unit) exitWith {[]};
private _uid = getPlayerUID player;

private _query = format ["SELECT wantedID, wantedName, wantedBounty FROM wanted WHERE active='1' AND wantedID='%1'",_uid];
private _queryResult = [_query,2] call HC_fnc_asyncCall;
if (_queryResult isEqualTo []) exitWith {[]};
_queryResult;
