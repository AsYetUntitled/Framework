/*
	File: wanted_add.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds or appends a unit to the wanted list.
*/
private["_unit","_type","_uid","_index","_data","_crimes","_val"];
_unit = [_this,0,Objnull,["",Objnull]] call BIS_fnc_param;
_type = _this select 1;
if(typeName _unit == typeName ObjNull) then
{
	if(isNull _unit) exitWith {};
	if(_unit isKindOf "B_medic_F") exitWith{};
};
_uid = if(typeName _unit == typeName "") then {_unit} else {getPlayerUID _unit};
_index = [_uid,life_wanted_list] call fnc_index;

if(_index != -1) then
{
	_data = life_wanted_list select _index;
	_crimes = _data select 2;
	_crimes set[count _crimes,(_type select 0)];
	_val = _data select 3;
	life_wanted_list set[_index,[(name _unit),_uid,_crimes,(_type select 1) + _val]];
}
	else
{
	life_wanted_list set[count life_wanted_list,[(name _unit),_uid,[(_type select 0)],(_type select 1)]];
};

//publicVariable "life_wanted_list";