#include "..\..\script_macros.hpp"

/*
    File: fn_escInterupt.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Monitors when the ESC menu is pulled up and blocks off
    certain controls when conditions meet.
*/

private ["_abortButton","_respawnButton","_fieldManual","_escSync","_canUseControls"];
disableSerialization;

_escSync = {
    private ["_abortButton","_thread","_syncManager"];
    disableSerialization;

    _syncManager = {
        disableSerialization;
        private ["_abortButton","_timeStamp","_abortTime"];
        _abortButton = CONTROL(49,104);
        _abortTime = LIFE_SETTINGS(getNumber,"escapeMenu_timer");
        _timeStamp = time + _abortTime;

        waitUntil {
            _abortButton ctrlSetText format [localize "STR_NOTF_AbortESC",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
            _abortButton ctrlCommit 0;
            round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
        };

        _abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
        _abortButton ctrlCommit 0;
    };

    _abortButton = CONTROL(49,104);

    if (_this) then {
        _thread = [] spawn _syncManager;
        waitUntil {scriptDone _thread || isNull (findDisplay 49)};
        _abortButton ctrlEnable true;
    };
};

_canUseControls = {
    if (playerSide isEqualTo west) exitWith {true};
    if ((player getVariable ["restrained",false]) || (player getVariable ["Escorting",false]) || (player getVariable ["transporting",false]) || (life_is_arrested) || (life_istazed) || (life_isknocked)) then {false} else {true};
};

for "_i" from 0 to 1 step 0 do {
    waitUntil {!isNull (findDisplay 49)};
    _abortButton = CONTROL(49,104);
    _abortButton buttonSetAction "[] call SOCK_fnc_updateRequest; [player] remoteExec [""TON_fnc_cleanupRequest"",2];";
    _respawnButton = CONTROL(49,1010);
    _fieldManual = CONTROL(49,122);
    private _saveButton = CONTROL(49,103);
    _saveButton ctrlSetText "";

    //Extras
    if (LIFE_SETTINGS(getNumber,"escapeMenu_displayExtras") isEqualTo 1) then {
        private _topButton = CONTROL(49,2);
        _topButton ctrlEnable false;
        _topButton ctrlSetText format ["%1",LIFE_SETTINGS(getText,"escapeMenu_displayText")];
        _saveButton ctrlEnable false;
        _saveButton ctrlSetText format ["Player UID: %1",getPlayerUID player];
    };

    //Block off our buttons first.
    _abortButton ctrlEnable false;
    _respawnButton ctrlEnable false;
    _fieldManual ctrlEnable false; //Never re-enable, blocks an old script executor.
    _fieldManual ctrlShow false;

    _usebleCtrl = call _canUseControls;
    _usebleCtrl spawn _escSync;
    
    if (_usebleCtrl) then {
        _respawnButton ctrlEnable true; //Enable the button.
    };
    
    waitUntil {isNull (findDisplay 49) || {!alive player}};
    if (!isNull (findDisplay 49) && {!alive player}) then {
        (findDisplay 49) closeDisplay 2;
    };
};
