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
_val = ctrlText 2010;
ctrlShow[2002,false];
if ((lbCurSel 2023) isEqualTo -1) exitWith {hint localize "STR_NOTF_noOneSelected";
ctrlShow[2002,true];};
_unit = lbData [2023,lbCurSel 2023];
_unit = call compile format["%1",_unit];

if ((lbCurSel 2005) isEqualTo -1) exitWith {hint localize "STR_NOTF_didNotSelectItemToGive";ctrlShow[2002,true];};

_item = lbData [2005,(lbCurSel 2005)];
if (isNil "_unit") exitWith {ctrlShow[2002,true];};
if (_unit == player) exitWith {ctrlShow[2002,true];};
if (isNull _unit) exitWith {ctrlShow[2002,true];};

//A series of checks *ugh*
if (!([_val] call TON_fnc_isnumber)) exitWith {hint localize "STR_NOTF_notNumberFormat";ctrlShow[2002,true];};
if (parseNumber(_val) <= 0) exitWith {hint localize "STR_NOTF_enterAmountGive";ctrlShow[2002,true];};
if (isNil "_unit") exitWith {ctrlShow[2001,true]; hint localize "STR_NOTF_notWithinRange";};
if (!([false,_item,(parseNumber _val)] call life_fnc_handleInv)) exitWith {hint localize "STR_NOTF_couldNotGive";ctrlShow[2002,true];};

[_unit,_val,_item,player] remoteExecCall ["life_fnc_receiveItem",_unit];
_type = M_CONFIG(getText,"VirtualItems",_item,"displayName");
hint format [localize "STR_NOTF_youGaveItem",_unit getVariable["realname",name _unit],_val,(localize _type)];
[] call life_fnc_p_updateMenu;

ctrlShow[2002,true];