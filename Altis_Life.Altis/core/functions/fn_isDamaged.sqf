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

private _damage = selectMax (getAllHitPointsDamage _target select 2);

(_damage > 0.01);
