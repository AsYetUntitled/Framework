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
		for [{_x=1},{_x<=6},{_x=_x+1}] do
		{
			49 cutText[format["Can abort in %1", 6 - _x],"PLAIN DOWN"];
			sleep 1;
			49 cutText["","PLAIN DOWN"];
			if(isNull (findDisplay 49)) exitWith {};
		};
	};
	
	_abortButton = (findDisplay 49) displayCtrl 104;
	[] call SOCK_fnc_updateRequest; //call our silent sync.
	
	if(_this) then {
		_thread = [] spawn _syncManager;
		waitUntil{scriptDone _thread OR isNull (findDisplay 49)};
		_abortButton ctrlEnable true;
	};
};

_canUseControls = {
	if(playerSide == west) exitWith {true};
	if((player getVariable["restrained",FALSE]) OR (player getVariable["Escorting",FALSE]) OR (player getVariable["transporting",FALSE]) OR (life_is_arrested) OR (life_istazed)) then {false} else {true};
};
	
while {true} do
{
	waitUntil{!isNull (findDisplay 49)};
	_abortButton = (findDisplay 49) displayCtrl 104;
	_respawnButton = (findDisplay 49) displayCtrl 1010;
	_fieldManual = (findDisplay 49) displayCtrl 122;
	
	//Block off our buttons first.
	_abortButton ctrlEnable false;
	_respawnButton ctrlEnable false;
	_fieldManual ctrlEnable false; //Never re-enable, blocks an old script executor.
	
	_usebleCtrl = call _canUseControls;
	_usebleCtrl spawn _escSync;
	if(_usebleCtrl) then {
		_respawnButton ctrlEnable true; //Enable the button.
	};
	waitUntil{isNull (findDisplay 49)};
};