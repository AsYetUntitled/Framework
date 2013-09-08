/*
	@file Version: 1.Bf
	@file name: wanted_add.sqf
	@file Author: TAW_Tonic
	@file edit: 5/18/2013
	Copyright © 2013 Bryan Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
*/
private["_unit","_type"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_type = _this select 1;
if(isNull _unit) exitWith {};
if(_unit isKindOf "B_medic_F") exitWith{};

_index = [(getPlayerUID _unit),life_wanted_list] call fnc_index;

if(_index != -1) then
{
	_data = life_wanted_list select _index;
	_crimes = _data select 2;
	_crimes set[count _crimes,(_type select 0)];
	_val = _data select 3;
	life_wanted_list set[_index,[(name _unit),(getPlayerUID _unit),_crimes,(_type select 1) + _val]];
}
	else
{
	life_wanted_list set[count life_wanted_list,[(name _unit),(getPlayerUID _unit),[(_type select 0)],(_type select 1)]];
};

//publicVariable "life_wanted_list";