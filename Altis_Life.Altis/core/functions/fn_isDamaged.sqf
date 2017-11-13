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

(getAllHitPointsDamage _target) params ["","",["_damage",[],[[]]]];
_damage = selectMax _damage;
private _return = ([false,true] select (_damage > 0.01));

_return;