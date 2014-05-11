/*
	File: fn_respawned.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sets the player up if he/she used the respawn option.
*/

//Reset our weight and other stuff
life_use_atm = TRUE;
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_cash = 0; //Make sure we don't get our cash back.
life_respawned = false;
player playMove "amovpercmstpsnonwnondnon";

//So I guess a fellow gang member, cop or myself killed myself so get me off that Altis Most Wanted
if(life_removeWanted) then {
	[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
};

life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
life_corpse setVariable["Reviving",nil,TRUE];

//Destroy our camera...
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

[] call SOCK_fnc_updateRequest;

//Cleanup of weapon containers near the body & hide it.
if(!isNull life_corpse) then {
	private["_containers"];
	life_corpse setVariable["Revive",TRUE,TRUE];
	_containers = nearestObjects[life_corpse,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} foreach _containers; //Delete the containers.
	hideBody life_corpse;
};

//Load gear for a 'new life'
switch(playerSide) do
{
	case west: {[] spawn life_fnc_loadGear;};
	case civilian: {
		[] call life_fnc_civFetchGear;
	};
	case independent: {
		[] call life_fnc_medicLoadout;
	};
};

player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];