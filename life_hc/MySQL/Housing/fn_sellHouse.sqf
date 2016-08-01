/*
    File: fn_sellHouse.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Used in selling the house, sets the owned to 0 and will cleanup with a
    stored procedure on restart.
*/
private ["_house","_houseID","_ownerID","_housePos","_query","_radius","_containers"];
_house = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (isNull _house) exitWith {};

_houseID = _house getVariable ["house_id",-1];
if (_houseID isEqualTo -1) then {
    _housePos = getPosATL _house;
    _ownerID = (_house getVariable "house_owner") select 0;
    _query = format ["UPDATE houses SET owned='0', pos='[]' WHERE pid='%1' AND pos='%2' AND owned='1'",_ownerID,_housePos];
} else {
    _query = format ["UPDATE houses SET owned='0', pos='[]' WHERE id='%1'",_houseID];
};

_house setVariable ["house_id",nil,true];
_house setVariable ["house_owner",nil,true];

[_query,1] call HC_fnc_asyncCall;
_house setVariable ["house_sold",nil,true];
["CALL deleteOldHouses",1] call HC_fnc_asyncCall;