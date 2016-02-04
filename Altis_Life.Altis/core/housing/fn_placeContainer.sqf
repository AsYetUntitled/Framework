#include "..\..\script_macros.hpp"
/*
	Author: NiiRoZz

	Description:
	Place container inside house
*/
private["_container","_houses","_type","_number","_house","_uid"];
_container = param [0,ObjNull,[ObjNull]];
_number = 1;
_uid = steamid;
switch(true) do {
	case ((typeOf _container) == "B_supplyCrate_F"): {_type = "storagebig"};
	case ((typeOf _container) == "Box_IND_Grenades_F") : {_type = "storagesmall"};
	default {_type = ""};
};

_houses = [position player, ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F","Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V3_F"], 9] call life_fnc_nearestObjects;
_housess = lineIntersectsWith [visiblePositionASL player, ATLtoASL screenToWorld[0.5,0.5]];

if (count _houses > 0) then {
	switch(true) do {
		case (EQUAL(count _housess,0)): {_exit = true;};
		case (EQUAL(count _housess,1)): {_housess = _housess select 0;};
		default {
			{if(_x isKindOf "House_F") exitWith {_housess = _x;};} foreach _housess;
		};
	};
	if(!isNil "_exit" OR !(_housess isKindOf "House_F") OR isNil {_housess GVAR "house_owner"}) then {
		deleteVehicle _container;
		[true,_type,_number] call life_fnc_handleInv;
		hint localize "STR_House_Container_House_Near_Owner";
		} else {
			[_uid,_container] remoteExec ["TON_fnc_addContainer",RSERV];
			_container SVAR ["Trunk",[[],0],true];
			_container SVAR ["container_owner",[_uid],true];
			_Container allowDamage true;
	};
} else {
	deleteVehicle _container;
	[true,_type,_number] call life_fnc_handleInv;
	hint localize "STR_House_Container_House_Near";
};
