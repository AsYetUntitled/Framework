#include "..\..\script_macros.hpp"
/*
    File : fn_storageBox.sqf
    Author: NiiRoZz

    Description:
    Create Storage and attachto player;
*/
params [
    ["_size",false,[false]]
];
if !(nearestObject [player, "House"] in life_vehicles) exitWith {hint localize "STR_ISTR_Box_NotinHouse";};

life_container_active = true;
closeDialog 0;

private _object = if (_size) then {
    "B_supplyCrate_F" createVehicle [0,0,0];
} else {
    "Box_IND_Grenades_F" createVehicle [0,0,0];
};

life_container_activeObj = _object;
private _attachPos = [0.16, 3, ((boundingBoxReal _object) select 1) select 2];
[_object] remoteExecCall ["life_fnc_simDisable",RANY];
_object attachTo[player, _attachPos];

clearWeaponCargoGlobal _object;
clearMagazineCargoGlobal _object;
clearItemCargoGlobal _object;
clearBackpackCargoGlobal _object;

titleText [localize "STR_NOTF_PlaceContainer", "PLAIN"];
