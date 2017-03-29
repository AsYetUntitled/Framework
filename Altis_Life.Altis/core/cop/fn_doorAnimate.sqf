#include "..\..\script_macros.hpp"
/*
    File: fn_doorAnimate.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Animates a door
*/

params [
    ["_building",objNull,[objNull]]
];

private _doors = 1;
_doors = FETCH_CONFIG2(getNumber,"CfgVehicles",typeOf _building,"NumberOfDoors");

private _door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
    private _selPos = _building selectionPosition format ["Door_%1_trigger",_i];
    private _worldSpace = _building modelToWorld _selPos;
    if (player distance _worldSpace < 5) exitWith {
        _door = _i;
    };
};

if (_door isEqualTo 0) exitWith {
    hint localize "STR_Cop_NotaDoor"
}; //Not near a door to be broken into.

if (_building animationPhase format ["door_%1_rot",_door] isEqualTo 0) then {
    _building animateSource [format ["Door_%1_source", _door], 1];
} else {
    _building animateSource [format ["Door_%1_source", _door], 0];
};

closeDialog 0;
