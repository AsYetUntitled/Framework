#include "..\..\script_macros.hpp"
/*
    File: fn_catchFish.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Catches a fish that is near by.
*/
params [
    ["_fish", objNull, [objNull]]
];

if (isNull _fish) exitWith {}; //Object passed is null?
if (player distance _fish > 3.5) exitWith {};

switch (true) do {
    case ((typeOf _fish) isEqualTo "Salema_F"): {private _typeName = localize "STR_ANIM_Salema"; private _type = "salema_raw";};
    case ((typeOf _fish) isEqualTo "Ornate_random_F") : {private _typeName = localize "STR_ANIM_Ornate"; private _type = "ornate_raw";};
    case ((typeOf _fish) isEqualTo "Mackerel_F") : {private _typeName = localize "STR_ANIM_Mackerel"; private _type = "mackerel_raw";};
    case ((typeOf _fish) isEqualTo "Tuna_F") : {private _typeName = localize "STR_ANIM_Tuna"; private _type = "tuna_raw";};
    case ((typeOf _fish) isEqualTo "Mullet_F") : {private _typeName = localize "STR_ANIM_Mullet"; private _type = "mullet_raw";};
    case ((typeOf _fish) isEqualTo "CatShark_F") : {private _typeName = localize "STR_ANIM_Catshark"; private _type = "catshark_raw";};
    case ((typeOf _fish) isEqualTo "Turtle_F") : {private _typeName = localize "STR_ANIM_Turtle"; private _type = "turtle_raw";};
    default {_type = ""};
};

if (_type isEqualTo "") exitWith {}; //Couldn't get a type

if ([true,_type,1] call life_fnc_handleInv) then {
    deleteVehicle _fish;
    titleText[format [(localize "STR_NOTF_Fishing"),_typeName],"PLAIN"];
};
