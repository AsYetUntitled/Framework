#include "..\..\script_macros.hpp"
/*
    File: fn_impoundMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Not actually a impound menu, may act as confusion to some but that is what I wanted.
    The purpose of this menu is it is now called a 'Garage' where vehicles are stored (persistent ones).
*/
params [
    ["_vehicles",[],[[]]]
];

ctrlShow[2803,false];
ctrlShow[2830,false];
waitUntil {!isNull (findDisplay 2800)};

if (_vehicles isEqualTo []) exitWith {
    ctrlSetText[2811,localize "STR_Garage_NoVehicles"];
};

private _control = CONTROL(2800,2802);
lbClear _control;

{
    _x params ["_plate","_className","_color"];
    _vehicleInfo = [_className] call life_fnc_fetchVehInfo;
    _control lbAdd (_vehicleInfo select 3);
    _tmp = [_plate,_className];
    _tmp = str(_tmp);
    _control lbSetData [_forEachIndex,_tmp];
    _control lbSetPicture [_forEachIndex,(_vehicleInfo select 2)];
    _control lbSetValue [_forEachIndex,_color];
} forEach _vehicles;

ctrlShow[2810,false];
ctrlShow[2811,false];
