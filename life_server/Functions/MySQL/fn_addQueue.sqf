/*
	File: fn_addQueue.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Apart of a new experimental system for managing SQL Queue processing.
*/
private["_data"];
_data = [_this,0,[],[[]]] call BIS_fnc_param;
if(count _data == 0) exitWith {}; //Not a valid queue request.

life_DB_queue set[count life_DB_queue,_data];