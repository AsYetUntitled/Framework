/*
	Copyright © 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	File: fn_wantedFetch.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Displays wanted list information sent from the server.
*/
private["_ret","_list","_forEachIndex"];
_ret = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _ret) exitWith {};

_ret = owner _ret;

_list = [];
{
	_uid = _x select 1;
	if([_uid] call STS_fnc_isUIDActive) then
	{
		_list set[count _list,_x];
	};
} foreach life_wanted_list;
[[_list],"life_fnc_wantedList",_ret,false] spawn life_fnc_MP;