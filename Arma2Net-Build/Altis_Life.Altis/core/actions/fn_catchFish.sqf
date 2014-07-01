/*
	File: fn_catchFish.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Catches a fish that is near by.
*/
private["_fish","_type"];
_fish = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(!(_fish isKindOf "Fish_Base_F")) exitWith {}; //Not a fishy!
if(player distance _fish > 3.5) exitWith {};
switch(true) do
{
	case ((typeOf _fish) == "Salema_F"): {_type = "salema"};
	case ((typeOf _fish) == "Ornate_random_F") : {_type = "ornate"};
	case ((typeOf _fish) == "Mackerel_F") : {_type = "mackerel"};
	case ((typeOf _fish) == "Tuna_F") : {_type = "tuna"};
	case ((typeOf _fish) == "Mullet_F") : {_type = "mullet"};
	case ((typeOf _fish) == "CatShark_F") : {_type = "catshark"};
	default {_type = ""};
};

if(_type == "") exitWith {}; //Couldn't get a type

if(([true,_type,1] call life_fnc_handleInv)) then
{
	deleteVehicle _fish;
	titleText[format[(localize "STR_NOTF_Fishing"),_type],"PLAIN"];
};