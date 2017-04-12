#include "..\..\script_macros.hpp"
/*
    File: fn_adminQuery.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the query on a player.
*/

disableSerialization;

if (!isNil "admin_query_ip") exitWith {
    hint localize "STR_ANOTF_Query_2"
};

private _text = CONTROL(2900,2903);
private _info = lbData[2902,lbCurSel (2902)];
_info = call compile format ["%1", _info];

if (isNil "_info") exitWith {
    _text ctrlSetText localize "STR_ANOTF_QueryFail";
};
if (isNull _info) exitWith {
    _text ctrlSetText localize "STR_ANOTF_QueryFail";
};

[player] remoteExec ["TON_fnc_player_query",_info];
_text ctrlSetText localize "STR_ANOTF_Query";
