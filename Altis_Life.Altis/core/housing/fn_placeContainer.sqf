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
_unit = player;
switch(true) do {
	case ((typeOf _container) == "B_supplyCrate_F"): {_type = "storagebig"};
	case ((typeOf _container) == "Box_IND_Grenades_F") : {_type = "storagesmall"};
	default {_type = ""};
};

_houses = [position player, ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F","Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F","Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F","Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F","Land_i_House_Small_03_V1_F","Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V3_F"], 8] call life_fnc_nearestObjects;

if (count _houses > 0) then {
	_house = _houses select 0;
	if(([_unit,_house] call life_fnc_PlayerInBuilding) && {!dialog}) then {
		if(!(_house in life_vehicles) OR isNil {_house GVAR "house_owner"}) then {
			deleteVehicle _container;
			[true,_type,_number] call life_fnc_handleInv;
			hint localize "STR_House_Container_House_Near_Owner";
		} else {
			_containers = _house GVAR ["containers",[]];
			_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
			if(count _houseCfg == 0) exitWith {}; //What the fuck happened?
			if(count _containers >= (_houseCfg select 1)) then {
				deleteVehicle _container;
				[true,_type,_number] call life_fnc_handleInv;
				hint localize "STR_ISTR_Box_HouseFull";
				} else {
					[_uid,_container] remoteExec ["TON_fnc_addContainer",RSERV];
					_container SVAR ["Trunk",[[],0],true];
					_container SVAR ["container_owner",[_uid],true];
					_container allowDamage true;
					_containers pushBack _container;
					_house setVariable["containers",_containers,true];
				};
		};
	} else {
		deleteVehicle _container;
		[true,_type,_number] call life_fnc_handleInv;
		hint localize "STR_House_Container_House_Near";
	};
} else {
	deleteVehicle _container;
	[true,_type,_number] call life_fnc_handleInv;
	hint localize "STR_House_Container_House_Near";
};
