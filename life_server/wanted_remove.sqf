/*
	@file Version: 2.1.3
	@file name: wanted_remove.sqf
	@file Author: TAW_Tonic
	@file edit: 7/18/2013
	Copyright © 2013 Bryan Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
*/
private["_unit","_index"];
_unit = _this select 0;

_index = [(getPlayerUID _unit),life_wanted_list] call fnc_index;

if(_index != -1) then
{
	life_wanted_list set[_index,-1];
	life_wanted_list = life_wanted_list - [-1];
	//publicVariable "life_wanted_list";
};