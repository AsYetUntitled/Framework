/*
    File: fn_huntingZone.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Spawns animals around the marker when a player
    is near. Very basic WIP

    TODO:
    Change it up so animals repopulate over time.
*/
private ["_animalList","_dist","_radius","_zoneName","_unitsNear","_animalsActive"];
params [
        ["_zoneName","",[""]],
        ["_maxAnimals",10,[0]]
];

if (_zoneName isEqualTo "") exitWith {};
_animalList = ["Sheep_random_F","Goat_random_F","Hen_random_F","Cock_random_F"];
_radius = (getMarkerSize _zoneName) select 0;
_dist = _radius + 100;
_zone = getMarkerPos _zoneName;

if (!isNil "animals" && {!(count animals isEqualTo 0)}) then {
    _maxAnimals = _maxAnimals - count(animals);
} else {
    animals = [];
};

_unitsNear = false;
_animalsActive = false;
for "_i" from 0 to 1 step 0 do {
    {if ((_x distance _zone) < _dist) exitWith {_unitsNear = true;}; _unitsNear = false;} forEach playableUnits;
    if (_unitsNear && !_animalsActive) then {
        _animalsActive = true;
        for "_i" from 1 to _maxAnimals do {
            _animalClass = selectRandom _animalList;
            _position = [((_zone select 0) - _radius + random (_radius * 2)), ((_zone select 1) - _radius + random (_radius * 2)),0];
            _animal = createAgent [_animalClass,_position,[],0,"FORM"];
            _animal setDir (random 360);
            animals pushBack _animal;
        };
    } else {
        if (!_unitsNear && _animalsActive) then {
            {deleteVehicle _x;} forEach animals;
            animals = [];
            _animalsActive = false;
        };
    };
    sleep (3 + random 2);
    _maxAnimals = param [1,10,[0]];
    publicVariableServer "animals";
};
