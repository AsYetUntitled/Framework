/*
    File: fn_stripDownPlayer.sqf
    Author: Tobias 'Xetoxyc' Sittenauer

    Description: Strip the player down
*/

removeAllWeapons player;

{
    player removeMagazine _x;
    true
} count (magazines player);

removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;

{
    player unassignItem _x;
    player removeItem _x;
    true
} count (assignedItems player);

if !(hmd player isEqualTo "") then {
    player unlinkItem (hmd player);
};