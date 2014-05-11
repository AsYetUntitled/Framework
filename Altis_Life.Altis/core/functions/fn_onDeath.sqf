/*
	File: fn_onDeath.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does whatever it needs to when a player dies.
*/
private["_unit","_killer","_weapons","_handle"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_source = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};

cutText["Waiting to respawn....","BLACK FADED"];
0 cutFadeOut 9999999;

if(playerSide == civilian) then
{
	removeAllContainers _unit;
};

hideBody _unit;
//Make my killer wanted!
if(side _source != west && alive _source) then
{
	if(vehicle _source isKindOf "LandVehicle") then
	{
		if(alive _source) then
		{
			[[getPlayerUID _source,name _source,"187V"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		};
	}
		else
	{
		[[getPlayerUID _source,name _source,"187"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	};
};

if(side _source == west && !life_use_atm) then
{
	if(life_cash != 0) then
	{
		[format["$%1 from the Federal Reserve robbery was returned from the robber being killed.",[life_cash] call life_fnc_numberText],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		life_cash = 0;
	};
};

//New addition for idiots.
if(side _source == civilian && _source != _unit && !local _source) then
{
	if(vehicle _source isKindOf "LandVehicle") then {
		[[2],"life_fnc_removeLicenses",_source,false] spawn life_fnc_MP;
	} else {
		[[3],"life_fnc_removeLicenses",_source,false] spawn life_fnc_MP;
	};
};

if(side _source == west && vehicle _source == _source && playerSide == civilian) then
{
	[[player,_source,true],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;
	[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
	//[[getPlayerUID player],"life_fnc_wantedPunish",false,false] spawn life_fnc_MP;
}
	else
{
	if(playerSide == civilian) then
	{
		[[getPlayerUID _unit],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
	};
};

_handle = [_unit] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};

life_carryWeight = 0;
life_thirst = 100;
life_hunger = 100;
life_use_atm = true;
life_cash = 0;

[] call SOCK_fnc_updateRequest;