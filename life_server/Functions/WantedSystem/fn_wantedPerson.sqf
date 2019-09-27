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
    ["_unit",objNull,[objNull]]
];
if (isNull _unit) exitWith {};

private _uid = getPlayerUID _unit;
private _queryResult = [format ["SELECT wantedID, wantedName, wantedBounty FROM wanted WHERE active='1' AND wantedID='%1'",_uid],2] call DB_fnc_asyncCall;

if (count _queryResult isEqualTo 0) exitWith {[]};
_queryResult;
