/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Unlocks / locks the house.
*/
private["_house"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};

_state = _house getVariable["locked",true];
if(_state) then {
	_house setVariable["locked",false,true];
	titleText[localize "STR_House_StorageUnlock","PLAIN"];
} else {
	_house setVariable["locked",true,true];
	titleText[localize "STR_House_StorageLock","PLAIN"];
};