#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the player about an invite.
*/
private["_name","_group"];
_name = [_this,0,"",[""]] call BIS_fnc_param;
_group = [_this,1,grpNull,[grpNull]] call BIS_fnc_param;
if(_name == "" OR isNull _group) exitWith {}; //Fail horn anyone?

_gangName = _group getVariable "gang_name";
_action = [
	format["%1 has invited you to a gang called %2<br/>If you accept the invitation you will be a part of their gang and will have access to the gang funds and controlled gang hideouts.",_name,_gangName],
	"Gang Invitation",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;

if(_action) then {
	[player] join _group;
	[[4,_group],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
} else {
	_grpMembers = grpPlayer getVariable "gang_members";
	_grpMembers = _grpMembers - [steamid];
	grpPlayer setVariable["gang_members",_grpMembers,true];
	[[4,_grp],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
};