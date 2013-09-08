/*
	File: fn_accType.sqf
	Author: TAW_Tonic
	
	Description:
	Checks what type of an attachment is passed and what it is compatible with.
	
	Returns:
	0: Unknown Error
	1: Primary
	2: Secondary
	3: Handgun
*/
private["_item","_type","_tmp","_ret","_arr"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
_type = [_this,1,0,[0]] call BIS_fnc_param;
if(_item == "" || _type == 0) exitWith {0};
_ret = 0;
_item = toLower(_item);

switch (_type) do
{
	case 201:
	{
		//Pistol first
		if(handgunWeapon player != "") then
		{
			_tmp = [(handgunWeapon player),"CfgWeapons"] call life_fnc_fetchCfgDetails;
			_arr = _tmp select 11;
			if(count _arr != 0) then
			{
				for "_i" from 0 to (count _arr)-1 do
				{
					_arr set[_i,toLower(_arr select _i)];
				};
				if(_item in _arr) then {_ret = 3;};
			};
		};
		
		//Secondary
		if(secondaryWeapon player != "") then
		{
			_tmp = [(secondaryWeapon player),"CfgWeapons"] call life_fnc_fetchCfgDetails;
			_arr = _tmp select 11;
			if(count _arr != 0) then
			{
				for "_i" from 0 to (count _arr)-1 do
				{
					_arr set[_i,toLower(_arr select _i)];
				};
				if(_item in _arr) then {_ret = 2;};
			};
		};
		
		//Primary
		if(primaryWeapon player != "") then
		{
			_tmp = [(primaryWeapon player),"CfgWeapons"] call life_fnc_fetchCfgDetails;
			_arr = _tmp select 11;
			if(count _arr != 0) then
			{
				for "_i" from 0 to (count _arr)-1 do
				{
					_arr set[_i,toLower(_arr select _i)];
				};
				if(_item in _arr) then {_ret = 1;};
			};
		};
	};
	
	case 301:
	{
		//Pistol first
		if(handgunWeapon player != "") then
		{
			_tmp = [(handgunWeapon player),"CfgWeapons"] call life_fnc_fetchCfgDetails;
			_arr = _tmp select 10;
			if(count _arr != 0) then
			{
				for "_i" from 0 to (count _arr)-1 do
				{
					_arr set[_i,toLower(_arr select _i)];
				};
				if(_item in _arr) then {_ret = 3;};
			};
		};
		
		//Secondary
		if(secondaryWeapon player != "") then
		{
			_tmp = [(secondaryWeapon player),"CfgWeapons"] call life_fnc_fetchCfgDetails;
			_arr = _tmp select 10;
			if(count _arr != 0) then
			{
				for "_i" from 0 to (count _arr)-1 do
				{
					_arr set[_i,toLower(_arr select _i)];
				};
				if(_item in _arr) then {_ret = 2;};
			};
		};
		
		//Primary
		if(primaryWeapon player != "") then
		{
			_tmp = [(primaryWeapon player),"CfgWeapons"] call life_fnc_fetchCfgDetails;
			_arr = _tmp select 10;
			if(count _arr != 0) then
			{
				for "_i" from 0 to (count _arr)-1 do
				{
					_arr set[_i,toLower(_arr select _i)];
				};
				if(_item in _arr) then {_ret = 1;};
			};
		};
	};
	
	case 101:
	{
		//Pistol first
		if(handgunWeapon player != "") then
		{
			_tmp = [(handgunWeapon player),"CfgWeapons"] call life_fnc_fetchCfgDetails;
			_arr = _tmp select 12;
			if(count _arr != 0) then
			{
				for "_i" from 0 to (count _arr)-1 do
				{
					_arr set[_i,toLower(_arr select _i)];
				};
				if(_item in _arr) then {_ret = 3;};
			};
		};
		
		//Secondary
		if(secondaryWeapon player != "") then
		{
			_tmp = [(secondaryWeapon player),"CfgWeapons"] call life_fnc_fetchCfgDetails;
			_arr = _tmp select 12;
			if(count _arr != 0) then
			{
				for "_i" from 0 to (count _arr)-1 do
				{
					_arr set[_i,toLower(_arr select _i)];
				};
				if(_item in _arr) then {_ret = 2;};
			};
		};
		
		//Primary
		if(primaryWeapon player != "") then
		{
			_tmp = [(primaryWeapon player),"CfgWeapons"] call life_fnc_fetchCfgDetails;
			_arr = _tmp select 12;
			if(count _arr != 0) then
			{
				for "_i" from 0 to (count _arr)-1 do
				{
					_arr set[_i,toLower(_arr select _i)];
				};
				if(_item in _arr) then {_ret = 1;};
			};
		};
	};
};

_ret;