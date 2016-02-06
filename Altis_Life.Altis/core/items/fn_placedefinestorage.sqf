/*
	File : fn_placedefinestorage.sqf
	Author: NiiRoZz

	Description:
	Recup the classname of active object attach to player and execute per type of object

	Ps : I don't know why need that but all test with only single file doesn't work
*/
switch(true) do {
	case ((typeOf life_container_activeObj) == "B_supplyCrate_F"): {[] call life_fnc_placestorageBig};
	case ((typeOf life_container_activeObj) == "Box_IND_Grenades_F") : {[] call life_fnc_placestorageSmall};
	default {_type = ""};
};
