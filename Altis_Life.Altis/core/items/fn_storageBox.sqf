#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Tries to place a storage box in the nearest house.
*/
private["_boxType","_house","_positions","_containers","_pos","_houseCfg","_className"];
_boxType = SEL(_this,0);

_house = nearestBuilding (getPosATL player);
if(!(_house in life_vehicles)) exitWith {hint localize "STR_ISTR_Box_NotinHouse"};

_containers = _house GVAR ["containers",[]];
_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {}; //What the fuck happened?
if(count _containers >= (_houseCfg select 1)) exitWith {hint localize "STR_ISTR_Box_HouseFull"};

_slots = _house GVAR ["slots",[]];
_positions = [_house] call life_fnc_getBuildingPositions;
_pos = [0,0,0];
{
	_slots = _house GVAR ["slots",[]];
	if(!(_forEachIndex in _slots)) exitWith {
		_slots pushBack _forEachIndex;
		_house setVariable["slots",_slots,true];
		_pos = _x;
	};
} foreach _positions;

if(_pos isEqualTo [0,0,0]) exitWith {hint localize "STR_ISTR_Box_HouseFull_2"};
if(!([false,_boxType,1] call life_fnc_handleInv)) exitWith {};

switch (_boxType) do {
	case "storagesmall": { _className = "Box_IND_Grenades_F"; };
	case "storagebig": { _className = "B_supplyCrate_F"; };
	default { _className = ""; };
};
if(_className == "") exitWith {};

_container = _className createVehicle [0,0,0];
_container setPosATL _pos;
_container enableSimulation false;

_containers pushBack _container;
_house setVariable["containers",_containers,true];
[_house] remoteExecCall ["TON_fnc_updateHouseContainers",RSERV];

//Empty out the crate
clearWeaponCargoGlobal _container;
clearMagazineCargoGlobal _container;
clearItemCargoGlobal _container;
clearBackpackCargoGlobal _container;
