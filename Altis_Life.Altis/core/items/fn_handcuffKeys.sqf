/*
    file : fn_handcuffKeys.sqf
    authro: Yeiij
    description: function that removes restrained state on target using handcuffkeys item
*/

params[
    ["_unit",objNull,[objNull]]
];

if (!(isNull _unit) && {_unit isKindOf "Man"} && {(isPlayer _unit)} && {alive _unit} && {_unit distance player < 3.5} && {!(_unit getVariable "Escorting")} && {(_unit getVariable "restrained")} && {speed _unit < 1}) exitWith {
    [_unit, true] call life_fnc_unrestrain;
};
