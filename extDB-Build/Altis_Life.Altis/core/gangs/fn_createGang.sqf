#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls up the menu and creates the gang?
*/
private["_gangName","_length","_badChar","_chrByte","_allowed"];
disableSerialization;

_gangName = ctrlText (getControl(2520,2522));
_length = count (toArray(_gangName));
_chrByte = toArray (_gangName);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
if(_length > 32) exitWith {hint localize "STR_GNOTF_Over32"};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};
if(life_atmcash < (__GETC__(life_gangPrice))) exitWith {hint format[localize "STR_GNOTF_NotEnoughMoney",[((__GETC__(life_gangPrice))-life_atmcash)] call life_fnc_numberText];};

[[player,getPlayerUID player,_gangName],"TON_fnc_insertGang",false,false] spawn life_fnc_MP;
hint localize "STR_NOTF_SendingData";
closeDialog 0;
life_action_gangInUse = true;