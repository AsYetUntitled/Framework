#include "..\..\..\script_macros.hpp"
/*
	File: fn_openBankMenu.sqf
	Author: Travis Boi
	
	Description:
	Updates the player banking on Travis's Phone.
*/
private["_inv","_lic","_licenses","_near","_near_units","_mstatus","_shrt","_side","_struct"];
disableSerialization;

closeDialog 0;
createDialog 'Life_TR8_Banking';

//player name
ctrlSetText [1000, format ["%1", name player]];
ctrlSetText[1001,(format["$%1",[BANK] call life_fnc_numberText])];
ctrlSetText[1002,(format["$%1",[CASH] call life_fnc_numberText])];

_near_i = CONTROL(20055,2100);

//Near players
_near_units = [];
{ if(player distance _x < 10) then {_near_units pushBack _x};} foreach playableUnits;
{
	if(!isNull _x && alive _x && player distance _x < 10 && _x != player) then {
		_near_i lbAdd format["%1 - %2",_x GVAR ["realname",name _x], side _x];
		_near_i lbSetData [(lbSize _near_i)-1,str(_x)];
	};
} foreach _near_units;