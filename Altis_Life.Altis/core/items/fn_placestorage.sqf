disableSerialization;
if (!life_container_active) exitWith {};
if (life_container_activeObj == ObjNull) exitWith {};
switch(true) do {
	case ((typeOf life_container_activeObj) == "B_supplyCrate_F"): {_type = "storagebig"};
	case ((typeOf life_container_activeObj) == "Box_IND_Grenades_F") : {_type = "storagesmall"};
	default {_type = ""};
};
detach life_container_activeObj;
life_container_activeObj setPosATL [getPosATL life_container_activeObj select 0, getPosATL life_container_activeObj select 1, (getPosATL life_container_activeObj select 2) + 0.7];
life_container_activeObj enableSimulationGlobal true;
[false,_type,1] call life_fnc_handleInv;
[life_container_activeObj] call life_fnc_placeContainer;
clearWeaponCargoGlobal life_container_activeObj;
clearMagazineCargoGlobal life_container_activeObj;
clearItemCargoGlobal life_container_activeObj;
clearBackpackCargoGlobal life_container_activeObj;
life_container_active = false;
life_container_activeObj = ObjNull;
