/*
    File: fn_wantedAdd.sqf
    Author: Bryan "Tonic" Boardwine"
    Database Persistence By: ColinM
    Assistance by: Paronity
    Stress Tests by: Midgetgrimm

    This file is for Nanou's HeadlessClient.

    Description:
    Adds or appends a unit to the wanted list.
*/

params [
    ["_uid","",[""]],
    ["_name","",[""]],
    ["_type","",[""]],
    ["_customBounty",-1,[0]]
];

if (_uid isEqualTo "" || {_type isEqualTo ""} || {_name isEqualTo ""}) exitWith {}; //Bad data passed.

//What is the crime?
private _crimesConfig = getArray(missionConfigFile >> "Life_Settings" >> "crimes");
private _index = [_type, _crimesConfig] call life_util_fnc_index;

if (_index isEqualTo -1) exitWith {};

_type = [_type, parseNumber ((_crimesConfig select _index) select 1)];

if (_type isEqualTo []) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if !(_customBounty isEqualTo -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.

private _query = format ["selectWantedID:%1", _uid];
private _queryResult = [_query,2,true] call HC_fnc_asyncCall;
private _val = _type select 1;
private _number = _type select 0;

if !(_queryResult isEqualTo []) then {
    _query = format ["selectWantedCrimes:%1", _uid];
    _queryResult = [_query,2] call HC_fnc_asyncCall;
    _pastCrimes = _queryResult select 0;

    if (_pastCrimes isEqualType "") then {_pastCrimes = call compile format ["%1", _pastCrimes];};
    _pastCrimes pushBack _number;
    _query = format ["updateWanted:%1:%2:%3", _pastCrimes, _val, _uid];
    [_query,1] call HC_fnc_asyncCall;
} else {
    _crime = [_type select 0];
    _query = format ["insertWanted:%1:%2:%3:%4", _uid, _name, _crime, _val];
    [_query,1] call HC_fnc_asyncCall;
};
