/*
	File: fn_playerTags.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds the tags above other players heads when close and have visible range.
*/
private["_visible","_position","_nearUnits"];
_nearUnits = nearestObjects[(visiblePosition player),["Man"],35];
{
	_hasName = if(!isNil {(_x getVariable "name")}) then {true} else {false};
	if(_hasName && {_x != player}) then {
		_position = visiblePosition _x;
		_position set[2,(getPosATL _x select 2) + 0.5];
		drawIcon3D ["a3\ui_f\data\map\MapControl\hospital_ca.paa",[1,0,0,1],_position,0.6,0.6,0,(_x getVariable ["name","Unknown Player"]),0,0.04];
	} else {
		if(isPlayer _x && {_x != player} && {_x distance player <= 10}) then {
			_visible = lineIntersects [eyePos player, eyePos _x,player, _x];
			if(!_visible) then {
				_position = visiblePosition _x;
				_position set[2,(getPosATL _x select 2) + 2.2];
				drawIcon3D ["",[1,1,1,1],_position,0,0,0,name _x,0,0.04];
			};
		};
	};
} foreach _nearUnits;