#include "..\..\script_macros.hpp"
/*
	Author: NiiRoZz

	Description:
	Tries to place a storage box in position selected.
*/
private["_boxType","_container"];
_boxType = SEL(_this,0);
/*
switch (_boxType) do {
	case "storagesmall": { _container = "Box_IND_Grenades_F" createVehicle position player; };
	case "storagebig": { _container = "B_supplyCrate_F" createVehicle position player; };
};
*/
life_action_CrateDeploy = player addAction [
    "Spawn Crate",
    {
        _container = createVehicle [
            "B_supplyCrate_F",
            position player,
            [],
            0,
            "NONE"
        ];
        _container setDir 90;
        _container allowDamage false;
				_container setPosATL [ (getPosATL player select 0) + 0.2,  (getPosATL player select 1) + 0.2, (getPosATL player select 2) + 0.4];
				clearWeaponCargoGlobal _container;
				clearMagazineCargoGlobal _container;
				clearItemCargoGlobal _container;
				clearBackpackCargoGlobal _container;
				player removeAction life_action_CrateDeploy;
				life_action_CrateDeploy = nil;
				[false,"storagebig",1] call life_fnc_handleInv;
				[_container] call life_fnc_placeContainer;
    }
];

//[_container] call life_fnc_placeContainer;
