/*
    File: fn_index.sqf
    Author: Bryan "Tonic" Boardwine

    Description: TODO
*/
params [
    "_item",
    ["_stack",[],[[]]]
];

_stack findIf {_item in _x};
