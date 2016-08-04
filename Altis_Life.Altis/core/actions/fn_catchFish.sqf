#include "..\..\script_macros.hpp"
/*
    File: fn_catchFish.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Catches a fish that is near by.
*/
private ["_fish","_type","_typeName"];
_fish = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (isNull _fish) exitWith {}; //Object passed is null?
if (player distance _fish > 3.5) exitWith {};

switch (true) do {
    case ((typeOf _fish) isEqualTo "Salema_F"): {_typeName = localize "STR_ANIM_Salema"; _type = "salema_raw";};
    case ((typeOf _fish) isEqualTo "Ornate_random_F") : {_typeName = localize "STR_ANIM_Ornate"; _type = "ornate_raw";};
    case ((typeOf _fish) isEqualTo "Mackerel_F") : {_typeName = localize "STR_ANIM_Mackerel"; _type = "mackerel_raw";};
    case ((typeOf _fish) isEqualTo "Tuna_F") : {_typeName = localize "STR_ANIM_Tuna"; _type = "tuna_raw";};
    case ((typeOf _fish) isEqualTo "Mullet_F") : {_typeName = localize "STR_ANIM_Mullet"; _type = "mullet_raw";};
    case ((typeOf _fish) isEqualTo "CatShark_F") : {_typeName = localize "STR_ANIM_Catshark"; _type = "catshark_raw";};
    case ((typeOf _fish) isEqualTo "Turtle_F") : {_typeName = localize "STR_ANIM_Turtle"; _type = "turtle_raw";};
    default {_type = ""};
};

if (_type isEqualTo "") exitWith {}; //Couldn't get a type

if ([true,_type,1] call life_fnc_handleInv) then {
    deleteVehicle _fish;
    titleText[format [(localize "STR_NOTF_Fishing"),_typeName],"PLAIN"];
};