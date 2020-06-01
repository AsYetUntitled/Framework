#include "..\..\script_macros.hpp"
/*
    File: fn_escortAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description: Attaches the desired person(_unit) to the player(player) and "escorts them".
*/
params [
    ["_unit", objNull, [objNull]]
];

if (!isNull (player getVariable ["escortingPlayer",objNull])) exitWith {};
if (isNull _unit || {!isPlayer _unit}) exitWith {};
if !(side _unit in [civilian,independent]) exitWith {};
if (player distance _unit > 3) exitWith {};

_unit attachTo [player, [0.1,1.1,0]];
player setVariable ["escortingPlayer", _unit];
player setVariable ["isEscorting", true];
_unit setVariable ["Escorting",true,true];

[_unit] spawn {
    params [
        ["_unit", objNull, [objNull]]
    ];
    waitUntil {!(_unit getVariable ["Escorting",false])};

    player setVariable ["escortingPlayer",nil];
    player setVariable ["isEscorting",false];
};
