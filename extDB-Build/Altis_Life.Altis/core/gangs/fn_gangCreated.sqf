#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Tells the player that the gang is created and throws him into it.
*/
private["_group"];
life_action_gangInUse = nil;

if(life_atmcash < (__GETC__(life_gangPrice))) exitWith {
	hint format["You do not have enough money in your bank account.\n\nYou lack: $%1",[((__GETC__(life_gangPrice))-life_atmcash)] call life_fnc_numberText];
	{(group player) setVariable[_x,nil,true];} foreach ["gang_id","gang_owner","gang_name","gang_members","gang_maxmembers","gang_bank"];
};

__SUB__(life_atmcash,(__GETC__(life_gangPrice)));

hint format["You have created the gang %1 for $%2",(group player) getVariable "gang_name",[(__GETC__(life_gangPrice))] call life_fnc_numberText];