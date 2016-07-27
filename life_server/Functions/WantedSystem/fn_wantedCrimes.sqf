#include "\life_server\script_macros.hpp"
/*
    File: fn_wantedCrimes.sqf
    Author: ColinM
    Assistance by: Paronity
    Stress Tests by: Midgetgrimm

    Description:
    Grabs a list of crimes committed by a person.
*/
private["_display","_criminal","_tab","_queryResult","_result","_ret","_crimesDb","_crimesArr","_type"];
disableSerialization;
_ret = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_criminal = [_this,1,[],[]] call BIS_fnc_param;

_query = format["SELECT wantedCrimes, wantedBounty FROM wanted WHERE active='1' AND wantedID='%1'",_criminal select 0];
_queryResult = [_query,2] call DB_fnc_asyncCall;

_ret = owner _ret;
_crimesArr = [];

_type = [_queryResult select 0] call DB_fnc_mresToArray;
if (_type isEqualType "") then {_type = call compile format["%1", _type];};
_crimesArr = [];

{
    _str = format ["STR_Crime_%1", _x]; 
    0 = _crimesArr pushBack _str; 
} count _type;

_queryResult set[0,_crimesArr];

[_queryResult] remoteExec ["life_fnc_wantedInfo",_ret];