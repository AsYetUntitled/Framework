/*
	File: fn_onRespawn.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Execute various actions when the _unit respawns.
*/
private["_unit","_corpse","_handle","_spawn"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_corpse = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if(isnull _unit) exitWith {};
if(!isNull _corpse) then{deleteVehicle _corpse;};

_handle = [] spawn life_fnc_setupActions;
waitUntil {scriptDone _handle};

switch(playerSide) do
{
	case west: 
	{
		if(str(_unit) in ["Admin_1","Admin_2","Admin_3","Admin_4","Admin_5","Admin_6"]) then
		{
			_unit setPos (getMarkerPos "respawn_admin");
		};
		[] spawn life_fnc_loadGear;
	};
	
	case civilian:
	{
		private["_spawn"];
		_spawn = spawnbuildings call BIS_fnc_selectRandom;
		_spawn = _spawn buildingPos 0;
		_unit setVariable["restrained",false,true];
		_unit setVariable["Escorting",false,true];
		_unit setVariable["transporting",false,true];
		_unit setPos _spawn;
	};
};

if(life_is_arrested) then
{
	hint "You tried to suicide from jail, you will be jailed again with a longer time.";
	life_is_arrested = false;
	[_unit,true] spawn life_fnc_jail;
};

_unit addRating 100000;

[[_unit,life_sidechat,playerSide],"STS_fnc_managesc",false,false] spawn BIS_fnc_MP;
[] call life_fnc_hudUpdate;