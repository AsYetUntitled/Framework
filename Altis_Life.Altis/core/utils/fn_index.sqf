/*
    File: fn_index.sqf
    Author: Bryan "Tonic" Boardwine

    Description: return index of _item in _stack
*/
params [
    "_item",
    ["_stack",[],[[]]]
];

_stack findIf {_item in _x};
