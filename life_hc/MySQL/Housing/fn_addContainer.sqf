#include "\life_hc\hc_macros.hpp"
/*
    File: fn_addContainer.sqf
    Author: NiiRoZz

    This file is for Nanou's HeadlessClient.

    Description:
    Add container in Database.
*/

params [
    ["_uid", "", [""]],
    ["_container", objNull, [objNull]]
];

if (isNull _container || {_uid isEqualTo ""}) exitWith {};

private _containerPos = getPosATL _container;
private _className = typeOf _container;
private _dir = [vectorDir _container, vectorUp _container];

private _query = format ["insertContainer:%1:%2:%3:%4", _uid, _containerPos, _className, _dir];
[_query, 1] call HC_fnc_asyncCall;

uiSleep 0.3;

_query = format ["selectContainerID:%1:%2", _containerPos, _uid];
_queryResult = [_query, 2] call HC_fnc_asyncCall;
_container setVariable ["container_id", _queryResult select 0, true];
