/*
    File: fn_emsrequest.sqf
    Author: Bryan "Tonic" Boardwine

    Description: send message to ems
*/
ctrlShow[3022,false];
private _msg = ctrlText 3003;
private _length = count (toArray(_msg));
if (_length > 400) exitWith {hint localize "STR_CELLMSG_LIMITEXCEEDED";ctrlShow[3022,true];};
private _to = "EMS Units";
if (_msg isEqualTo "") exitWith {hint localize "STR_CELLMSG_EnterMSG";ctrlShow[3022,true];};

[_msg,name player,5,mapGridPosition player,player] remoteExecCall ["TON_fnc_clientMessage",independent];
call life_fnc_cellphone;
hint format [localize "STR_CELLMSG_ToEMS",_to,_msg];
ctrlShow[3022,true];
