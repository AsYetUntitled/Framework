#include "\life_hc\hc_macros.hpp"
/*
    File: fn_houseGarage.sqf
    Author: BoGuu
    Description:
    Database functionality for house garages - HC
*/

params [
    ["_uid","",[""]],
    ["_house",objNull,[objNull]],
    ["_mode",-1,[0]]
];

if (_uid isEqualTo "" || {isNull _house} || {_mode isEqualTo -1}) exitWith {};

private _housePos = getPosATL _house;
private _active = ["0", "1"] select (_mode isEqualTo 0);
private _query = format ["updateGarage:%1:%2:%3", _active, _uid, _housePos];
[_query, 1] call HC_fnc_asyncCall;
