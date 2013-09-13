/*
	File: fn_impoundAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Impounds the vehicle
*/
private["_vehicle","_type","_time","_price"];
_vehicle = cursorTarget;
if(player distance cursorTarget > 5) exitWith {};
if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship")) then
{
	if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {};
	//_time = _vehicle getVariable "time";
	//if(isNil {_time}) exitWith {deleteVehicle _vehicle; hint "This vehicle was hacked in"};
	//if((time - _time)  < 120) exitWith {hint "This is a freshly spawned vehicle, you have no right impounding it."};
	if((count crew _vehicle) == 0) then
	{
		if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {};
		_type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
		switch (true) do
		{
			case (_vehicle isKindOf "Car"): {_price = life_impound_car;};
			case (_vehicle isKindOf "Ship"): {_price = life_impound_boat;};
			case (_vehicle isKindOf "Air"): {_price = life_impound_air;};
		};
		if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {};
		hint format["You have impounded a %1\n\nYou have received $%2 for cleaning up the streets!",_type,_price];
		
		if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {};
		if(!alive _vehicle) then
		{
			deleteVehicle _vehicle;
		}
			else
		{
			deleteVehicle _vehicle;
		};
		
		life_atmcash = life_atmcash + _price;
	};
};