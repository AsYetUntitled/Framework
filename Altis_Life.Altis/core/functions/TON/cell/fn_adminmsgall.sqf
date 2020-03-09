/*
    File: fn_adminmsgall.sqf
    Author: Bryan "Tonic" Boardwine

    Description: send message as admin to all players
*/
if ((call life_adminlevel) < 1) exitWith {hint localize "STR_CELLMSG_NoAdmin";};


ctrlShow[3021,false];
private _msg = ctrlText 3003;
if (_msg isEqualTo "") exitWith {hint localize "STR_CELLMSG_EnterMSG";ctrlShow[3021,true];};

[_msg,name player,4] remoteExecCall ["TON_fnc_clientMessage",-2];
call life_fnc_cellphone;
hint format [localize "STR_CELLMSG_AdminToAll",_msg];
ctrlShow[3021,true];
