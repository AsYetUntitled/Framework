#include "\life_server\script_macros.hpp"
/*
    File: fn_updateGang.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Updates the gang information?
*/
private ["_groupID","_bank","_maxMembers","_members","_membersFinal","_query","_owner"];
params [
    ["_mode",0,[0]],
    ["_group",grpNull,[grpNull]]
];

if (isNull _group) exitWith {}; //FAIL

_groupID = _group getVariable ["gang_id",-1];
if (_groupID isEqualTo -1) exitWith {};

switch (_mode) do {
    case 0: {
        _bank = [(_group getVariable ["gang_bank",0])] call DB_fnc_numberSafe;
        _maxMembers = _group getVariable ["gang_maxMembers",8];
        _members = [(_group getVariable "gang_members")] call DB_fnc_mresArray;
        _owner = _group getVariable ["gang_owner",""];
        if (_owner isEqualTo "") exitWith {};

        _query = format ["UPDATE gangs SET bank='%1', maxmembers='%2', owner='%3' WHERE id='%4'",_bank,_maxMembers,_owner,_groupID];
    };

    case 1: {
        params [
            "",
            "",
            ["_deposit",false,[false]],
            ["_value",0,[0]],
            ["_unit",objNull,[objNull]],
            ["_cash",0,[0]]
        ];

        private _funds = _group getVariable ["gang_bank",0];
        if (_deposit) then {
            _funds = _funds + _value;
            _group setVariable ["gang_bank",_funds,true];
            [1,"STR_ATM_DepositSuccessG",true,[_value]] remoteExecCall ["life_fnc_broadcast",remoteExecutedOwner];
            _cash = _cash - _value;
        } else {
            if (_value > _funds) exitWith {
                [1,"STR_ATM_NotEnoughFundsG",true] remoteExecCall ["life_fnc_broadcast",remoteExecutedOwner];
                breakOut "";
            };
            _funds = _funds - _value;
            _group setVariable ["gang_bank",_funds,true];
            [_value] remoteExecCall ["life_fnc_gangBankResponse",remoteExecutedOwner];
            _cash = _cash + _value;
        };
        if (LIFE_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
            if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
                diag_log (format [localize "STR_DL_ML_withdrewGang_BEF",_value,[_funds] call life_fnc_numberText,[0] call life_fnc_numberText,[_cash] call life_fnc_numberText]);
            } else {
                diag_log (format [localize "STR_DL_ML_withdrewGang",name _unit,(getPlayerUID _unit),_value,[_funds] call life_fnc_numberText,[0] call life_fnc_numberText,[_cash] call life_fnc_numberText]);
            };
        };
        _query = format ["UPDATE gangs SET bank='%1' WHERE id='%2'",([_funds] call DB_fnc_numberSafe),_groupID];
        [getPlayerUID _unit,side _unit,_cash,0] call DB_fnc_updatePartial;
    };

    case 2: {
        _query = format ["UPDATE gangs SET maxmembers='%1' WHERE id='%2'",(_group getVariable ["gang_maxMembers",8]),_groupID];
    };

    case 3: {
        _owner = _group getVariable ["gang_owner",""];
        if (_owner isEqualTo "") exitWith {};
        _query = format ["UPDATE gangs SET owner='%1' WHERE id='%2'",_owner,_groupID];
    };

    case 4: {
        _members = _group getVariable "gang_members";
        if (count _members > (_group getVariable ["gang_maxMembers",8])) then {
            _membersFinal = [];
            for "_i" from 0 to _maxMembers -1 do {
                _membersFinal pushBack (_members select _i);
            };
        } else {
            _membersFinal = _group getVariable "gang_members";
        };
        _membersFinal = [_membersFinal] call DB_fnc_mresArray;
        _query = format ["UPDATE gangs SET members='%1' WHERE id='%2'",_membersFinal,_groupID];
    };
};

if (!isNil "_query") then {
    [_query,1] call DB_fnc_asyncCall;
};
