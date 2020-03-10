/*
    File: fn_textmsg.sqf
    Author: Bryan "Tonic" Boardwine

    Description: send message to another player
*/
private _maxLength = getNumber(missionConfigFile >> "Life_Settings" >> "message_maxlength");

ctrlShow[3015,false];
private _msg = ctrlText 3003;
if (lbCurSel 3004 isEqualTo -1) exitWith {hint localize "STR_CELLMSG_SelectPerson"; ctrlShow[3015,true];};

private _to = call compile format ["%1",(lbData[3004,(lbCurSel 3004)])];
if (isNil "_to" || {isNull _to}) exitWith {ctrlShow[3015,true];};
if (_msg isEqualTo "") exitWith {hint localize "STR_CELLMSG_EnterMSG";ctrlShow[3015,true];};
if (_maxLength > -1 && {(count _msg) > _maxLength}) exitWith {hint localize "STR_CELLMSG_LIMITEXCEEDED";ctrlShow[3015,true];};

[_msg,name player,0] remoteExecCall ["TON_fnc_clientMessage",_to];
[] call life_fnc_cellphone;
hint format [localize "STR_CELLMSG_ToPerson",name _to,_msg];
ctrlShow[3015,true];
