#include "\life_hc\hc_macros.hpp"
/*
    File: fn_insertGang.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Inserts the gang into the database.
*/

params [
    ["_ownerID", objNull, [objNull]],
    ["_uid", "", [""]],
    ["_gangName", "", [""]]
];

private _group = group _ownerID;

if (isNull _ownerID || {_uid isEqualTo ""} || {_gangName isEqualTo ""}) exitWith {};

private _query = format ["selectGangID:%1", _gangName];

private _queryResult = [_query, 2] call HC_fnc_asyncCall;

//Check to see if the gang name already exists.
if !(_queryResult isEqualTo []) exitWith {
    [1, "There is already a gang created with that name please pick another name."] remoteExecCall ["life_fnc_broadcast",_ownerID];
    life_action_gangInUse = nil;
    _ownerID publicVariableClient "life_action_gangInUse";
};

private _uidLike = format["%2%1%2", _uid, "%"];
_query = format ["selectGangIDFromMembers:%1", _uidLike];

_queryResult = [_query, 2] call HC_fnc_asyncCall;

//Check to see if this person already owns or belongs to a gang.
if (!(count _queryResult isEqualTo 0)) exitWith {
    [1,"You are currently already active in a gang, please leave the gang first."] remoteExecCall ["life_fnc_broadcast",_ownerID];
    life_action_gangInUse = nil;
    _ownerID publicVariableClient "life_action_gangInUse";
};

//Check to see if a gang with that name already exists but is inactive.
_query = format ["selectInactiveGang:%1", _gangName];

_queryResult = [_query, 2] call HC_fnc_asyncCall;
private _gangMembers = [_uid];

if !(_queryResult isEqualTo []) then {
    _query = format ["updateGang:%1:%2:%3", (_queryResult select 0), _gangMembers, _uid];
} else {
    _query = format ["insertGang:%1:%2:%3", _uid, _gangName, _gangMembers];
};

_queryResult = [_query, 1] call HC_fnc_asyncCall;

_group setVariable ["gang_name", _gangName, true];
_group setVariable ["gang_owner", _uid, true];
_group setVariable ["gang_bank", 0, true];
_group setVariable ["gang_maxMembers", 8, true];
_group setVariable ["gang_members", [_uid], true];
[_group] remoteExecCall ["life_fnc_gangCreated", _ownerID];

uiSleep 0.35;
_query = format ["selectGangIDFromOwner:%1", _uid];

_queryResult = [_query, 2] call HC_fnc_asyncCall;

_group setVariable ["gang_id", (_queryResult select 0), true];
