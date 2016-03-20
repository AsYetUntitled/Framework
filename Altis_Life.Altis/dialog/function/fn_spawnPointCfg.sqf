#include "..\..\script_macros.hpp"
/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for available spawn points depending on the units side.

	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return","_spawnCfg","_curConfig","_name","_license","_level","_levelName","_levelValue","_levelType","_tempConfig","_flag"];
_side = param [0,civilian,[civilian]];

switch (_side) do {
    case west: {_side = "Cop"};
    case independent: {_side = "Medic"};
    default {_side = "Civilian"};
};

_return = [];

_spawnCfg = missionConfigFile >> "CfgSpawnPoints" >> _side;

for[{_i = 0},{_i < count(_spawnCfg)},{_i = _i + 1}] do {
    _flag = true;
    _tempConfig = [];
		_curConfig = (_spawnCfg select _i);
    _license = getText(_curConfig >> "license");
    _level = getArray(_curConfig >> "level");
		_levelName = SEL(_level,0);
		_levelType = SEL(_level,1);
		_levelValue = SEL(_level,2);

    if(!(EQUAL(_license,""))) then {
    	if(!(LICENSE_VALUE(_license,(M_CONFIG(getText,"Licenses",_license,"side"))))) then {_flag = false;};
    };

    if(!(_flag)) then {
    	if(!(EQUAL(_levelValue,-1))) then {
				_level = GVAR_MNS _levelName;
				if(typeName _level == typeName {}) then {_level = FETCH_CONST(_level);};
				_flag = switch(_levelType) do {
					case "SCALAR": {_level >= _levelValue};
					case "BOOL": {_level};
					case "EQUAL": {EQUAL(_level,_levelValue)};
					default {false};
				};
			};
    };

		if(_flag) then {
			_tempConfig pushBack getText(_curConfig >> "spawnMarker");
      _tempConfig pushBack getText(_curConfig >> "displayName");
      _tempConfig pushBack getText(_curConfig >> "icon");
      _return pushBack _tempConfig;
		};
};

if(playerSide == civilian) then {
  if(count life_houses > 0) then {
    {
      _pos = call compile format["%1",_x select 0];
      _house = nearestBuilding _pos;
      _houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

      _return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
    } foreach life_houses;
  };
};

_return;
