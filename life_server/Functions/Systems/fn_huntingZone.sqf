/*
    File: fn_huntingZone.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Spawns animals around the marker when a player
    is near. Very basic WIP

    TODO:
    Change it up so animals repopulate over time.
*/
params [
    ["_zoneName","",[""]],
    ["_maxAnimals",10,[0]]
];

if (_zoneName isEqualTo "") exitWith {};
private _radius = (getMarkerSize _zoneName) select 0;
private _zone = getMarkerPos _zoneName;

if (!isNil "animals" && {!(count animals isEqualTo 0)}) then {
    _maxAnimals = _maxAnimals - count(animals);
} else {
    animals = [];
};

private _unitsNear = false;
private _animalsActive = false;
for "_i" from 0 to 1 step 0 do {
    {if ((_x distance _zone) < (_radius + 100)) exitWith {_unitsNear = true;}; _unitsNear = false;} forEach playableUnits;
    if (_unitsNear && !_animalsActive) then {
        _animalsActive = true;
        for "_i" from 1 to _maxAnimals do {  
            animals pushBack ((createAgent [selectRandom ["Sheep_random_F","Goat_random_F","Hen_random_F","Cock_random_F"], [((_zone select 0) - _radius + random (_radius * 2)), ((_zone select 1) - _radius + random (_radius * 2)),0], [], 0, "FORM"]) setDir (random 360));
        };
    } else {
        if (!_unitsNear && _animalsActive) then {
            {deleteVehicle _x;} forEach animals;
            animals = [];
            _animalsActive = false;
        };
    };
    uiSleep (3 + random 2);
    params [
        "",
        ["_maxAnimals",10,[0]]
    ];
};
