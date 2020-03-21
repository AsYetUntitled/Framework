/*
    File: fn_clientGangLeader.sqf
    Author: Bryan "Tonic" Boardwine

    Description: appoints player as gang leader
*/
params [
    ["_unit", objNull, [objNull]],
    ["_group", grpNull, [grpNull]]
];

_group selectLeader _unit;
[1, "STR_GNOTF_GaveTransfer", true] remoteExecCall ["life_fnc_broadcast", _unit];
[_unit,"COLONEL"] remoteExec ["setRank", units _group, _group];
