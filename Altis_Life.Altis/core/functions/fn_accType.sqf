#include "..\..\script_macros.hpp"
/*
	File: fn_accType.sqf
	Author: Bryan "Tonic" Boardwine
	
	*Functionality from Virtual Ammobox System*
	
	Description:
	Checks what type of an attachment is passed and what it is compatible with.
	Should now be compatible with the new compatibleItems class structure... This was not a fun task but thankfully
	Robalo gave me some code that showed me the way. If it isn't 100% compatible then IDFK. The foreach in a foreach drove me nuts and
	not the best way to do things, I really don't know what I was thinking but doing PHP code for two weeks and playing GTA V tends to make you
	forget things.... Wow what a ramble... blah blah blah.
	
	Returns:
	0: Unknown Error
	1: Primary
	2: Secondary
	3: Handgun
*/
private["_item","_type","_tmp","_ret","_weaponArray"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
_type = [_this,1,0,[0]] call BIS_fnc_param;
if(EQUAL(_item,"") || EQUAL(_type,0)) exitWith {0};
_ret = 0;

_weaponArray = [RIFLE, LAUNCHER, PISTOL];
{
	if(!(EQUAL(_ret,0))) exitWith {}; //Make sure we exit the loop since there was already a match.
	if(!(EQUAL(_x,""))) then
	{
		_weapon = _x;
		_cfgInfo = [_weapon,CONFIG_WEAPONS] call life_fnc_fetchCfgDetails;
		
		_legacyItems = (SEL(_cfgInfo,10) + SEL(_cfgInfo,11) + SEL(_cfgInfo,12));
		_newItems = SEL(_cfgInfo,14);
		
		//Check Legacy Items first
		if(count _legacyItems > 0) then {
			for "_i" from 0 to (count _legacyItems)-1 do {
				_legacyItems set[_i,toLower(SEL(_legacyItems,_i))];
			};
			
			if((toLower _item) in _legacyItems) exitWith {_ret = switch(_weapon) do {case (RIFLE): {1};case (LAUNCHER) : {2};case (PISTOL): {3};default {0};};};
		};
		
		//Check new compatibleItems class structure
		if(count _newItems > 0) then {
			//This gets weird with foreach in foreach :\
			{
				if(!(EQUAL(_ret,0))) exitWith {};
				_cfg = FETCH_CONFIG4(getNumber,CONFIG_WEAPONS,_weapon,"WeaponSlotsInfo",_x,"compatibleItems",_item);
				
				if(isNil "_cfg") then {_cfg = 0;};
				if(EQUAL(_cfg,1)) exitWith {
					_ret = switch(_weapon) do {case (RIFLE): {1};case (LAUNCHER) : {2};case (PISTOL): {3};default {0};};
				};
			} foreach _newItems;
			if(!(EQUAL(_ret,0))) exitWith {}; //Make sure we exit the loop
		};
	};
} foreach _weaponArray;

_ret;