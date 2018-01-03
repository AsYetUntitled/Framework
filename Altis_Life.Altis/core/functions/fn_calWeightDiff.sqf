#include "..\..\script_macros.hpp"
/*
    File: fn_calWeightDiff.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Calculates weight differences in the _cWeight (current Weight) against the _mWeight (Max Weight)
    Multiple purpose system for this life mission.
*/
if !( 
    params [
        ["_item","",[""]],
        ["_value",-1,[0]],
        ["_cWeight",-1,[0]],
        ["_mWeight",-1,[0]]
    ]
) exitWith {-1};

private _iWeight = [_item] call life_fnc_itemWeight;
if (_iWeight isEqualTo 0) exitWith {_value};

(floor ((_mWeight - _cWeight) / _iWeight)) min _value;
