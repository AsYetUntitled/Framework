/*
	File: fn_setGangLeader.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sets / appoints the new gang leader selected.
*/
private["_dialog","_index","_members","_sel","_user"];
disableSerialization;

_dialog = findDisplay 2620;
_members = _dialog displayCtrl 2621;
_sel = lbCurSel 2621;
_data = _members lbData _sel;
_data = call compile format["%1", _data];

_index = [life_my_gang,life_gang_list] call fnc_index;
if(_index == -1) exitWith {};
if(leader(group player) != player) exitWith {hint "You don't have the ability to do that."};

_gang = life_gang_list select _index;
_name = _gang select 0;
_group = _gang select 1;
_locked = _gang select 2;
_owner = _gang select 3;
_ownerID = _gang select 4;

life_gang_list set[_index,[_name,_group,_locked,str(_data),getPlayerUID _data]];
publicVariable "life_gang_list";

_group selectLeader _data;
[[_data,_group], "clientGangLeader",_data,false] spawn life_fnc_MP;

player setRank "PRIVATE";
player addRating 0;

[false] spawn life_fnc_gangManagement;