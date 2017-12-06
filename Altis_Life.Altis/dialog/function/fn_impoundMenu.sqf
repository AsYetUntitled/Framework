#include "..\..\script_macros.hpp"
/*
    File: fn_impoundMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Not actually a impound menu, may act as confusion to some but that is what I wanted.
    The purpose of this menu is it is now called a 'Garage' where vehicles are stored (persistent ones).
*/
disableSerialization;
params [
    ["_vehicles",[],[[]]]
];

ctrlShow[2803,false];
ctrlShow[2830,false];
waitUntil {!isNull (findDisplay 2800)};

if (count _vehicles isEqualTo 0) exitWith {
    ctrlSetText[2811,localize "STR_Garage_NoVehicles"];
};

private _control = CONTROL(2800,2802);
lbClear _control;

{
    _x params [
        "_id",
        "",
        "_className",
        "",
        "",
        "",
        "",
        "",
        "_colour"
    ];
    _vehicleInfo = [_className] call life_fnc_fetchVehInfo;
    _vehicleInfo params ["","","_picture","_displayName"];
    _control lbAdd _displayName;
    _tmp = [_className,_colour];
    _tmp = str(_tmp);
    _control lbSetData [(lbSize _control)-1,_tmp];
    _control lbSetPicture [(lbSize _control)-1,_picture];
    _control lbSetValue [(lbSize _control)-1,_id];
} forEach _vehicles;

ctrlShow[2810,false];
ctrlShow[2811,false];
