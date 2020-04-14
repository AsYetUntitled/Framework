#define CLIENTS -2
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

if (_target isEqualTo "cop" && {(west countSide allPlayers) isEqualTo 0}) exitWith {
    hint localize "STR_CELLMSG_NoCops";
    _control ctrlEnable true;
};

if (_target isEqualTo "med" && {(independent countSide allPlayers) isEqualTo 0}) exitWith {
    hint localize "STR_CELLMSG_NoMedics";
    _control ctrlEnable true;
};

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

private _remoteTarget = CLIENTS;
private _confirmMessage = (switch (toLower _target) do {
    case "cop": {
        _remoteTarget = west;
        "STR_CELLMSG_ToPolice";
    };
    case "med": {
        _remoteTarget = independent;
        "STR_CELLMSG_ToEMS";
    };
    case "admin": {
        "STR_CELLMSG_ToAdmin";
    };
    case "adminall": {
        "STR_CELLMSG_AdminToAll";
    };
    case "admintoplayer": {
        _remoteTarget = _to;
        "STR_CELLMSG_AdminToPerson";
    };
    default {
        _remoteTarget = _to;
        "STR_CELLMSG_ToPerson";
    };
});

private _sender = player getVariable ["realName", profileName];
[_msg,_sender,_target, mapGridPosition player] remoteExecCall ["life_fnc_clientMessage",_remoteTarget];
call life_fnc_cellphone;

private _toName = (if (isNil "_to" || {isNull _to}) then {"ERROR"} else {_to getVariable ["realname", name _to]});
hint format [localize _confirmMessage,_toName,_msg];
_control ctrlEnable true;
