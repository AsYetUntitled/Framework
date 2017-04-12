#include "..\..\script_macros.hpp"
/*
    File: fn_putInCar.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Finds the nearest vehicle and loads the target into the vehicle.
*/
params [
    ["_unit", objNull, [objNull]]
];

if (isNull _unit || {!isPlayer _unit}) exitWith {};

private _nearestVehicle = nearestObjects[getPosATL player,["Car","Ship","Submarine","Air"], 10] select 0;
if (isNil "_nearestVehicle") exitWith {
    hint localize "STR_NOTF_VehicleNear"
};

detach _unit;
[_nearestVehicle] remoteExecCall ["life_fnc_moveIn",_unit];
_unit setVariable ["Escorting",false,true];
_unit setVariable ["transporting",true,true];