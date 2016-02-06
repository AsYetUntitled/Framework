/*
	File : fn_storageBoxSmall.sqf
	Author: NiiRoZz

	Description:
	Create Storage and attachto player;
*/
private["_object","_attachPos"];
life_container_active = true;
_object = "Box_IND_Grenades_F" createVehicle (position player);
life_container_activeObj = _object;
_attachPos = [0, 3, 0.5];
_object attachTo[player, _attachPos];
_object enableSimulationGlobal false;