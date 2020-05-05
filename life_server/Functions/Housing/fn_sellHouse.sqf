/*
    File: fn_sellHouse.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Used in selling the house, sets the owned to 0 and will cleanup with a
    stored procedure on restart.
*/

params [
    ["_house", objNull, [objNull]]
];

if (isNull _house) exitWith {systemChat ":SERVER:sellHouse: House is null";};
private _houseID = _house getVariable ["house_id", -1];

private "_query";

if (_houseID isEqualTo -1) then {
    private _housePos = getPosATL _house;
    private _ownerID = (_house getVariable "house_owner") select 0;
    _query = format ["deleteHouse:%1:%2", _ownerID, _housePos];
} else {
    _query = format ["deleteHouse1:%1", _houseID];
};

_house setVariable ["house_id", nil, true];
_house setVariable ["house_owner", nil, true];
_house setVariable ["garageBought", false, true];

[_query, 1] call DB_fnc_asyncCall;
_house setVariable ["house_sold", nil, true];
["deleteOldHouses", 1] call DB_fnc_asyncCall;
