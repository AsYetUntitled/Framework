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
if (count _houses > 0) then {
	_house = _houses select 0;
	if(!(_house in life_vehicles) OR isNil {_house GVAR "house_owner"}) then {
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
