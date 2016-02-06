#include "..\..\script_macros.hpp"
/*
	Author: NiiRoZz

	Description:
	Delete Container
*/
private["_house","_action","_houseCfg"];
_container = param [0,ObjNull,[ObjNull]];
_house = nearestBuilding (getPosATL player);
if(!(_house in life_vehicles)) exitWith {hint localize "STR_ISTR_Box_NotinHouse"};
if(isNull _container) exitWith {};
_containers = _house GVAR ["containers",[]];
closeDialog 0;

_action = [
	format[localize "STR_House_DeleteContainerMSG"],localize "STR_pInAct_DeleteContainer",localize "STR_Global_Delete",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	[_container] remoteExecCall ["TON_fnc_deleteDBContainer",RSERV];
	{
		if (_x == _container) then {
			_containers set [_forEachIndex,666];
		};
	} forEach _containers;
	_containers = _containers - [666];
	_house SVAR ["containers",_containers,true];
};
