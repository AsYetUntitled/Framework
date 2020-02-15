/*
    File: fn_textmsg.sqf
    Author: Bryan "Tonic" Boardwine

    Description: TODO
*/
private ["_msg","_to"];
ctrlShow[3015,false];
_msg = ctrlText 3003;

_length = count (toArray(_msg));
if (_length > 400) exitWith {hint localize "STR_CELLMSG_LIMITEXCEEDED";ctrlShow[3015,true];};
if (lbCurSel 3004 isEqualTo -1) exitWith {hint localize "STR_CELLMSG_SelectPerson"; ctrlShow[3015,true];};

_to = call compile format ["%1",(lbData[3004,(lbCurSel 3004)])];
if (isNull _to) exitWith {ctrlShow[3015,true];};
if (isNil "_to") exitWith {ctrlShow[3015,true];};
if (_msg isEqualTo "") exitWith {hint localize "STR_CELLMSG_EnterMSG";ctrlShow[3015,true];};

[_msg,name player,0] remoteExecCall ["TON_fnc_clientMessage",_to];
[] call life_fnc_cellphone;
hint format [localize "STR_CELLMSG_ToPerson",name _to,_msg];
ctrlShow[3015,true];
