/*
	File: fn_whoDunnit
	Description: Save log file of units killed.
	Author: Å  ColinM - Help of BI Wiki & Forums.
	
	Credits:	KillzoneKid for his Debug_Console v3.0 file.
				Cuel from the BI Forums for his current & previous posts.
*/

/*
  Add to life_server\init.sqf -> fn_whoDoneit = compile preprocessFileLineNumbers "\life_server\Functions\Custom\fn_whoDunnit.sqf";
  
  Add to Altis_Life.Altis\initPlayerServer.sqf -> _this select 0 addMPEventHandler ["MPKilled", {_this call fn_whoDoneit}];
*/

if(isServer) then 
{
	private["_victim","_killer","_distance","_killerWep","_message","_weaponName","_killerVeh","_vehName"];
	_victim = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
	_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
	
	_distance = _killer distance _victim;
	_distance = floor(_distance);
	
	_killerWep = currentWeapon _killer;
	_weaponName = (configFile >> "cfgWeapons" >> _killerWep);
	_weaponName = format["%1",getText(_weaponName >> "displayName")];
	_killerWep = format["%1",_weaponName];
	
	_killerVeh = vehicle _killer;
	_vehName = getText(configFile >> "CfgVehicles" >> (typeOf _killerVeh) >> "displayName");
	_message = "";
	
	/*
	Let's just fix the player name grab issue
	_query = format["SELECT name FROM players WHERE playerid in ('%1,%2')",getPlayerUID _victim, getPlayerUID _killer];
	waitUntil {!Forgot_the_fucking_variable_name};
	_queryResult = [_query,2,true];
	*/
	
	switch (true) do 
	{
		case (_victim == _killer):
		{
			_message = format["Suicide Message: %1 has killed %1 (Possibly suicide or disconnect)", _queryResult select 0, _queryResult select 1]];
		};
		case (vehicle _killer isKindOf "Car"):
		{
			_message = format ["Vehicle Death Message: %1 has knocked down %2 with a %3", _queryResult select 0, _queryResult select 1, _vehName];
		};
		case (vehicle _killer isKindOf "Air"):
		{
			_message = format ["Aircraft Death Message: %1 has obliterated %2 with a %3", _queryResult select 0, _queryResult select 1, _vehName];
		};
		case (currentWeapon _killer != ""):
		{
			_message = format ["Weapon Death Message: %1 has killed %2 with Weapon %3 from Distance %4 Meters", _queryResult select 0, _queryResult select 1, _killerWep, _distance];
		};
		default
		{
			_message = format ["Death Message: %1 has killed %2",_queryResult select 0, _queryResult select 1];
		};
	};
	"extDB" callExtension format["1:deathmessages:%1",_message];
};
