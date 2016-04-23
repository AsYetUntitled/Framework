#include "..\..\script_macros.hpp"
/*
	File: fn_questionDealer.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Questions the drug dealer and sets the sellers wanted.
*/
private["_sellers","_crimes","_names"];
_sellers = (SEL(_this,0)) GVAR ["sellers",[]];
if(EQUAL(count _sellers,0)) exitWith {hint localize "STR_Cop_DealerQuestion"}; //No data.
life_action_inUse = true;
_crimes = LIFE_SETTINGS(getArray,"crimes");

_names = "";
{
	_val = 0;
	if(SEL(_x,2) > 150000) then {
		_val = round((SEL(_x,2)) / 16);
	} else {
		_val = ["483",_crimes] call TON_fnc_index;
		_val = SEL(SEL(_crimes,_val),1);
		if(typeName _val == "STRING") then {
			_val = parseNumber _val;
		};
	};
	[SEL(_x,0),SEL(_x,1),"483",_val] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	ADD(_names,format["%1<br/>",SEL(_x,1)]);
} forEach _sellers;

hint parseText format[(localize "STR_Cop_DealerMSG")+ "<br/><br/>%1",_names];
SEL(_this,0) SVAR ["sellers",[],true];
life_action_inUse = false;
