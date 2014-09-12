/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When a player disconnect it goes through the all the dead bodies
	and removes bodies owned by the server. This is built for the new
	medical / EMS system.
*/
private["_uid","_name"];
_uid = _this select 0;
_name = _this select 2;
_unit = _this select 3;

_containers = nearestObjects[_unit,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
{deleteVehicle _x;} foreach _containers; //Delete the containers.
deleteVehicle _unit; //Get rid of the corpse.

_uid spawn TON_fnc_houseCleanup;
