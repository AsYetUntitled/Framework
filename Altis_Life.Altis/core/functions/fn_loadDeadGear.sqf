#include "..\..\script_macros.hpp"
/*
    File: fn_loadDeadGear.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    BLAH
*/
params [
    ["_loadout",[],[[]]]
];

_loadout params [
	"_primary",
	"_launcher",
	"_handgun",
	"_magazines",
	"_uniform",
	"_vest",
	"_backpack",
	"_items",
	"_primitems",
	"_secitems",
	"_handgunitems",
	"_uitems",
	"_vitems",
	"_bitems",
	"_headgear",
	"_goggles"
];

//Strip the unit down
RemoveAllWeapons player;
{player removeMagazine _x;} forEach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
    player unassignItem _x;
    player removeItem _x;
} forEach (assignedItems player);

//Add the gear
if !(_uniform isEqualTo "") then {_handle = [_uniform,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if !(_vest isEqualTo "") then {_handle = [_vest,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if !(_backpack isEqualTo "") then {_handle = [_backpack,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
{
    _handle = [_x,true,false,false,false] spawn life_fnc_handleItem;
    waitUntil {scriptDone _handle};
} forEach _magazines;

if !(_primary isEqualTo "") then {[_primary,true,false,false,false] spawn life_fnc_handleItem;};
if !(_launcher isEqualTo "") then {[_launcher,true,false,false,false] spawn life_fnc_handleItem;};
if !(_handgun isEqualTo "") then {[_handgun,true,false,false,false] spawn life_fnc_handleItem;};

{_handle = [_x,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};} forEach _items;
{[_x,true,false,false,true] call life_fnc_handleItem;} forEach (_uitems);
{[_x,true,false,false,true] call life_fnc_handleItem;} forEach (_vitems);
{[_x,true,true,false,false] call life_fnc_handleItem;} forEach (_bitems);
{[_x,true,false,true,false] call life_fnc_handleItem;} forEach (_primitems);
{[_x,true,false,true,false] call life_fnc_handleItem;} forEach (_secitems);
{[_x,true,false,true,false] call life_fnc_handleItem;} forEach (_handgunitems);

if !(_headgear isEqualTo "") then {player addHeadGear _headgear};
if !(_goggles isEqualTo "") then {player addGoggles _goggles};
