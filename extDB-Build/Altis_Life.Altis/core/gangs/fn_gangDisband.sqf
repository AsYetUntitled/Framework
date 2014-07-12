#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the user about disbanding the gang and if the user accepts the gang will be
	disbanded and removed from the database.
*/
private["_action"];

_action = [
	"You are about to disband the gang, by disbanding the gang it will be removed from the database and the group will be dropped.<br/><br/>Are you sure you want to disband the group? You will not be refunded the price for creating it.",
	"Disband Gang",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;

if(_action) then {
	hint "Disbanding the gang....";
	[[grpPlayer],"TON_fnc_removeGang",false,false] spawn life_fnc_MP;
} else {
	hint "Disbanding cancelled";
};