/*
	File: initServer.sqf
	
	Description:
	Starts the initialization of the server.
*/
[] call compile PreprocessFileLineNumbers "\life_server\init.sqf";
master_group attachTo[bank_obj,[0,0,0]];

onMapSingleClick "if(_alt) then {vehicle player setPos _pos};";