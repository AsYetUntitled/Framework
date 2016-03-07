#include "\life_server\script_macros.hpp"
/*
	File: fn_clientDisconnect.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When a client disconnects this will remove their corpse and
	clean up their storage boxes in their house.
*/
private["_unit","_id","_uid","_name","_alive","_position","_side"];
_unit = SEL(_this,0);
if(isNull _unit) exitWith {};
_id = SEL(_this,1);
_uid = SEL(_this,2);
_name = SEL(_this,3);
_side = side _unit;

//Civilian position
if(life_save_civ_position && _side == civilian) then {
	if(isNil "HC_UID" || {_uid != HC_UID}) then {
		_alive = alive _unit;
		_position = getPosWorld _unit;
		//if((getMarkerPos "respawn_civilian" distance _position) > 300) then {_alive = false;_position = [];};
		if(life_HC_isActive) then {[_uid,_side,_alive,4,_position] remoteExec ["HC_fnc_updatePartial",HC_Life];} else {[_uid,_side,_alive,4,_position] spawn DB_fnc_updatePartial;};
	};
};

_containers = nearestObjects[_unit,["WeaponHolderSimulated"],5];
{deleteVehicle _x;} foreach _containers;
deleteVehicle _unit;

_uid spawn TON_fnc_houseCleanup;