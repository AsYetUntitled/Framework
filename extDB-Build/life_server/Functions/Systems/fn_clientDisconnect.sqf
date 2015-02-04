#include "\life_server\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When a client disconnects this will remove their corpse and
	clean up their storage boxes in their house.
*/
private["_unit","_id","_uid","_name"];
_unit = SEL(_this,0);
if(isNull _unit) exitWith {};
_id = SEL(_this,1);
_uid = SEL(_this,2);
_name = SEL(_this,3);

_containers = nearestObjects[_unit,["WeaponHolderSimulated"],5];
{deleteVehicle _x;} foreach _containers;
deleteVehicle _unit;

_uid spawn TON_fnc_houseCleanup;