#include "..\..\script_macros.hpp"
/*
    File: fn_spawnPointCfg.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master configuration for available spawn points depending on the units side.

    Return:
    [Spawn Marker,Spawn Name,Image Path]
*/
private ["_side","_return","_spawnCfg","_curConfig","_name","_licenses","_level","_levelName","_levelValue","_levelType","_tempConfig","_flag"];
_side = param [0,civilian,[civilian]];

switch (_side) do {
    case west: {_side = "Cop"};
    case independent: {_side = "Medic"};
    default {_side = "Civilian"};
};

_return = [];

_spawnCfg = missionConfigFile >> "CfgSpawnPoints" >> worldName >> _side;

for "_i" from 0 to count(_spawnCfg)-1 do {
    _flag = true;
    _tempConfig = [];
    _curConfig = (_spawnCfg select _i);
    private _conditions = getText(_curConfig >> "conditions");

    _flag = [_conditions] call life_fnc_levelCheck;

        if (_flag) then {
         _tempConfig pushBack getText(_curConfig >> "spawnMarker");
         _tempConfig pushBack getText(_curConfig >> "displayName");
         _tempConfig pushBack getText(_curConfig >> "icon");
         _return pushBack _tempConfig;
        };
};

if (playerSide isEqualTo civilian) then {
  if (count life_houses > 0) then {
    {
      _pos = call compile format ["%1",(_x select 0)];
      _house = nearestObject [_pos, "House"];
      _houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

      _return pushBack [format ["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
    } forEach life_houses;
  };
};

_return;
