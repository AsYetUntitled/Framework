/*
	File: fn_settingsInit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes key parts for the Settings menu for View distance and other stuff.
*/
tawvd_foot = viewDistance;
tawvd_car = viewDistance;
tawvd_air = viewDistance;
tawvd_addon_disable = true;
//The hacky method... Apparently if you stall (sleep or waitUntil) with CfgFunctions you stall the mission initialization process... Good job BIS, why wouldn't you spawn it via preInit or postInit?
[] spawn
{
	private["_recorded"];
	while {true} do
	{
		_recorded = vehicle player;
		[] call life_fnc_updateViewDistance;
		waitUntil {_recorded != vehicle player || !alive player};
	};
};