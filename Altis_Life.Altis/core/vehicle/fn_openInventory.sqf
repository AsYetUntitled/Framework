/*
	File: fn_openInventory.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initialization of vehicle virtual inventory menu.
*/
private["_vehicle","_veh_data"];
if(dialog) exitWith {};
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle OR !(_vehicle isKindOf "Car" OR _vehicle isKindOf "Air" OR _vehicle isKindOf "Ship")) exitWith {}; //Either a null or invalid vehicle type.

if((_vehicle getVariable ["trunk_in_use",false])) exitWith {hint "This vehicle's trunk is in use, only one person can use it at a time."};
_vehicle setVariable["trunk_in_use",true,true];
if(!createDialog "TrunkMenu") exitWith {"Failed Creating Dialog";}; //Couldn't create the menu?
disableSerialization;
ctrlSetText[3501,format["Vehicle Trunk - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];

_veh_data = [_vehicle] call life_fnc_vehicleWeight;
if(_veh_data select 0 == -1) exitWith {closeDialog 0; _vehicle setVariable["trunk_in_use",false,true]; hint "This vehicle isn't capable of storing virtual items.";};

ctrlSetText[3504,format["Weight: %1/%2",_veh_data select 1,_veh_data select 0]];
[_vehicle] call life_fnc_vehInventory;
life_trunk_vehicle = _vehicle;

[_vehicle] spawn
{
	waitUntil {isNull (findDisplay 3500)};
	(_this select 0) setVariable["trunk_in_use",false,true];
};