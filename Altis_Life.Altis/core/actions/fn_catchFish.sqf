/*
	File: fn_catchFish.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Catches a fish that is near by.
*/
private["_fish","_type"];
_fish = (nearestObjects[getPos player,["Fish_Base_F"],3]) select 0;
if(!(_fish isKindOf "Fish_Base_F")) exitWith {}; //Not a fishy!
switch(true) do
{
	case ((typeOf _fish) == "Salema_F"): {_type = "salema"};
	case ((typeOf _fish) == "Ornate_random_F") : {_type = "ornate"};
	case ((typeOf _fish) == "Mackerel_F") : {_type = "mackerel"};
	case ((typeOf _fish) == "Tuna_F") : {_type = "tuna"};
	case ((typeOf _fish) == "Mullet_F") : {_type = "mullet"};
	case ((typeOf _fish) == "Catshark_F") : {_type = "catshark"};
	default {_type = ""};
};

if(_type == "") exitWith {}; //Couldn't get a type

if(([true,_type,1] call life_fnc_handleInv)) then
{
	deleteVehicle _fish;
	titleText[format["You caught a %1",_type],"PLAIN"];
};