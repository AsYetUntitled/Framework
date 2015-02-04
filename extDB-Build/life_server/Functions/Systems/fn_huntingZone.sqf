/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Spawns animals around the marker when a player
	is near. Very basic WIP
	
	TODO:
	Change it up so animals repopulate over time.
*/
private["_animalList","_dist","_radius","_animals","_zoneName","_unitsNear","_animalsActive"];
_zoneName = [_this,0,"",[""]] call BIS_fnc_param;
_maxAnimals = [_this,1,10,[0]] call BIS_fnc_param;
if(_zoneName == "") exitWith {};
_animalList = ["Sheep_random_F","Goat_random_F","Hen_random_F","Cock_random_F"];
_radius = (getMarkerSize _zoneName) select 0;
_dist = _radius + 100;
_zone = getMarkerPos _zoneName;
_animals = [];

_unitsNear = false;
_animalsActive = false;
while {true} do {
	{if((_x distance _zone) < _dist) exitWith {_unitsNear = true;}; _unitsNear = false;} foreach playableUnits;
	if(_unitsNear && !_animalsActive) then {
		_animalsActive = true;
		for "_i" from 1 to _maxAnimals do {
			_animalClass = _animalList select floor random count _animalList;
			_position = [((_zone select 0) - _radius + random (_radius * 2)), ((_zone select 1) - _radius + random (_radius * 2)),0];
			_animal = createAgent [_animalClass,_position,[],0,"FORM"];
			_animal setDir (random 360);
			_animals pushBack _animal;
		};
	} else {
		if(!_unitsNear && _animalsActive) then {
			{deleteVehicle _x;} foreach _animals;
			_animals = [];
			_animalsActive = false;
		};
	};
	sleep (3 + random 2);
};