/*
    File: fn_textadmin.sqf
    Author: Bryan "Tonic" Boardwine

    Description: send message as player to admins
*/
private _maxLength = getNumber(missionConfigFile >> "Life_Settings" >> "message_maxlength");

ctrlShow[3017,false];
private _msg = ctrlText 3003;
private _to = "The Admins";

if (_msg isEqualTo "") exitWith {hint localize "STR_CELLMSG_EnterMSG";ctrlShow[3017,true];};
if (_maxLength > -1 && {(count _msg) > _maxLength}) exitWith {hint localize "STR_CELLMSG_LIMITEXCEEDED";ctrlShow[3017,true];};

[_msg,name player,2,mapGridPosition player] remoteExecCall ["TON_fnc_clientMessage",-2];
call life_fnc_cellphone;
hint format [localize "STR_CELLMSG_ToPerson",_to,_msg];
ctrlShow[3017,true];
