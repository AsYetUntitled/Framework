#include "\life_server\script_macros.hpp"
/*
    File: fn_recupKeyForHC.sqf
    Author : NiiRoZz

    Description:
    Tells the server to recup the Key of player
*/
params [
    ["_uid","",[""]],
    ["_side",sideUnknown,[civilian]]
];
if (_uid isEqualTo "") exitWith {}; //NULL
[missionNamespace getVariable [format ["%1_KEYS_%2",_uid,_side],[]]] remoteExecCall ["HC_fnc_receivekeyofServer",HC_Life];
