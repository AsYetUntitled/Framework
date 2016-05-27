#include "..\..\script_macros.hpp"
/*
    File: fn_spawnPointCfg.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master configuration for available spawn points depending on the units side.

    Return:
    [Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return","_spawnCfg","_curConfig","_name","_licenses","_level","_levelName","_levelValue","_levelType","_tempConfig","_flag"];
_side = param [0,civilian,[civilian]];

switch (_side) do {
    case west: {_side = "Cop"};
    case independent: {_side = "Medic"};
    default {_side = "Civilian"};
};

_return = [];

_spawnCfg = missionConfigFile >> "CfgSpawnPoints" >> _side;

for "_i" from 0 to count(_spawnCfg)-1 do {
    _flag = true;
    _tempConfig = [];
        _curConfig = (_spawnCfg select _i);
    _licenses = getArray(_curConfig >> "licenses");
    _level = getArray(_curConfig >> "level");
        _levelName = (_level select 0);
        _levelType = (_level select 1);
        _levelValue = (_level select 2);

    {
      if (!((_x select 0) isEqualTo "")) then {
        _licenseName = (_x select 0);
        _licenseType = (_x select 1);
        if (_licenseType isEqualTo 0) then {
          if (LICENSE_VALUE(_licenseName,(M_CONFIG(getText,"Licenses",_licenseName,"side")))) exitWith {_flag = false};
        } else {
          if (!(LICENSE_VALUE(_licenseName,(M_CONFIG(getText,"Licenses",_licenseName,"side"))))) exitWith {_flag = false};
        };
      };
    } forEach _licenses;

    if (_flag) then {
        if (!(_levelValue isEqualTo -1)) then {
                _level = missionNamespace getVariable _levelName;
                if (_level isEqualType {}) then {_level = FETCH_CONST(_level);};
                _flag = switch (_levelType) do {
                    case "SCALAR": {_level >= _levelValue};
                    case "BOOL": {_level};
                    case "EQUAL": {_level isEqualTo _levelValue};
                    case "INVERSE": {_level <= _levelValue};
                    default {false};
                };
            };
    };

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
      _pos = call compile format["%1",(_x select 0)];
      _house = nearestObject [_pos, "House"];
      _houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

      _return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
    } forEach life_houses;
  };
};

_return;
