/*
    File: moveIn.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Set a variable on the player so that he can't get out of a vehicle
*/

life_disable_getIn = false;
player moveInCargo (_this select 0);
life_disable_getOut = true;
