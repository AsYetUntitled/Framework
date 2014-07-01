/*
	File: fn_clientDisconnect.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When a player disconnect it goes through the all the dead bodies
	and removes bodies owned by the server. This is built for the new
	medical / EMS system.
*/
{
	_pid = _x getVariable["steam64ID",""];
	if(_uid == _pid OR _pid == "") then {
		_containers = nearestObjects[_x,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
		{deleteVehicle _x;} foreach _containers; //Delete the containers.
		deleteVehicle _x; //Get rid of the corpse.
	};
} foreach allDeadMen;