/*
    File: fn_nearestDoor.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Fetches the nearest door of the building the player is looking
    at.
*/
params [
    ["_house",objNull,[objNull]];
];
if (isNull _house) exitWith {0};
if (!(_house isKindOf "House_F")) exitWith {0};

private _door = 0;
private _doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
for "_i" from 1 to _doors do {
    _selectionPos = _house selectionPosition format ["Door_%1_trigger",_i];
    _worldSpace = _house modelToWorld _selectionPos;
    if (player distance _worldSpace < 2.4) exitWith {_door = _i};
};

_door;
