/*
	File: fn_fetchDeadGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Fetches gear off of a body.
*/
private["_primary,_launcher","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_headgear","_goggles","_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
_primitems = [];
_secitems = [];
_handgunitems = [];
_primary = primaryWeapon _unit;
_launcher = secondaryWeapon _unit;
_handgun = handGunWeapon _unit;
_magazines = [];
_uniform = uniform _unit;
_vest = vest _unit;
_backpack = backpack _unit;
_items = assignedItems _unit;
if(primaryWeapon _unit != "") then {_primitems = primaryWeaponItems _unit;};
if(handgunWeapon _unit != "") then {_handgunItems = handgunItems _unit;};
_headgear = headgear _unit;
_goggles = goggles _unit;
_uitems = [];
_vitems = [];
_bitems = [];
if(_uniform != "") then {{_uitems set[count _uitems,_x];} foreach (uniformItems _unit);};
if(_vest != "") then {{_vitems set[count _vitems,_x];} foreach (vestItems _unit);};
if(_backpack != "") then {{_bitems set[count _bitems,_x];} foreach (backPackItems _unit);};
	
if(primaryWeapon _unit != "") then
{
	_unit selectWeapon (primaryWeapon _unit);
	if(currentMagazine _unit != "") then
	{
		_magazines set[count _magazines,currentMagazine _unit];
	};
};
		
if(secondaryWeapon _unit != "") then
{
	_unit selectWeapon (secondaryWeapon _unit);
	if(currentMagazine _unit != "") then
	{
		_magazines set[count _magazines,currentMagazine _unit];
	};
};
		
if(handgunWeapon _unit != "") then
{
	_unit selectWeapon (handgunWeapon _unit);
	if(currentMagazine _unit != "") then
	{
		_magazines set[count _magazines,currentMagazine _unit];
	};
};
_unit selectWeapon (primaryWeapon _unit);

if(isNil "_handgunItems") then {_handgunItems = ["","",""];};
[_primary,_launcher,_handgun,_magazines,_uniform,_vest,_backpack,_items,_primitems,_secitems,_handgunitems,_uitems,_vitems,_bitems,_headgear,_goggles];