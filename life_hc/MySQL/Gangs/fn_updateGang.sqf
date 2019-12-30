/*
    File: fn_updateGang.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Updates the gang information?
*/

params [
    ["_mode", 0, [0]],
    ["_group", grpNull, [grpNull]]
];

if (isNull _group) exitWith {}; //FAIL

private _groupID = _group getVariable ["gang_id", -1];
if (_groupID isEqualTo -1) exitWith {};

private "_query";

switch (_mode) do {
    case 0: {
        private _bank = _group getVariable ["gang_bank", 0];
        private _maxMembers = _group getVariable ["gang_maxMembers", 8];
        private _members = _group getVariable "gang_members";
        private _owner = _group getVariable ["gang_owner", ""];
        if (_owner isEqualTo "") exitWith {};

        _query = format ["updateGang1:%1:%2:%3:%4", _bank, _maxMembers, _owner, _groupID];
    };

    case 1: {
        _query = format ["updateGangBank:%1:%2", _group getVariable ["gang_bank", 0], _groupID];
    };

    case 2: {
        _query = format ["updateGangMaxmembers:%1:%2", (_group getVariable ["gang_maxMembers", 8]), _groupID];
    };

    case 3: {
        private _owner = _group getVariable ["gang_owner", ""];
        if (_owner isEqualTo "") exitWith {};
        _query = format ["updateGangOwner:%1:%2", _owner, _groupID];
    };

    case 4: {
        private _members = _group getVariable "gang_members";
        private "_membersFinal";
        if (count _members > (_group getVariable ["gang_maxMembers", 8])) then {
            _membersFinal = [];
            for "_i" from 0 to _maxMembers -1 do {
                _membersFinal pushBack (_members select _i);
            };
        } else {
            _membersFinal = _group getVariable "gang_members";
        };
        _query = format ["updateGangMembers:%1:%2", _membersFinal, _groupID];
    };
};

if (!isNil "_query") then {
    [_query, 1] call HC_fnc_asyncCall;
};
