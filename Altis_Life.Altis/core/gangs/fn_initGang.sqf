#include "..\..\script_macros.hpp"
/*
    File: fn_initGang.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main initialization for gangs?
*/
private["_exitLoop","_group","_wait"];
if (playerSide != civilian) exitWith {}; //What in the hell?
[player] join (createGroup civilian);
if (count life_gangData isEqualTo 0) exitWith {}; //Dafuq?

_wait = round(random(8));
sleep _wait;

//Loop through to make sure there is not a group already created with the gang.
_exitLoop = false;
{
    _groupName = _x getVariable "gang_name";
    if (!isNil "_groupName") then {
        _groupOwner = _x getVariable ["gang_owner",""];
        _groupID = _x getVariable "gang_id";
        if (_groupOwner isEqualTo "" || isNil "_groupID") exitWith {}; //Seriously?
        if (SEL(life_gangData,0) isEqualTo _groupID && {SEL(life_gangData,1) isEqualTo _groupOwner}) exitWith {_group = _x; _exitLoop = true;};
    };
} forEach allGroups;

if (!isNil "_group") then {
    [player] join _group;
    if (SEL(life_gangData,1) isEqualTo getPlayerUID player) then {
        _group selectLeader player;
        [player,_group] remoteExecCall ["TON_fnc_clientGangLeader",(units _group)];
    };
} else {
    _group = group player;
    _group setVariable ["gang_id",SEL(life_gangData,0),true];
    _group setVariable ["gang_owner",SEL(life_gangData,1),true];
    _group setVariable ["gang_name",SEL(life_gangData,2),true];
    _group setVariable ["gang_maxMembers",SEL(life_gangData,3),true];
    _group setVariable ["gang_bank",SEL(life_gangData,4),true];
    _group setVariable ["gang_members",SEL(life_gangData,5),true];
};
