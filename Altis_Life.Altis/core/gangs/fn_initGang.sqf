#include "..\..\script_macros.hpp"
/*
	File: fn_initGang.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main initialization for gangs?
*/
private["_exitLoop","_group","_wait"];
if(playerSide != civilian) exitWith {}; //What in the hell?
[player] join (createGroup civilian);
if(EQUAL(count life_gangData,0)) exitWith {}; //Dafuq?

_wait = round(random(8));
sleep _wait;

//Loop through to make sure there is not a group already created with the gang.
_exitLoop = false;
{
	_groupName = _x GVAR "gang_name";
	if(!isNil "_groupName") then {
		_groupOwner = _x GVAR ["gang_owner",""];
		_groupID = _x GVAR "gang_id";
		if(EQUAL(_groupOwner,"") OR isNil "_groupID") exitWith {}; //Seriously?
		if(EQUAL(SEL(life_gangData,0),_groupID) && {EQUAL(SEL(life_gangData,1),_groupOwner)}) exitWith {_group = _x; _exitLoop = true;};
	};
} foreach allGroups;

if(!isNil "_group") then {
	[player] join _group;
	if(EQUAL(SEL(life_gangData,1),steamid)) then {
		_group selectLeader player;
		[player,_group] remoteExecCall ["TON_fnc_clientGangLeader",(units _group)];
	};
} else {
	_group = grpPlayer;
	_group SVAR ["gang_id",SEL(life_gangData,0),true];
	_group SVAR ["gang_owner",SEL(life_gangData,1),true];
	_group SVAR ["gang_name",SEL(life_gangData,2),true];
	_group SVAR ["gang_maxMembers",SEL(life_gangData,3),true];
	_group SVAR ["gang_bank",SEL(life_gangData,4),true];
	_group SVAR ["gang_members",SEL(life_gangData,5),true];
};
