/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name]
*/
private["_side"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

switch (_side) do
{
	case west:
	{
		[["cop_spawn_1","Kavala HQ"],["cop_spawn_2","Pyrgos HQ"],["cop_spawn_3","Athira HQ"],["cop_spawn_4","Air HQ"],["cop_spawn_5","HW Patrol"]];
	};
	
	case civilian:
	{
		[["civ_spawn_1","Kavala"],["civ_spawn_2","Pyrgos"],["civ_spawn_3","Athira"],["civ_spawn_4","Sofia"]];
	};
};