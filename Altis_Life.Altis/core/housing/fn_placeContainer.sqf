#include "..\..\script_macros.hpp"
/*
	File: fn_placeContainer.sqf
	Author: NiiRoZz

	Description:
	Check container if are in house and if house are owner of player and if all this conditions are true add container in database
*/
private["_container","_number","_type","_house","_containers","_houseCfg"];
_container = param [0,ObjNull,[ObjNull]];
_number = 1;
_uid = steamid;
_house = cursorTarget;
switch(true) do {
	case ((typeOf _container) == "B_supplyCrate_F"): {_type = "storagebig"};
	case ((typeOf _container) == "Box_IND_Grenades_F") : {_type = "storagesmall"};
	default {_type = ""};
};

if (!isNull _house && _house isKindOf "House_F" && {player distance _house < 12}) then{
	if(([player] call life_fnc_PlayerInBuilding)) then {
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
					
					if(life_HC_isActive) then {
						[_uid,_container] remoteExec ["HC_fnc_addContainer",HC_Life];
					} else {
						[_uid,_container] remoteExec ["TON_fnc_addContainer",RSERV];
					};
					
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
