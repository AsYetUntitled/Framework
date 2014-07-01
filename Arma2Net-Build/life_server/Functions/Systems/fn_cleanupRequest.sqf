/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Client sends a cleanup request when they hit Abort,
	the server will then monitor when that client aborts and
	delete the weapon holders.
*/
private["_client","_loops"];
_client = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _client) exitWith {};

_loops = 0;
while {true} do {
	if(_loops >= 25) exitWith {};
	if(!alive _client) exitWith {
		_containers = nearestObjects[_client,["WeaponHolderSimulated"],5];
		if(count _containers > 0) then {
			{deleteVehicle _x;} foreach _containers; //Delete the containers.
		};
		deleteVehicle _client; //Get rid of the corpse.
	};
	
	_loops = _loops + 1;
	sleep 1;
};