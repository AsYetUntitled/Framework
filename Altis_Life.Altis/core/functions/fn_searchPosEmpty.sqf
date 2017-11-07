/*
    File: fn_searchPosEmpty.sqf
    Author: R3F_Team

    Description:
    Return a clear position in the sky.

    Parameter(s):
    0: (Optional) offset 3D cube in which to look for a location (default [0,0,0])

    Returns:
    Array (Position)
*/
params [
    ["_offset",[0,0,0],[[]]]
];
private "_nb_tirages";
private "_position_degagee";
// Find an open position (sphere of radius 50 m) into the sky.
for [
    {
        _position_degagee = [random 3000, random 3000, 10000 + (random 20000)] vectorAdd _offset;
        _nb_tirages = 1;
    },
    {
        !isNull (nearestObject _position_degagee) && _nb_tirages < 25
    },
    {
        _position_degagee = [random 3000, random 3000, 10000 + (random 20000)] vectorAdd _offset;
        _nb_tirages = _nb_tirages+1;
    }
] do {};

_position_degagee
