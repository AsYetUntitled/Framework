/*
	File : fn_storageBox.sqf
	Author: NiiRoZz

	Description:
	Create Storage and attachto player;
*/
private["_object","_attachPos"];
params [
	["_size",false,[false]]
];
life_container_active = true;
closeDialog 0;

if(_size) then {
	_object = "B_supplyCrate_F" createVehicle (position player);
} else {
	_object = "Box_IND_Grenades_F" createVehicle (position player);
};
life_container_activeObj = _object;
_attachPos = [0, 3, 0.5];
_object attachTo[player, _attachPos];
_object enableSimulationGlobal false;
clearWeaponCargoGlobal _object;
clearMagazineCargoGlobal _object;
clearItemCargoGlobal _object;
clearBackpackCargoGlobal _object;
titleText [localize "STR_NOTF_PlaceContainer", "PLAIN"];
