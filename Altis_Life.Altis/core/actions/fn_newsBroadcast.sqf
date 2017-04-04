#include "..\..\script_macros.hpp"
/*
    File: fn_newsBroadcast.sqf
    Author: Jesse "tkcjesse" Schultz

    Description:
    Creates the dialog and handles the data in the Channel 7 News Dialog.
*/
#define Confirm 100104

private ["_msgCost","_display","_confirmBtn","_msgCooldown","_broadcastDelay"];

if (!dialog) then {
    createDialog "life_news_broadcast";
};

disableSerialization;
_display = findDisplay 100100;
_confirmBtn = _display displayCtrl Confirm;
_confirmBtn ctrlEnable false;

_msgCooldown = (60 * LIFE_SETTINGS(getNumber,"news_broadcast_cooldown"));
_msgCost = LIFE_SETTINGS(getNumber,"news_broadcast_cost");

if (CASH < _msgCost) then {
    hint format [localize "STR_News_NotEnough",[_msgCost] call life_fnc_numberText];
} else {
    _confirmBtn ctrlEnable true;
    _confirmBtn buttonSetAction "[] call life_fnc_postNewsBroadcast; closeDialog 0;";
};

if (isNil "life_broadcastTimer" || {(time - life_broadcastTimer) > _msgCooldown}) then {
    _broadcastDelay = localize "STR_News_Now";
} else {
    _broadcastDelay = [(_msgCooldown - (time - life_broadcastTimer))] call BIS_fnc_secondsToString;
    _confirmBtn ctrlEnable false;
};

CONTROL(100100,100103) ctrlSetStructuredText parseText format [ localize "STR_News_StructuredText",[_msgCost] call life_fnc_numberText,_broadcastDelay];