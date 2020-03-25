/*
    File: fn_revealObjects.sqf
    Author: Bryan "Tonic" Boardwine
    
    Description:
    Reveals nearest objects within 15 automatically to help with picking
    up various static objects on the ground such as money, water, etc.
    
    Can be taxing on low-end systems or AMD CPU users.
*/
private _objects = nearestObjects[visiblePositionASL player, ["Land_CargoBox_V1_F","Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Money_F","Land_Suitcase_F","CAManBase"], 15];
{
    player reveal _x;
    (group player) reveal _x;
} forEach _objects;