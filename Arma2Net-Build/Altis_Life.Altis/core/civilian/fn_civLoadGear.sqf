/*
	File: fn_civLoadGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads saved civilian gear, this is limited for a reason and that's balance.
*/
private["_itemArray","_uniform","_backpack","_goggles","_headgear","_itemArray","_uItems","_bItems","_handle"];
_itemArray = civ_gear;
waitUntil {!(isNull (findDisplay 46))};
if(count _itemArray == 0) exitWith 
{
	if(headGear player != "") then {removeHeadgear player;};
	if(goggles player != "") then {removeGoggles player;};
};

//Strip the unit down
RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);

_uniform = [_itemArray,0,"",[""]] call BIS_fnc_param;
_backpack = [_itemArray,1,"",[""]] call BIS_fnc_param;
_goggles = [_itemArray,2,"",[""]] call BIS_fnc_param;
_headgear = [_itemArray,3,"",[""]] call BIS_fnc_param;
_items = [_itemArray,4,[],[[]]] call BIS_fnc_param;
_uItems = [_itemArray,5,[],[[]]] call BIS_fnc_param;
_bItems = [_itemArray,6,[],[[]]] call BIS_fnc_param;

if(_uniform != "") then {_handle = [_uniform,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_backpack != "") then {_handle = [_backpack,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_goggles != "") then {_handle = [_goggles,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_headgear != "") then {_handle = [_headgear,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
{_handle = [_x,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};} foreach _items;
{[_x,true,false,false,true] call life_fnc_handleItem;} foreach (_uItems);
{[_x,true,true,false,false] call life_fnc_handleItem;} foreach (_bItems);