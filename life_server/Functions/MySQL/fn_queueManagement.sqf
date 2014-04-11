/*
	File: fn_queueManagement.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main thread for handling misc requests that aren't critical.
*/
private["_data","_handle"];

while {true} do
{
	waitUntil {count life_DB_queue > 0};
	_data = life_DB_queue select 0;
	_handle = [_data] spawn DB_fnc_processQueue;
	waitUntil {scriptDone _handle};
	life_DB_queue set[0,-1];
	life_DB_queue = life_DB_queue - [-1];
	sleep 1;
};