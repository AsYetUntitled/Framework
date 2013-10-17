/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master damage handling system for Stratis / Altis Life
*/
private["_unit","_damage","_source","_projectile","_sel"];
_unit = _this select 0;
_sel = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

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

if(_source != _unit && isPlayer _source && side _source == west && (currentWeapon _source) == "hgun_P07_snds_F" && playerSide != west && _projectile == "B_9x21_Ball") then
{
	_damage = false;
	if(!life_istazed && !(player getVariable "restrained") && player distance _source < 35) then
	{
		player allowDamage false;
		if(typeOf (vehicle player) == "B_Quadbike_01_F") then
		{
			player action ["Eject", vehicle player];
		};
		if(vehicle player == player) then
		{
			[_unit,_source] spawn life_fnc_tazed;
		};
	};
};
//SDAR Taser Rifle
if(_source != _unit && isPlayer _source && side _source == west && (currentWeapon _source) == "arifle_SDAR_F" && playerSide != west && _projectile == "B_556x45_dual") then
{
	_damage = false;
	if(!life_istazed && !(player getVariable "restrained") && player distance _source < 70) then
	{
		player allowDamage false;
		if(typeOf (vehicle player) == "B_Quadbike_01_F") then
		{
			player action ["Eject", vehicle player];
		};
		if(vehicle player == player) then
		{
			[_unit,_source] spawn life_fnc_tazed;
		};
	};
};
[] call life_fnc_hudUpdate;
_damage;