/*
    File: fn_vehicleCreate.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Answers the query request to create the vehicle in the database.
*/
params [
    ["_uid","",[""]],
    ["_side",sideUnknown,[west]],
    ["_vehicle",objNull,[objNull]],
    ["_color",0,[0]]
];

if (_uid isEqualTo "" || {_side isEqualTo sideUnknown} || {isNull _vehicle} || {!alive _vehicle}) exitWith {};
    
private _className = typeOf _vehicle;
private _type = call {
    if (_vehicle isKindOf "Car") exitWith {"Car"};
    if (_vehicle isKindOf "Air") exitWith {"Air"};
    if (_vehicle isKindOf "Ship") exitWith {"Ship"};
};

_side = switch _side do {
    case west: {"cop"};
    case civilian: {"civ"};
    case independent: {"med"};
    default {"Error"};
};

private _plate = round(random(1000000));
[_uid,_side,_type,_classname,_color,_plate] call HC_fnc_insertVehicle;

_vehicle setVariable ["dbInfo",[_uid,_plate],true];
