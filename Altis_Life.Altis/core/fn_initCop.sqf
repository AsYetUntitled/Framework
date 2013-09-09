/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
[] call life_fnc_spawnMenu;
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

player addRating 9999999;