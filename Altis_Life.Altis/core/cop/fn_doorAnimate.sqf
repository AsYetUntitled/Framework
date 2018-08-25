#include "..\..\script_macros.hpp"
/*
    File: fn_doorAnimate.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Animates a door?
*/

params [
    ["_object", objNull, [objNull]]
];

private _doors = FETCH_CONFIG2(getNumber, "CfgVehicles", typeOf _object, "NumberOfDoors");
private _door = 0;

//Find the nearest door
for "_i" from 1 to _doors do {
    _selPos = _object selectionPosition format ["Door_%1_trigger",_i];
    _worldSpace = _object modelToWorld _selPos;
    if (player distance _worldSpace < 5) exitWith {_door = _i;};
};

if (_door isEqualTo 0) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.

if (typeOf _object isEqualTo "Land_Dome_Big_F" && _door isEqualTo 1) then {
    private _doorState = _object animationPhase "door_1a_move" isEqualto 0;
    _object animate ["door_1a_move", [0, 1] select _doorState];
    _object animate ["door_1b_move", [0, 1] select _doorState];
} else {
    private _doorName = format ["door_%1_rot",_door];
    private _doorState = _object animationPhase _doorName isEqualto 0;
    _object animate [_doorName, [0, 1] select _doorState];
};

closeDialog 0;