#include "..\..\script_macros.hpp"

/*
    File: fn_doorAnimate.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Animates a door?
*/

params [
    ["_b", objNull, [objNull]]
];

private _doors = getNumber (configFile >> "CfgVehicles" >> (typeOf _b) >> "NumberOfDoors");
private _door = 0;

//-- find the closest door
for "_i" from 1 to _doors do {
    _selPos = _b selectionPosition format ["Door_%1_trigger",_i];
    _worldSpace = _b modelToWorld _selPos;
    if (player distance _worldSpace < 5) exitWith {_door = _i};
};

//-- if no door nearby, exitWith
if (_door isEqualTo 0) exitWith {hint localize "STR_Cop_NotaDoor"};

//-- if the door is currently open, set the target to 0 (close)
private _target = [1, 0] select (
    ((_b animationPhase format ["door_%1a_move", _door]) isEqualTo 1) || 
    ((_b animationPhase format ["door_%1_rot", _door]) isEqualTo 1) || 
    ((_b animationPhase format ["door_%1a_rot", _door]) isEqualTo 1) 
);

//-- play the animation for all known sources.
{
    _b animateSource [format [_x, _door], _target];
} forEach ["Door_%1_source", "Door_%1_sound_source", "Door_%1_noSound_source"];


closeDialog 0;
