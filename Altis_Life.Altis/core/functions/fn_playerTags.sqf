/*
	File: fn_playerTags.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds the tags above other players heads when close and have visible range.
*/
private["_visible","_position","_nearUnits"];
_nearUnits = (visiblePosition player) nearEntities ["Man",10];
{
	if(player distance _x < 10 && isPlayer _x && _x != player) then {
		_visible = lineIntersects [eyePos player, eyePos _x,player, _x];
		if(!_visible) then {
			_position = visiblePosition _x;
			_position set[2,(getPosATL _x select 2) + 2.2];
			drawIcon3D ["",[1,1,1,1],_position,0,0,0,name _x,0,0.04];
		};
	};
} foreach _nearUnits;