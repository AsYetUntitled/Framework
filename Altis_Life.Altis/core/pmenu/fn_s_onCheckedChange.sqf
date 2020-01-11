#include "..\..\script_macros.hpp"
/*
    File: fn_s_onCheckedChange.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Switching it up and making it prettier..
*/
params [
    ["_option","",[""]],
    ["_state",0,[0]]
];
if (_option isEqualTo "") exitWith {};

switch _option do {
    case "tags": {
        if (_state isEqualTo 1) then {
            profileNamespace setVariable ["life_settings_tagson",true];
            LIFE_ID_PlayerTags = addMissionEventHandler ["EachFrame", life_fnc_playerTags];
        } else {
            profileNamespace setVariable ["life_settings_tagson",false];
            removeMissionEventHandler ["EachFrame",LIFE_ID_PlayerTags];
        };
    };

    case "objects": {
        if (_state isEqualTo 1) then {
            profileNamespace setVariable ["life_settings_revealObjects",true];
            LIFE_ID_RevealObjects = addMissionEventHandler ["EachFrame", life_fnc_revealObjects];
        } else {
            profileNamespace setVariable ["life_settings_revealObjects",false];
            removeMissionEventHandler ["EachFrame",LIFE_ID_RevealObjects];
        };
    };

    case "sidechat": {
        if (_state isEqualTo 1) then {
            life_enableSidechannel = true;
            profileNamespace setVariable ["life_enableSidechannel",true];
            life_settings_enableSidechannel = profileNamespace getVariable ["life_enableSidechannel",true];
        } else {
            life_enableSidechannel = false;
            profileNamespace setVariable ["life_enableSidechannel",false];
            life_settings_enableSidechannel = profileNamespace getVariable ["life_enableSidechannel",false];
        };
        [player,life_settings_enableSidechannel,playerSide] remoteExecCall ["TON_fnc_manageSC",RSERV];
    };

    case "broadcast": {
        if (_state isEqualTo 1) then {
            life_enableNewsBroadcast = true;
            profileNamespace setVariable ["life_enableNewsBroadcast",true];
            life_settings_enableNewsBroadcast = profileNamespace getVariable ["life_enableNewsBroadcast",true];
        } else {
            life_enableNewsBroadcast = false;
            profileNamespace setVariable ["life_enableNewsBroadcast",false];
            life_settings_enableNewsBroadcast = profileNamespace getVariable ["life_enableNewsBroadcast",false];
        };
    };
};
