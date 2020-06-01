/*
    File: fn_clientGangLeader.sqf
    Author: Bryan "Tonic" Boardwine

    Description: appoints player as gang leader
*/
params [
    ["_unit", objNull, [objNull]],
    ["_group", grpNull, [grpNull]]
];

_unit setRank "COLONEL";

if !(local _group) exitWith {};
_group selectLeader _unit;

if !(_unit isEqualTo player) exitWith {};
hint localize "STR_GNOTF_GaveTransfer";
