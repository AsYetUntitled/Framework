#include "..\..\script_macros.hpp"
/*
    File: fn_sellHouse.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : NiiRoZz

    Description:
    Sells the house and delete all container near house.
*/
private["_house","_uid","_action","_houseCfg"];
_house = param [0,ObjNull,[ObjNull]];
_uid = getPlayerUID player;

if (isNull _house) exitWith {};
if (!(_house isKindOf "House_F")) exitWith {};
if (isNil {_house getVariable "house_owner"}) exitWith {hint localize "STR_House_noOwner";};
closeDialog 0;

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if (count _houseCfg isEqualTo 0) exitWith {};

_action = [
    format[localize "STR_House_SellHouseMSG",
    (round((_houseCfg select 0)/2)) call life_fnc_numberText,
    (_houseCfg select 1)],localize "STR_pInAct_SellHouse",localize "STR_Global_Sell",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {
    _house setVariable ["house_sold",true,true];

    if (life_HC_isActive) then {
        [_house] remoteExecCall ["HC_fnc_sellHouse",HC_Life];
    } else {
        [_house] remoteExecCall ["TON_fnc_sellHouse",RSERV];
    };

    _house setVariable ["locked",false,true];
    deleteMarkerLocal format["house_%1",_house getVariable "uid"];
    _house setVariable ["uid",nil,true];

    BANK = BANK + (round((_houseCfg select 0)/2));
    [1] call SOCK_fnc_updatePartial;
    _index = life_vehicles find _house;

    if (LIFE_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
        if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
            advanced_log = format ["sold a house for $%1. Bank Balance: $%2",(round((_houseCfg select 0)/2)),[BANK] call life_fnc_numberText];
        } else {
            advanced_log = format ["%1 - %2 sold a house for $%3. Bank Balance: $%4",profileName,(getPlayerUID player),(round((_houseCfg select 0)/2)),[BANK] call life_fnc_numberText];
            };
        publicVariableServer "advanced_log";
    };

    if (_index != -1) then {
        life_vehicles deleteAt _index;
    };

    _index = [str(getPosATL _house),life_houses] call TON_fnc_index;
    if (_index != -1) then {
        life_houses deleteAt _index;
    };
    _numOfDoors = FETCH_CONFIG2(getNumber,"CfgVehicles",(typeOf _house), "numberOfDoors");
    for "_i" from 1 to _numOfDoors do {
        _house setVariable [format["bis_disabled_Door_%1",_i],0,true];
    };
    _containers = _house getVariable ["containers",[]];
    if (count _containers > 0) then {
        {
            _x setVariable ["Trunk",nil,true];

            if (life_HC_isActive) then {
                [_x] remoteExecCall ["HC_fnc_sellHouseContainer",HC_Life];
            } else {
                [_x] remoteExecCall ["TON_fnc_sellHouseContainer",RSERV];
            };

        } forEach _containers;
    };
    _house setVariable ["containers",nil,true];
};
