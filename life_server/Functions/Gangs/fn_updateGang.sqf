#include "\life_server\script_macros.hpp"
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
        [format ["UPDATE gangs SET bank='%1', maxmembers='%2', owner='%3' WHERE id='%4'",_bank,_maxMembers,_owner,_groupID],1] call DB_fnc_asyncCall;
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
        [format ["UPDATE gangs SET bank='%1' WHERE id='%2'",([_funds] call DB_fnc_numberSafe),_groupID],1] call DB_fnc_asyncCall;
        [getPlayerUID _unit,side _unit,_cash,0] call DB_fnc_updatePartial;
    };

    case 2: {
        [format ["UPDATE gangs SET maxmembers='%1' WHERE id='%2'",(_group getVariable ["gang_maxMembers",8]),_groupID],1] call DB_fnc_asyncCall;
    };

    case 3: {
        private _owner = _group getVariable ["gang_owner",""];
        if (_owner isEqualTo "") exitWith {};
        [format ["UPDATE gangs SET owner='%1' WHERE id='%2'",_owner,_groupID],1] call DB_fnc_asyncCall;
    };

    case 4: {
        private _maxMembers = _group getVariable ["gang_maxMembers",8];
        private _members = _group getVariable "gang_members";
        private _membersFinal = [];
        if (count _members > _maxMembers) then {
            for "_i" from 0 to _maxMembers -1 do {
                _membersFinal pushBack (_members select _i);
            };
        } else {
            _membersFinal = _group getVariable "gang_members";
        };
        _membersFinal = [_membersFinal] call DB_fnc_mresArray;
        [format ["UPDATE gangs SET members='%1' WHERE id='%2'",_membersFinal,_groupID],1] call DB_fnc_asyncCall;
    };
};
