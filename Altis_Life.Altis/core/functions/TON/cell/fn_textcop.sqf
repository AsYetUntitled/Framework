/*
    File: fn_textcop.sqf
    Author: Bryan "Tonic" Boardwine

    Description: TODO
*/
private ["_msg","_to"];
ctrlShow[3016,false];
_msg = ctrlText 3003;
_to = "The Police";

if (_msg isEqualTo "") exitWith {hint localize "STR_CELLMSG_EnterMSG";ctrlShow[3016,true];};
_length = count (toArray(_msg));
if (_length > 400) exitWith {hint localize "STR_CELLMSG_LIMITEXCEEDED";ctrlShow[3016,true];};

[_msg,name player,1,mapGridPosition player,player] remoteExecCall ["TON_fnc_clientMessage",-2];
[] call life_fnc_cellphone;
hint format [localize "STR_CELLMSG_ToPerson",_to,_msg];
ctrlShow[3016,true];
