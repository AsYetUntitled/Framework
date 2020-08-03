#include "..\..\script_macros.hpp"
/*
    File: fn_itemWeight.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Gets the items weight and returns it.
*/

params [
    ["_item", "", [""]]
];

if (_item isEqualTo "") exitWith {};

M_CONFIG(getNumber,"VirtualItems",_item,"weight");
