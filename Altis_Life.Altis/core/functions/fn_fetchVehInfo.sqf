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
params [
    ["_class","",[""]]
];

if (_class isEqualTo "") exitWith {[]}; //Bad class passed.
private _config = configFile >> "CfgVehicles" >> _class;
if (!isClass _config) exitWith {[]}; //Class doesn't exist in CfgVehicles

private _scope = getNumber (_config >> "scope");
private _picture = getText (_config >> "picture");
private _displayName = getText (_config >> "displayName");
private _vehicleClass = getText (_config >> "vehicleClass");
private _side = getNumber (_config >> "side");
private _faction = getText (_config >> "faction");
private _superClass = inheritsFrom _config;
private _speed = getNumber (_config >> "maxSpeed");
private _armor = getNumber (_config >> "armor");
private _seats = getNumber (_config >> "transportSoldier") + count ("true" configClasses (_config >> "Turrets")); //number of seats = number of passengers + number of vehicle turrets
private _hp = getNumber (_config >> "enginePower");
private _fuel = getNumber (_config >> "fuelCapacity");

[_class,_scope,_picture,_displayName,_vehicleClass,_side,_faction,_superClass,_speed,_armor,_seats,_hp,_fuel];
