#include "\life_server\script_macros.hpp"
/*
    File: fn_wantedCrimes.sqf
    Author: ColinM
    Assistance by: Paronity
    Stress Tests by: Midgetgrimm

    Description:
    Grabs a list of crimes committed by a person.
*/
disableSerialization;

params [
    ["_ret",objNull,[objNull]],
    ["_criminal",[],[]]
];

private _queryResult = [format ["SELECT wantedCrimes, wantedBounty FROM wanted WHERE active='1' AND wantedID='%1'",_criminal select 0],2] call DB_fnc_asyncCall;

private _type = [_queryResult select 0] call DB_fnc_mresToArray;
if (_type isEqualType "") then {_type = call compile format ["%1", _type];};

private _crimesArr = [];
{
    _crimesArr pushBack (format ["STR_Crime_%1", _x]);
    false
} count _type;

_queryResult set[0,_crimesArr];

[_queryResult] remoteExec ["life_fnc_wantedInfo", owner _ret];
