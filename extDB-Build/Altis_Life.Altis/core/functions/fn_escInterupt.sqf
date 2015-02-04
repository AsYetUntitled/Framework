#include <macro.h>
/*
	File: fn_escInterupt.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Monitors when the ESC menu is pulled up and blocks off
	certain controls when conditions meet.
*/
private["_abortButton","_respawnButton","_fieldManual","_escSync","_canUseControls"];
disableSerialization;

_escSync = {
	private["_abortButton","_thread","_syncManager"];
	disableSerialization;
	
	_syncManager = {
		disableSerialization;
		private["_abortButton","_timeStamp"];
		_abortButton = CONTROL(49,104);
		_timeStamp = time + 10;
		
		waitUntil {
			_abortButton ctrlSetText format[localize "STR_NOTF_AbortESC",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
			_abortButton ctrlCommit 0;
			round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
		};
		
		_abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
		_abortButton ctrlCommit 0;
	};
	
	_abortButton = CONTROL(49,104);
	[] call SOCK_fnc_updateRequest; //call our silent sync.
	
	if(_this) then {
		_thread = [] spawn _syncManager;
		waitUntil{scriptDone _thread OR isNull (findDisplay 49)};
		_abortButton ctrlEnable true;
	};
};

_canUseControls = {
	if(playerSide == west) exitWith {true};
	if((player GVAR ["restrained",FALSE]) OR (player GVAR ["Escorting",FALSE]) OR (player GVAR ["transporting",FALSE]) OR (life_is_arrested) OR (life_istazed)) then {false} else {true};
};
	
while {true} do
{
	waitUntil{!isNull (findDisplay 49)};
	_abortButton = CONTROL(49,104);
	_abortButton buttonSetAction "[[player],""TON_fnc_cleanupRequest"",false,false] call life_fnc_MP";
	_respawnButton = CONTROL(49,1010);
	_fieldManual = CONTROL(49,122);
	
	//Block off our buttons first.
	//_abortButton ctrlEnable false;
	_respawnButton ctrlEnable false;
	_fieldManual ctrlEnable false; //Never re-enable, blocks an old script executor.
	
	_usebleCtrl = call _canUseControls;
	_usebleCtrl spawn _escSync;
	if(_usebleCtrl) then {
		_respawnButton ctrlEnable true; //Enable the button.
	};
	waitUntil{isNull (findDisplay 49)};
};
