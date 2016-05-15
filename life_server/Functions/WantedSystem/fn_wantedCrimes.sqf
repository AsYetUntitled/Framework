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
_ret = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_criminal = [_this,1,[],[]] call BIS_fnc_param;

_query = format["SELECT wantedCrimes, wantedBounty FROM wanted WHERE active='1' AND wantedID='%1'",_criminal select 0];
_queryResult = [_query,2] call DB_fnc_asyncCall;

_ret = owner _ret;
_crimesArr = [];

_type = [_queryResult select 0] call DB_fnc_mresToArray;
if (_type isEqualType "") then {_type = call compile format["%1", _type];};
{
    switch (_x) do
    {
        case "187V": {_x = "STR_Crime_187V"};
        case "187": {_x = "STR_Crime_187"};
        case "901": {_x = "STR_Crime_901"};
        case "215": {_x = "STR_Crime_215"};
        case "213": {_x = "STR_Crime_213"};
        case "211": {_x = "STR_Crime_211"};
        case "207": {_x = "STR_Crime_207"};
        case "207A": {_x = "STR_Crime_207A"};
        case "390": {_x = "STR_Crime_390"};
        case "487": {_x = "STR_Crime_487"};
        case "488": {_x = "STR_Crime_488"};
        case "480": {_x = "STR_Crime_480"};
        case "481": {_x = "STR_Crime_481"};
        case "482": {_x = "STR_Crime_482"};
        case "483": {_x = "STR_Crime_483"};
        case "459": {_x = "STR_Crime_459"};
        case "666": {_x = "STR_Crime_666"};
        case "667": {_x = "STR_Crime_667"};
        case "668": {_x = "STR_Crime_668"};
        case "919": {_x = "STR_Crime_919"};
        case "919A": {_x = "STR_Crime_919A"};

        case "1": {_x = "STR_Crime_1"};
        case "2": {_x = "STR_Crime_2"};
        case "3": {_x = "STR_Crime_3"};
        case "4": {_x = "STR_Crime_4"};
        case "5": {_x = "STR_Crime_5"};
        case "6": {_x = "STR_Crime_6"};
        case "7": {_x = "STR_Crime_7"};
        case "8": {_x = "STR_Crime_8"};
        case "9": {_x = "STR_Crime_9"};
        case "10": {_x = "STR_Crime_10"};
        case "11": {_x = "STR_Crime_11"};
        case "12": {_x = "STR_Crime_12"};
        case "13": {_x = "STR_Crime_13"};
        case "14": {_x = "STR_Crime_14"};
        case "15": {_x = "STR_Crime_15"};
        case "16": {_x = "STR_Crime_16"};
        case "17": {_x = "STR_Crime_17"};
        case "18": {_x = "STR_Crime_18"};
        case "19": {_x = "STR_Crime_19"};
        case "20": {_x = "STR_Crime_20"};
        case "21": {_x = "STR_Crime_21"};
        case "22": {_x = "STR_Crime_22"};
        case "23": {_x = "STR_Crime_23"};
        case "24": {_x = "STR_Crime_24"};
        case "25": {_x = "STR_Crime_25"};
    };
    _crimesArr pushBack _x;
}forEach _type;
_queryResult set[0,_crimesArr];

[_queryResult] remoteExec ["life_fnc_wantedInfo",_ret];
