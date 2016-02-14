#include "..\..\script_macros.hpp"
/*
	File: fn_gangMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	31 hours of no sleep screw your description.
*/
private["_ownerID","_gangBank","_gangMax","_gangName","_members","_allUnits","_ctrl"];
disableSerialization;
if(isNull (findDisplay 2620)) then {
	if(!(createDialog "Life_My_Gang_Diag")) exitWith {}; //NOOOOOOOOOOOOOOOOOOOOOOOoooooooooooooOOOOOOOOOOOOOOOOOOOOOOOOOOO00000000000000oooooo
};

_ownerID = grpPlayer GVAR ["gang_owner",""];
if(EQUAL(_ownerID,"")) exitWith {closeDialog 0;}; //Bad juju

_gangName = grpPlayer getVariable "gang_name";
_gangBank = GANG_FUNDS;
_gangMax = grpPlayer getVariable "gang_maxMembers";

if(_ownerID != steamid) then {
	(CONTROL(2620,2622)) ctrlEnable false; //Upgrade
	(CONTROL(2620,2624)) ctrlEnable false; // Kick
	(CONTROL(2620,2625)) ctrlEnable false; //Set New Leader
	(CONTROL(2620,2630)) ctrlEnable false; //Invite Player
	(CONTROL(2620,2631)) ctrlEnable false; //Disband Gang
};

(CONTROL(2620,2629)) ctrlSetText _gangName;
(CONTROL(2620,601)) ctrlSetText format[(localize "STR_GNOTF_Funds")+ " $%1",[_gangBank] call life_fnc_numberText];

//Loop through the players.
_members = CONTROL(2620,2621);
lbClear _members;
{
	if((getPlayerUID _x) == _ownerID) then {
		_members lbAdd format["%1 " +(localize "STR_GNOTF_GangLeader"),(_x GVAR ["realname",name _x])];
		_members lbSetData [(lbSize _members)-1,str(_x)];
	} else {
		_members lbAdd format["%1",(_x GVAR ["realname",name _x])];
		_members lbSetData [(lbSize _members)-1,str(_x)];
	};
} foreach (units grpPlayer);

_grpMembers = units grpPlayer;
_allUnits = playableUnits;

//Clear out the list..
{
	if(_x in _grpMembers OR side _x != civilian && isNil {(group _x) getVariable "gang_id"}) then {
		_allUnits set[_forEachIndex,-1];
	};
} foreach _allUnits;
SUB(_allUnits,[-1]);

_ctrl = CONTROL(2620,2632);
lbClear _ctrl; //Purge the list
{
	_ctrl lbAdd format["%1",_x GVAR ["realname",name _x]];
	_ctrl lbSetData [(lbSize _ctrl)-1,str(_x)];
} foreach _allUnits;