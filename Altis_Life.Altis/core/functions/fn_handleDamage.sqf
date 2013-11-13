/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master damage handling system for Stratis / Altis Life
*/
private["_unit","_damage","_source","_projectile","_sel","_curWep"];
_unit = _this select 0;
_sel = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;
_curWep = "";
if(isPlayer _source && _source isKindOf "Man") then {_curWep = currentWeapon _source;};

/*
	This is obsolete

if(_projectile == "DemoCharge_Remote_Ammo" && _source != player && !life_hit_explosive) then
{
	life_hit_explosive = true;
	[] spawn
	{
		sleep 2;
		life_hit_explosive = false;
	};
	serv_killed = [_source,"213"];
	publicVariableServer "serv_killed";
};
*/

if(_source != _unit && isPlayer _source && side _source == west && _curWep in ["hgun_P07_snds_F","arifle_SDAR_F"]) then
{
	if(_projectile in ["B_9x21_Ball","B_556x45_dual"]) then
	{
		_damage = false;
		if(_curwep == "arifle_SDAR_F") then
		{
			if(!life_istazed && !(player getVariable["restrained",false]) && player distance _source < 100) then
			{
				player allowDamage false;
				if(typeOf (vehicle player) == "B_Quadbike_01_F") then
				{
					player action ["Eject",vehicle player];
				};
				
				if(vehicle player == player) then
				{
					[_unit,_source] spawn life_fnc_tazed;
				}
					else
				{
					player allowDamage true;
				};
			}
				else
			{
				player allowDamage true;
			};
		}
			else
		{
			if(!life_istazed && !(player getVariable["restrained",false]) && player distance _source < 100) then
			{
				player allowDamage false;
				if(typeOf (vehicle player) == "B_Quadbike_01_F") then
				{
					player action ["Eject",vehicle player];
				};
				
				if(vehicle player == player) then
				{
					[_unit,_source] spawn life_fnc_tazed;
				}
					else
				{
					player allowDamage true;
					//life_istazed = false;
				};
			}
				else
			{
				player allowDamage true;
			};
		};
	}
		else
	{
		player allowDamage true;
		if(_projectile == "") then
		{
			_damage = false;
		};
	};
};

[] call life_fnc_hudUpdate;
_damage;