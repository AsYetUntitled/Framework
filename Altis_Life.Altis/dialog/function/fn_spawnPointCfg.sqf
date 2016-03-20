/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return","_spawnCfg","_curConfig","_name","_condition","_tempConfig"];
_side = param [0,civilian,[civilian]];

switch (_side) do {
    case west: {_side = "Cop"};
    case civilian: {_side = "Civilian"};
    case independent: {_side = "Medic"};
    default {_side = "Civilian"};
};

_return = [];

_spawnCfg = missionConfigFile >> "CfgSpawnPoints" >> _side;

for[{_i = 0},{_i < count(_spawnCfg)},{_i = _i + 1}] do {
    _tempConfig = [];
	_curConfig = (_spawnCfg select _i);
    _condition = getText(_curConfig >> "condition");
    if(call compile _condition) then 
    {
        _tempConfig pushBack getText(_curConfig >> "spawnMarker");
        _tempConfig pushBack getText(_curConfig >> "displayName");
        _tempConfig pushBack getText(_curConfig >> "icon");
        _return pushBack _tempConfig;
    };
};

if(count life_houses > 0) then 
{
    {
    _pos = call compile format["%1",_x select 0];
    _house = nearestBuilding _pos;
    _houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
    _return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
    } foreach life_houses;
};

_return;