#include "..\..\script_macros.hpp"
/*
	File: fn_lockHouse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Unlocks / locks the house.
*/
private["_house"];
_house = param [0,ObjNull,[ObjNull]];
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};

_state = _house GVAR ["locked",true];
if(_state) then {
	_house SVAR ["locked",false,true];
	titleText[localize "STR_House_StorageUnlock","PLAIN"];
} else {
	_house SVAR ["locked",true,true];
	titleText[localize "STR_House_StorageLock","PLAIN"];
};