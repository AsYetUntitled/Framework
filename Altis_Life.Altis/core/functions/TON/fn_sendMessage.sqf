/*
    File: fn_sendMessage.sqf
    Author: blackfisch

    Description: send message to target
*/
params [
    ["_ehParams", [], [[]]],
    ["_target", "player", [""]]
];
_ehParams params [
    ["_control", controlNull, [controlNull]]
];

_control ctrlEnable false;

private _to = call compile format ["%1",(lbData[3004,(lbCurSel 3004)])];
if ((_target in ["adminToPlayer", "player"]) && {isNil "_to" || {isNull _to}}) exitWith {
    _control ctrlEnable true;
};

private _msg = ctrlText 3003;
if (_msg isEqualTo "") exitWith {
    hint localize "STR_CELLMSG_EnterMSG";
    _control ctrlEnable true;
};

private _maxLength = getNumber(missionConfigFile >> "Life_Settings" >> "message_maxlength");
if (_maxLength > -1 && {(count _msg) > _maxLength}) exitWith {
    hint localize "STR_CELLMSG_LIMITEXCEEDED";
    _control ctrlEnable true;
};

private _targetFunction = 0;
private _sender = player getVariable ["realName", profileName];
private _toName = (if (isNil "_to" || {isNull _to}) then {"ERROR"} else {_to getVariable ["realname", name _to]});
private _confirmMessage = "STR_CELLMSG_ToPerson";

switch (_target) do {
    case "cop": {
        _to = west;
        _targetFunction = 1;
        _confirmMessage = "STR_CELLMSG_ToPolice";
    };
    case "med": {
        _to = independent;
        _targetFunction = 5;
        _confirmMessage = "STR_CELLMSG_ToEMS";
    };
    case "admin": {
        _to = -2;
        _targetFunction = 2;
        _confirmMessage = "STR_CELLMSG_ToAdmin";
    };
    case "adminToPlayer": {
        _targetFunction = 3;
        _confirmMessage = "STR_CELLMSG_AdminToPerson";
    };
    case "adminAll": {
        _to = -2;
        _targetFunction = 4;
        _confirmMessage = "STR_CELLMSG_AdminToAll";
    };
};

[_msg,_sender,_targetFunction, mapGridPosition player] remoteExecCall ["TON_fnc_clientMessage",_to];
call life_fnc_cellphone;
hint format [localize _confirmMessage,_toName,_msg];
_control ctrlEnable true;
