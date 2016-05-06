/*
	File: fn_whoDoneit.sqf
	Description: Save log file of units killed.
	Author: Å  ColinM - Help of BI Wiki & Forums.
	
	Credits:	KillzoneKid for his Debug_Console v3.0 file.
				Cuel from the BI Forums for his current & previous posts.
*/

/*
  Add to life_server\init.sqf -> fn_whoDoneit = compile preprocessFileLineNumbers "\life_server\Functions\Custom\fn_whoDoneit.sqf";
  
  Add to Altis_Life.Altis\initServer.sqf -> _this select 0 addMPEventHandler ["MPKilled", {_this call fn_whoDoneit}];
*/

if(isServer) then {
	private["_victim","_victimName","_killer","_killerName","_distance","_killerWep","_message","_weaponName","_killerVeh","_vehName"];
	_victim = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
	_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
	if(isNull _victim OR isNull _killer) exitWith {};

	_killerWep = currentWeapon _killer;
	_killerVeh = vehicle _killer;
	_distance = _killer distance _victim;
	_distance = floor(_distance);

	_weaponName = (configFile >> "cfgWeapons" >> _killerWep);
	_weaponName = format["%1",getText(_weaponName >> "displayName")];
	_killerWep = format["%1",_weaponName];

	if(_killerVeh != _killer) then {
		_vehName = getText(configFile >> "CfgVehicles" >> (typeOf _killerVeh) >> "displayName");
	} else {
		_vehName = "";
	};

	_victimName = name _victim;
	_killerName = name _killer;
	_message = "";
	switch (true) do {
		case (_victim == _killer): {
			_message = format["Suicide Message: %1 committed suicide (or disconnected)", _killerName]];
		};
		case (currentWeapon _killer != ""): {
			_message = format ["Weapon Death Message: %1 has killed %2 with Weapon %3 from Distance %4 Meters", _killerName, _victimName, _killerWep, _distance];
		};
		case (_killerVeh isKindOf "Car"): {
			_message = format ["Vehicle Death Message: %1 has knocked down %2 with a %3", _killerName, _victimName, _vehName];
		};
		case (_killerVeh isKindOf "Air"): {
			_message = format ["Aircraft Death Message: %1 has obliterated %2 with a %3", _killerName, _victimName, _vehName];
		};
		default {
			_message = format ["Death Message: %1 has killed %2", _killerName, _victimName;
		};
	};

	"extDB" callExtension format["1:deathmessages:%1",_message];
};
