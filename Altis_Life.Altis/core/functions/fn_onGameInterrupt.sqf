#include "..\..\script_macros.hpp"
/*
    File: fn_onGameInterrupt.sqf
    Author: DomT602
    Description: Handles game interuptions - ie when esc menu is opened.
*/
params [
    ["_display",displayNull,[displayNull]]
];

private _abortButton = _display displayCtrl 104;
private _respawnButton = _display displayCtrl 1010;
private _fieldManual = _display displayCtrl 122;
private _saveButton = _display displayCtrl 103;
private _topButton = _display displayCtrl 2;

_abortButton ctrlEnable false;
_abortButton buttonSetAction "call SOCK_fnc_updateRequest; [player] remoteExec [""TON_fnc_cleanupRequest"",2];";
_fieldManual ctrlEnable false;
_saveButton ctrlEnable false;

if (LIFE_SETTINGS(getNumber,"escapeMenu_displayExtras") isEqualTo 1) then {
    _topButton ctrlEnable false;
    _topButton ctrlSetText (LIFE_SETTINGS(getText,"escapeMenu_displayText"));
    _saveButton ctrlSetText format ["Player UID: %1",getPlayerUID player];
};

private _conditions = playerSide isEqualTo west || {!((player getVariable ["restrained",false]) || {player getVariable ["Escorting",false]} || {player getVariable ["transporting",false]} || {life_is_arrested} || {life_istazed} || {life_isknocked})};
if (_conditions) then {
    [_display,_abortButton] spawn {
        params ["_display","_abortButton"];
        private _abortTime = LIFE_SETTINGS(getNumber,"escapeMenu_timer");
        private _timeStamp = time + _abortTime;

        waitUntil {
            _abortButton ctrlSetText format [localize "STR_NOTF_AbortESC",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
            if (dialog && {isNull (findDisplay 7300)}) then {closeDialog 0};

            (_timeStamp - time) <= 0 || {isNull _display || {!alive player}}
        };
        if (!alive player) exitWith {};
        _abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
        _abortButton ctrlEnable true;
    };
} else {
    _respawnButton ctrlEnable false;    
};