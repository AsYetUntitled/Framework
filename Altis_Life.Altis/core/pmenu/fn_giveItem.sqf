#include "..\..\script_macros.hpp"
/*
	File: fn_giveItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected item & amount to the selected player and
	removes the item & amount of it from the players virtual
	inventory.
*/
private["_unit","_val"];
_val = ctrlText 3004;
ctrlShow[1602,false];
if((lbCurSel 2100) == -1) exitWith {hint "No one was selected!";
ctrlShow[1602,true];};
_unit = lbData [2100,lbCurSel 2100];
_unit = call compile format["%1",_unit];

if((lbCurSel 1500) == -1) exitWith {hint "You didn't select an item you wanted to give.";ctrlShow[1602,true];};

_item = lbData [1500,(lbCurSel 1500)];
if(isNil "_unit") exitWith {ctrlShow[1602,true];};
if(_unit == player) exitWith {ctrlShow[1602,true];};
if(isNull _unit) exitWith {ctrlShow[1602,true];};

//A series of checks *ugh*
if(!([_val] call TON_fnc_isnumber)) exitWith {hint "You didn't enter an actual number format.";ctrlShow[1602,true];};
if(parseNumber(_val) <= 0) exitWith {hint "You need to enter an actual amount you want to give.";ctrlShow[1602,true];};
if(isNil "_unit") exitWith {ctrlShow[10892,true]; hint "The selected player is not within range";};
if(!([false,_item,(parseNumber _val)] call life_fnc_handleInv)) exitWith {hint "Couldn't give that much of that item, maybe you don't have that amount?";ctrlShow[1602,true];};

[_unit,_val,_item,player] remoteExecCall ["life_fnc_receiveItem",_unit];
_type = M_CONFIG(getText,"VirtualItems",_item,"displayName");
hint format["You gave %1 %2 %3",_unit getVariable["realname",name _unit],_val,(localize _type)];
[] call life_fnc_p_updateMenu;

ctrlShow[1602,true];