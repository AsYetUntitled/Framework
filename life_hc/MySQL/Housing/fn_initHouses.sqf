/*
	File: fn_initHouses.sqf
	Author: Bryan "Tonic" Boardwine

	This file is for Nanou's HeadlessClient.
	
	Description:
	Initalizes house setup when player joins the server.
*/
private["_queryResult","_query","_count"];
_count = (["SELECT COUNT(*) FROM houses WHERE owned='1'",2] call HC_fnc_asyncCall) select 0;

for [{_x=0},{_x<=_count},{_x=_x+10}] do {
	_query = format["SELECT houses.id, houses.pid, houses.pos, players.name FROM houses, players WHERE houses.owned='1' LIMIT %1,10",_x];
	_queryResult = [_query,2,true] call HC_fnc_asyncCall;
	if(count _queryResult == 0) exitWith {};
	{
		_pos = call compile format["%1",_x select 2];
		_house = nearestBuilding _pos;
		_house setVariable["house_owner",[_x select 1,_x select 3],true];
		_house setVariable["house_id",_x select 0,true];
		_house setVariable["locked",true,true]; //Lock up all the stuff.
		_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
		for "_i" from 1 to _numOfDoors do {
			_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
		};
		} foreach _queryResult;
};
