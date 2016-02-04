/*
	Author: Bryan "Tonic" Boardwine

	Description:
	WHAT THE HELL DO YOU THINK IT DOES?!?!!??!?!!?!??!
*/
private["_queryResult","_query","_count","_count2","_container"];

_count = (["SELECT COUNT(*) FROM houses WHERE owned='1'",2] call DB_fnc_asyncCall) select 0;

for [{_x=0},{_x<=_count},{_x=_x+10}] do {

	_query = format["SELECT houses.id, houses.pid, houses.pos, players.name FROM houses INNER JOIN players ON houses.pid=players.playerid WHERE houses.owned='1' LIMIT %1,10",_x];
	_queryResult = [_query,2,true] call DB_fnc_asyncCall;
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

_count2 = (["SELECT COUNT(*) FROM containers WHERE owned='1'",2] call DB_fnc_asyncCall) select 0;

for [{_x=0},{_x<=_count2},{_x=_x+10}] do {

	_query = format["SELECT containers.id, containers.pid, containers.pos FROM containers INNER JOIN players ON containers.pid=players.playerid WHERE containers.owned='1' LIMIT %1,10",_x];
	_queryResult = [_query,2,true] call DB_fnc_asyncCall;
	if(count _queryResult == 0) exitWith {};
	{
		_pos = call compile format["%1",_x select 2];
		_id = _x select 0;
		_owner = _x select 1;
		sleep 3;
		_containers = [_pos, ["Box_IND_Grenades_F","B_supplyCrate_F"], 7] call life_fnc_nearestObjects;
		{
			_x setVariable["container_owner",[_owner],true];
			_x setVariable["container_id",_id,true];
		} foreach _containers;
	} foreach _queryResult;
};
