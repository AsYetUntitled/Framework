/*
    File: fn_adminmsg.sqf
    Author: Bryan "Tonic" Boardwine

    Description: TODO
*/
if (isServer) exitWith {};
if ((call life_adminlevel) < 1) exitWith {hint localize "STR_CELLMSG_NoAdmin";};
private ["_msg","_to"];
ctrlShow[3020,false];
_msg = ctrlText 3003;
_to = call compile format ["%1",(lbData[3004,(lbCurSel 3004)])];
if (isNull _to) exitWith {ctrlShow[3020,true];};
if (isNil "_to") exitWith {ctrlShow[3020,true];};
if (_msg isEqualTo "") exitWith {hint localize "STR_CELLMSG_EnterMSG";ctrlShow[3020,true];};

[_msg,name player,3] remoteExecCall ["TON_fnc_clientMessage",_to];
[] call life_fnc_cellphone;
hint format [localize "STR_CELLMSG_AdminToPerson",name _to,_msg];
ctrlShow[3020,true];
