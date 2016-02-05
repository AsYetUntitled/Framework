#include "..\..\script_macros.hpp"
/*
	Author: NiiRoZz

	Description:
	Place container inside house
*/
private["_container","_houses","_type","_number","_house","_uid"];
_container = param [0,ObjNull,[ObjNull]];
switch(true) do {
	case ((typeOf _container) == "B_supplyCrate_F"): {[] call life_fnc_placestorageBig};
	case ((typeOf _container) == "Box_IND_Grenades_F") : {[] call life_fnc_placestorageSmall};
	default {_type = ""};
};
