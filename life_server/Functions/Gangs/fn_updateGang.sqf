/*
    File: fn_updateGang.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Updates the gang information?
*/
params [
    ["_mode",0,[0]],
    ["_group",grpNull,[grpNull]]
];

if (isNull _group) exitWith {}; //FAIL

private _groupID = _group getVariable ["gang_id",-1];
if (_groupID isEqualTo -1) exitWith {};

switch (_mode) do {
    case 0: {
        private _bank = [(_group getVariable ["gang_bank",0])] call DB_fnc_numberSafe;
        private _maxMembers = _group getVariable ["gang_maxMembers",8];
        private _members = [(_group getVariable "gang_members")] call DB_fnc_mresArray;
        private _owner = _group getVariable ["gang_owner",""];
        if (_owner isEqualTo "") exitWith {};

        private _query = format ["UPDATE gangs SET bank='%1', maxmembers='%2', owner='%3' WHERE id='%4'",_bank,_maxMembers,_owner,_groupID];
    };

    case 1: {
        private _query = format ["UPDATE gangs SET bank='%1' WHERE id='%2'",([(_group getVariable ["gang_bank",0])] call DB_fnc_numberSafe),_groupID];
    };

    case 2: {
        private _query = format ["UPDATE gangs SET maxmembers='%1' WHERE id='%2'",(_group getVariable ["gang_maxMembers",8]),_groupID];
    };

    case 3: {
        private _owner = _group getVariable ["gang_owner",""];
        if (_owner isEqualTo "") exitWith {};
        private _query = format ["UPDATE gangs SET owner='%1' WHERE id='%2'",_owner,_groupID];
    };

    case 4: {
        private _members = _group getVariable "gang_members";
        if (count _members > (_group getVariable ["gang_maxMembers",8])) then {
            _membersFinal = [];
            for "_i" from 0 to _maxMembers -1 do {
                _membersFinal pushBack (_members select _i);
            };
        } else {
            _membersFinal = _group getVariable "gang_members";
        };
        private _membersFinal = [_membersFinal] call DB_fnc_mresArray;
        private _query = format ["UPDATE gangs SET members='%1' WHERE id='%2'",_membersFinal,_groupID];
    };
};

if (!isNil "_query") then {
    [_query,1] call DB_fnc_asyncCall;
};
