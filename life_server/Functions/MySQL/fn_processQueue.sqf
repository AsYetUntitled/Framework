/*
	File: fn_processQueue.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Processes the request?
*/
private["_data","_handle"];
_data = [_this,0,[],[[]]] call BIS_fnc_param;
if(count _data == 0) exitWith {diag_log "::SQL:: Process Queue exited due to empty array"};

_handle = _data spawn DB_fnc_update;
waitUntil {scriptDone _handle};