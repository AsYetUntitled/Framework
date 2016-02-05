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
	_v = _container;
	for "_i" from 0 to (count _containers - 1) do {

  _m = _containers select _i;

  if (_v in _m) then { _containers set [_i,"Delete"] };

	};
	_containers = _containers - ["Delete"];
	_house SVAR ["containers",_containers,true];
	[_container] remoteExecCall ["TON_fnc_deleteContainer",RSERV];
};
