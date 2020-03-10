/*
    File: fn_adminmsg.sqf
    Author: Bryan "Tonic" Boardwine

    Description: send message as admin to player
*/
private _maxLength = getNumber(missionConfigFile >> "Life_Settings" >> "message_maxlength");

if ((call life_adminlevel) < 1) exitWith {hint localize "STR_CELLMSG_NoAdmin";};

ctrlShow[3020,false];
private _msg = ctrlText 3003;
private _to = call compile format ["%1",(lbData[3004,(lbCurSel 3004)])];
if (isNil "_to" || {isNull _to}) exitWith {ctrlShow[3020,true];};
if (_msg isEqualTo "") exitWith {hint localize "STR_CELLMSG_EnterMSG";ctrlShow[3020,true];};
if (_maxLength > -1 && {(count _msg) > _maxLength}) exitWith {hint localize "STR_CELLMSG_LIMITEXCEEDED";ctrlShow[3020,true];};

[_msg,name player,3] remoteExecCall ["TON_fnc_clientMessage",_to];
call life_fnc_cellphone;
hint format [localize "STR_CELLMSG_AdminToPerson",name _to,_msg];
ctrlShow[3020,true];
