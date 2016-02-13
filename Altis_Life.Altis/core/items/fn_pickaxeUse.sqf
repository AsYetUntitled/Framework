#include "..\..\script_macros.hpp"
/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for pickaxe in mining.
*/
closeDialog 0;
private["_mine","_itemWeight","_diff","_itemName"];
_mine = "";

switch (true) do {
	case (player distance (getMarkerPos "copper_mine") < 30): {_mine = ["copper_unrefined",2];};
	case (player distance (getMarkerPos "iron_mine") < 30): {_mine = ["iron_unrefined",2];};
	case (player distance (getMarkerPos "salt_mine") < 120) : {_mine = ["salt_unrefined",4];};
	case (player distance (getMarkerPos "sand_mine") < 75) : {_mine = ["sand",5];};
	case (player distance (getMarkerPos "diamond_mine") < 50): {_mine = ["diamond_uncut",1];};
	case (player distance (getMarkerPos "oil_field_1") < 40) : {_mine = ["oil_unprocessed",1];};
	case (player distance (getMarkerPos "oil_field_2") < 40) : {_mine = ["oil_unprocessed",1];};
	case (player distance (getMarkerPos "rock_quarry") < 50): {_mine = ["rock",2];};
	default {""};
};
//Mine check
if(EQUAL(_mine,"")) exitWith {hint localize "STR_ISTR_Pick_NotNear"};
if(vehicle player != player) exitWith {hint localize "STR_ISTR_Pick_MineVeh";};

_diff = [SEL(_mine,0),SEL(_mine,1),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(EQUAL(_diff,0)) exitWith {hint localize "STR_NOTF_InvFull"};

life_action_inUse = true;
for "_i" from 0 to 2 do {
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};

if(([true,SEL(_mine,0),_diff] call life_fnc_handleInv)) then {
	_itemName = M_CONFIG(getText,"VirtualItems",SEL(_mine,0),"displayName");
	titleText[format[localize "STR_ISTR_Pick_Success",(localize _itemName),_diff],"PLAIN"];
};

life_action_inUse = false;