/*
	Author: NiiRoZz

	Description:
	Place container inside house
*/
switch(true) do {
	case ((typeOf life_container_activeObj) == "B_supplyCrate_F"): {[] call life_fnc_placestorageBig};
	case ((typeOf life_container_activeObj) == "Box_IND_Grenades_F") : {[] call life_fnc_placestorageSmall};
	default {_type = ""};
};
