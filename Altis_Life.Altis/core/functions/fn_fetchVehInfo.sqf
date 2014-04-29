/*
	File: fn_fetchVehInfo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in returning information about a vehicle from Config >> "CfgVehicles"
	
	Return:
	0: classname
	1: scope
	2: picture
	3: displayname
	4: vehicleclass
	5: side
	6: faction
	7: Base / Superclass
	8: Max Speed
	9: Armor Rating
	10: Passenger Seats
	11: Max Horse power
	12: Fuel Capacity
*/
private["_class","_scope","_picture","_displayName","_vehicleClass","_side","_faction","_superClass","_speed","_armor","_seats","_hp","_fuel"];
_class = [_this,0,"",[""]] call BIS_fnc_param;
if(_class == "") exitWith {[]}; //Bad class passed.
if(!isClass (configFile >> "CfgVehicles" >> _class)) exitWith {[]}; //Class doesn't exist in CfgVehicles

//Predefine some stuff.
_scope = -1;
_picture = "";
_displayName = "";
_vehicleClass = "";
_side = -1;
_faction = "";
_speed = 0;
_armor = 0;
_seats = 0;
_hp = 0;
_fuel = 0;

//Fetch
_scope = getNumber(configFile >> "CfgVehicles" >> _class >> "scope");
_picture = getText(configFile >> "CfgVehicles" >> _class >> "picture");
_displayName = getText(configFile >> "CfgVehicles" >> _class >> "displayName");
_vehicleClass = getText(configFile >> "CfgVehicles" >> _class >> "vehicleClass");
_side = getNumber(configFile >> "CfgVehicles" >> _class >> "side");
_faction = getText(configFile >> "CfgVehicles" >> _class >> "faction");
_superClass = configName(inheritsFrom (configFile >> "CfgVehicles" >> _class));
_speed = getNumber(configFile >> "CfgVehicles" >> _class >> "maxSpeed");
_armor = getNumber(configFile >> "CfgVehicles" >> _class >> "armor");
_seats = getNumber(configFile >> "CfgVehicles" >> _class >> "transportSoldier");
_hp = getNumber(configFile >> "CfgVehicles" >> _class >> "enginePower");
_fuel = getNumber(configFile >> "CfgVehicles" >> _class >> "fuelCapacity");

//Return
[_class,_scope,_picture,_displayName,_vehicleClass,_side,_faction,_superClass,_speed,_armor,_seats,_hp,_fuel];