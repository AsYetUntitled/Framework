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
if(_length > 32) exitWith {hint "You can't have a gang name longer then 32 characters."};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
if(_badChar) exitWith {hint "You have invalid characters in your gang name. It can only consist of Numbers & letters with an underscore";};
if(life_atmcash < (__GETC__(life_gangPrice))) exitWith {hint format["You do not have enough money in your bank account.\n\nYou lack: $%1",[((__GETC__(life_gangPrice))-life_atmcash)] call life_fnc_numberText];};

[[player,getPlayerUID player,_gangName],"TON_fnc_insertGang",false,false] spawn life_fnc_MP;
hint "Sending information to server please wait.....";
closeDialog 0;
life_action_gangInUse = true;