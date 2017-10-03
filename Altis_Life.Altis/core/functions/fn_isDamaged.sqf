/*
*        File: fn_isDamaged.sqf
*        Author: BoGuu
*
*        Description:
*        Returns true if the target is damaged, else returns false.
*/

params [
    ["_target",objNull,[objNull]]
];

private _damage = (getAllHitPointsDamage _target select 2) call BIS_fnc_greatestnum;
private _return = ([false,true] select (_damage > 0.01));

_return;