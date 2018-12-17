#include "..\..\script_macros.hpp"
/*
    File: fn_clearVehicleAmmo.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Clears the vehicle of ammo types that we don't want.

    Syntax: _vehicle removeMagazinesTurret [magazineName, turretPath]
    Documentation: https://community.bistudio.com/wiki/removeMagazinesTurret
*/
params [["_vehicle",objNull,[objNull]]];
if (isNull _vehicle) exitWith {};
private _veh = typeOf _vehicle;

{
	if !(_x in ["SportCarHorn","MiniCarHorn","CarHorn","CarHorn","PoliceHorn","PoliceHorn","TruckHorn3","AmbulanceHorn","TruckHorn2"]) then {_vehicle removeWeapon _x};
} forEach weapons _vehicle;
{_vehicle removeMagazine _x} forEach magazines _vehicle;
clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;
