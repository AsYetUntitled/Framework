/*
	File: fn_civFetchGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Fetches specific key items from the civilian for a persistent state.
*/
private["_ret","_uItems","_bItems"];
_ret = [];

_ret set[count _ret,uniform player];
_ret set[count _ret,backpack player];
_ret set[count _ret,goggles player];
_ret set[count _ret,headgear player];
_ret set[count _ret,assignedItems player];

_uItems = [];
_bItems = [];

if(uniform player != "") then
{
	{
		_info = [_x] call life_fnc_fetchCfgDetails;
		if((_info select 4) in [4096,131072]) then
		{
			_uItems set[count _uItems,_x];
		};
	} foreach (uniformItems player);
};

if(backpack player != "") then
{
	{
		_info = [_x] call life_fnc_fetchCfgDetails;
		if((_info select 4) in [4096,131072]) then
		{
			_uItems set[count _uItems,_x];
		};
	} foreach (backpackItems player);
};

_ret set[count _ret,_uItems];
_ret set[count _ret,_bItems];

civ_gear = _ret;