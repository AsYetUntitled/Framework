/*
*        File: fn_isDamaged.sqf
*        Author: BoGuu
*
*        Description:
*        Returns true if the target is damaged, else returns false.
*/

private["_damage","_return"];
params [
    ["_target",objNull,[objNull]]
];

_damage = (getAllHitPointsDamage _target select 2) call BIS_fnc_greatestnum;
_return = ([false,true] select (_damage > 0.01)); 
 
_return;