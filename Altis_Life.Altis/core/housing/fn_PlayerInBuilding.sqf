/*
	File : fn_PlayerInBuilding.sqf
	Author: NiiRoZz
	Description:
	Search if player are in building near player

	Parameter(s):
	0: OBJECT - Unit
	1: OBJECT- Building

	Returns:
	BOOL - True if player are in building else false

	Example
	//--- Find if unit are in house
	[_unit,_house] call life_fnc_PlayerInBuilding

*/
private["_unit","_building","_type","_relPos","_boundingBox","_min","_max","_myX","_myY","_myZ","_inside"];
_unit = _this select 0;
_building = _this select 1;

_type = typeOf _building;

_relPos = _building worldToModel (getPosATL _unit);
_boundingBox = boundingBox _building;

_min = _boundingBox select 0;
_max = _boundingBox select 1;


_myX = _relPos select 0;
_myY = _relPos select 1;
_myZ = _relPos select 2;


if ((_myX > (_min select 0)) and (_myX < (_max select 0))) then {
	if ((_myY > (_min select 1)) and (_myY < (_max select 1))) then {
		if ((_myZ > (_min select 2)) and (_myZ < (_max select 2))) then {
			_inside = true;
		} else { _inside = false; };
	} else { _inside = false; };
} else { _inside = false; };

_inside
