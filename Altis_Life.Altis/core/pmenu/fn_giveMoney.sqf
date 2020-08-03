#include "..\..\script_macros.hpp"
/*
    File: fn_giveMoney.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Gives the selected amount of money to the selected player.
*/
private ["_unit","_amount"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if ((lbCurSel 2022) isEqualTo -1) exitWith {hint localize "STR_NOTF_noOneSelected";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format ["%1",_unit];
if (isNil "_unit") exitWith {ctrlShow[2001,true];};
if (_unit == player) exitWith {ctrlShow[2001,true];};
if (isNull _unit) exitWith {ctrlShow[2001,true];};

//A series of checks *ugh*
if (!life_use_atm) exitWith {hint localize "STR_NOTF_recentlyRobbedBank";ctrlShow[2001,true];};
if (!([_amount] call life_util_fnc_isNumber)) exitWith {hint localize "STR_NOTF_notNumberFormat";ctrlShow[2001,true];};
if (parseNumber(_amount) <= 0) exitWith {hint localize "STR_NOTF_enterAmount";ctrlShow[2001,true];};
if (parseNumber(_amount) > CASH) exitWith {hint localize "STR_NOTF_notEnoughtToGive";ctrlShow[2001,true];};
if (isNull _unit) exitWith {ctrlShow[2001,true];};
if (isNil "_unit") exitWith {ctrlShow[2001,true]; hint localize "STR_NOTF_notWithinRange";};

hint format [localize "STR_NOTF_youGaveMoney",[(parseNumber(_amount))] call life_fnc_numberText,_unit getVariable ["realname",name _unit]];
CASH = CASH - (parseNumber(_amount));
[0] call SOCK_fnc_updatePartial;

[_unit,_amount,player] remoteExecCall ["life_fnc_receiveMoney",_unit];
[] call life_fnc_p_updateMenu;

ctrlShow[2001,true];