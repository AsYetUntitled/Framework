#include "..\..\script_macros.hpp"
/*
    File: fn_copSiren.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the cop siren sound for other players.
*/

params [
    ["_vehicle",objNull,[objNull]]
];

if (isNull _vehicle) exitWith {};
if (isNil {_vehicle getVariable "siren"}) exitWith {};

for "_i" from 0 to 1 step 0 do {
    if !(alive _vehicle) exitWith {}; //also checks for objNull
    if !(_vehicle getVariable "siren") exitWith {};
    if (crew _vehicle isEqualTo []) then {
        _vehicle setVariable ["siren",false,true]
    };
    _vehicle say3D ["sirenLong",500,1]; //Class name specified in description.ext, max distance & pitch
    uiSleep 4.870; //Exactly matches the length of the audio file.
};
