/*
    File: fn_wantedPerson.sqf
    Author: Bryan "Tonic" Boardwine"
    Database Persistence By: ColinM
    Assistance by: Paronity
    Stress Tests by: Midgetgrimm

    Description:
    Fetches a specific person from the wanted array.
*/
private["_unit","_index","_queryResult","_result"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if (isNull _unit) exitWith {[]};
_uid = getPlayerUID player;

_query = format["SELECT wantedID, wantedName, wantedBounty FROM wanted WHERE active='1' AND wantedID='%1'",_uid];
_queryResult = [_query,2] call DB_fnc_asyncCall;
if (count _queryResult isEqualTo 0) exitWith {[]};
_queryResult;
