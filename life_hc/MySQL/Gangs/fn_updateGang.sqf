#include "\life_hc\hc_macros.hpp"
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
        [getPlayerUID _unit,side _unit,_cash,0] call HC_fnc_updatePartial;
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
